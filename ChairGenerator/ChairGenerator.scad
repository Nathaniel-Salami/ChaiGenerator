use <StyleGenerators/PartGenerators/Parts/Libraries/Utilities/Utilities.scad>
use <StyleGenerators/PartGenerators/Parts/Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <StyleGenerators/PartGenerators/Parts/Libraries/Sides.scad>
use <StyleGenerators/PartGenerators/Parts/SeatGenerator.scad>
use <StyleGenerators/PartGenerators/Parts/LegGenerator.scad>
use <StyleGenerators/PartGenerators/Parts/SideGenerator.scad>
use <StyleGenerators/PartGenerators/Parts/BackGenerator.scad>
use <StyleGenerators/PartGenerators/Top.scad>
use <StyleGenerators/PartGenerators/Middle.scad>
use <StyleGenerators/PartGenerators/Bottom.scad>
use <StyleGenerators/Stool.scad>
use <StyleGenerators/SimpleChair.scad>
use <StyleGenerators/ArmChair.scad>
use <StyleGenerators/Bench.scad>

//***CHAIR GENERATOR***//

/*
//main center and volume
//center used for constructing the seats 
center0 = [0, 0, 0];

//dimensions of the space the seats occupy 
volume0 = [50, 60, 50];

simple_v = [round(rands(40, 50, 1)[0]), round(rands(40, 50, 1)[0]), round(rands(75, 85, 1)[0])];
arm_v = [round(rands(40, 50, 1)[0]), round(rands(55, 65, 1)[0]), round(rands(45, 55, 1)[0])];
stool_v = [round(rands(40, 40, 1)[0]), round(rands(35, 45, 1)[0]), round(rands(95, 105, 1)[0])];
bench_v = [round(rands(40, 50, 1)[0]), round(rands(75, 85, 1)[0]), round(rands(35, 45, 1)[0])];

random_volumes = [simple_v, arm_v, stool_v, bench_v];

random_volume = random_volumes[round(rands(0, 3, 1)[0])];

random_center = [random_volume[0]/2, random_volume[1]/2, random_volume[2]/2];

echo(random_volume);



//style of chair generated
style0 = "angular";

//type of chair to be generated 
type0 = "bench";

/TEST/
//chairGenerator(center0, volume0, type0, style0);
//chairGenerator(center0, volume0, "undefined", "undefined");
chairGenerator(random_center, random_volume, "undefined", "undefined");

//visualization(center0, stool_v);

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
            
            width = volume[1];
            depth = volume[2];
            
            //detemines the best type depending on the volume given 
            //stool
            if (depth >= width*2) {
                stoolChairGenerator(center, volume, style);
            }
            
            //bench
            else if (width >= depth*2) {
                benchGenerator(center, volume, "undefined", style);
            }
            
            //simple or arm char style
            else {
                //simple
                if (depth > width) {
                    simpleChairGenerator (center, volume, style);
                }
                
                //arm chair
                else if (width > depth) {
                    armChairGenerator(center, volume, style);
                }
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
            //echo(random_type);
            
            width = volume[1];
            depth = volume[2];
            
            //detemines the best type depending on the volume given 
            //stool
            if (depth >= width*2) {
                random_type_style = chairTypes[2][1][round(rands(0, (chairTypes[2][2])-1, 1)[0])];
                
                stoolChairGenerator(center, volume, random_type_style);
            }
            
            //bench
            else if (width >= depth*2) {
                random_type_style = chairTypes[3][1][round(rands(0, (chairTypes[3][2])-1, 1)[0])];
                
                benchGenerator(center, volume, "undefined", random_type_style);
            }
            
            //simple or arm char style
            else {
                //simple
                if (depth > width) {
                    random_type_style = chairTypes[0][1][round(rands(0, (chairTypes[0][2])-1, 1)[0])];
                
                    simpleChairGenerator (center, volume, random_type_style);
                }
                
                //arm chair
                else if (width > depth) {
                    random_type_style = chairTypes[1][1][round(rands(0, (chairTypes[1][2])-1, 1)[0])];
                
                    armChairGenerator(center, volume, random_type_style);
                }
            }
            
            
            //simple chair type
            
        }
    }
}
