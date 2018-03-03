use <simple_chair.scad>
use <stool_chair.scad>
use <arm_chair.scad>
use <bench.scad>



//main center and volume
//center used for constructing the seats 
center0 = [25, 40, 25];

//dimensions of the space the seats occupy 
volume0 = [50, 50, 50];

//style of chair generated
style0 = "angular";

//type of chair to be generated 
type0 = "bench";

/***TEST***/
//chairGenerator(center0, volume0, type0, style0);
chairGenerator(center0, volume0, "undefined", "undefined");

module chairGenerator(center, volume, type, style) {
    chairTypes = [["simple", ["angular", "rounded"],          2],
                  ["arm",    ["armChair", "angular"],         2],
                  ["stool",  ["stool", "angular", "rounded"], 3], 
                  ["bench",  ["bench", "angular"],            2]];

    NUMBER_OF_TYPES = 4;
    
    random_type_style = chairTypes[0][1][round(rands(0, (chairTypes[0][2])-1, 1)[0])];
    echo(random_type_style);
    
    //defined style
    if (style != "undefined") {
        
        //defined type
        if (type != "undefined") {
            
            //simple chair type
            if (type == "simple") {
                simpleChairGenerator (center, volume, style);
            }
            
            //arm chair type
            else if (type == "arm") {
                armChairGenerator(center, volume, style);
            }
            
            //stool type
            else if (type == "stool") {
                stoolChairGenerator(center, volume, style);
            }
            
            //bench type
            else if (type == "bench") {
                benchGenerator(center, volume, "undefined", style);
            }            
        }
        
        //undefined type
        else {
            random_type = chairTypes[round(rands(0, NUMBER_OF_TYPES-1, 1)[0])];
            //echo(random_type);
            
            //simple chair type
            if (random_type[0] == "simple") {
                simpleChairGenerator (center, volume, style);
            }
            
            //arm chair type
            else if (random_type[0] == "arm") {
                armChairGenerator(center, volume, style);
            }
            
            //stool type
            else if (random_type[0] == "stool") {
                stoolChairGenerator(center, volume, style);
            }
            
            //bench type
            else if (random_type[0] == "bench") {
                benchGenerator(center, volume, "undefined", style);
            }   
        }
    }
    
    //undefined style
    else {
        //defined type
        if (type != "undefined") {
            
            //simple chair type
            if (type == "simple") {
                random_type_style = chairTypes[0][1][round(rands(0, (chairTypes[0][2])-1, 1)[0])];
                
                simpleChairGenerator (center, volume, random_type_style);
            }
            
            //arm chair type
            else if (type == "arm") {
                random_type_style = chairTypes[1][1][round(rands(0, (chairTypes[1][2])-1, 1)[0])];
                
                armChairGenerator(center, volume, random_type_style);
            }
            
            //stool type
            else if (type == "stool") {
                random_type_style = chairTypes[2][1][round(rands(0, (chairTypes[2][2])-1, 1)[0])];
                
                stoolChairGenerator(center, volume, random_type_style);
            }
            
            //bench type
            else if (type == "bench") {
                random_type_style = chairTypes[3][1][round(rands(0, (chairTypes[3][2])-1, 1)[0])];
                
                benchGenerator(center, volume, "undefined", random_type_style);
            }            
        }
        
        //undefined type
        else {
            random_type = chairTypes[round(rands(0, NUMBER_OF_TYPES-1, 1)[0])];
            echo(random_type);
            
            //simple chair type
            if (random_type[0] == "simple") {
                random_type_style = chairTypes[0][1][round(rands(0, (chairTypes[0][2])-1, 1)[0])];
                
                simpleChairGenerator (center, volume, random_type_style);
            }
            
            //arm chair type
            else if (random_type[0] == "arm") {
                random_type_style = chairTypes[1][1][round(rands(0, (chairTypes[1][2])-1, 1)[0])];
                
                armChairGenerator(center, volume, random_type_style);
            }
            
            //stool type
            else if (random_type[0] == "stool") {
                random_type_style = chairTypes[2][1][round(rands(0, (chairTypes[2][2])-1, 1)[0])];
                
                stoolChairGenerator(center, volume, random_type_style);
            }
            
            //bench type
            else if (random_type[0] == "bench") {
                random_type_style = chairTypes[3][1][round(rands(0, (chairTypes[3][2])-1, 1)[0])];
                
                benchGenerator(center, volume, "undefined", random_type_style);
            }   
        }
    }
}
