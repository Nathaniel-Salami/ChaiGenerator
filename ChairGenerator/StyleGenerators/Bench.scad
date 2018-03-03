use <PartGenerators/Parts/Libraries/Utilities/Utilities.scad>
use <PartGenerators/Parts/Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <PartGenerators/Parts/Libraries/Sides.scad>
use <PartGenerators/Parts/SeatGenerator.scad>
use <PartGenerators/Parts/LegGenerator.scad>
use <PartGenerators/Parts/SideGenerator.scad>
use <PartGenerators/Parts/BackGenerator.scad>
use <PartGenerators/Top.scad>
use <PartGenerators/Middle.scad>
use <PartGenerators/Bottom.scad>

//***BENCH***//

/*
//main center and volume
//center used for constructing the seats 
center0 = [25, 50, 25];

//dimensions of the space the seats occupy 
volume0 = [50, 100, 50];

//visualization (center0, volume0);

//style of chair generated
style0 = "bench";

//type of chair to be generated 
benchType0 = "simple";

//seat and seat percentages
back_p_test = 80;
seat_p_test = 100 - back_p_test;

back_seat_p_test = [back_p_test, seat_p_test];


//TEST
//benchGenerator(center0, volume0, benchType0, style0, back_seat_p_test);
benchGenerator(center0, volume0, "undefined", "undefined", "undefined");



module benchGenerator(center, volume, type = "undefined", style = "undefined", back_seat_p = "undefined") {
    
    echo("bench type selected", type);
    
    //defined back and seat percentages
    if (back_seat_p != "undefined") {
        
        //undefined type
        if (type == "undefined") {
            echo("generating random bench");
            
            //available bench types
            benchTypes = ["simple", "arm"];
            NUMBER_OF_BENCH_TYPES = 2;
            
            //defined style
            if (style != "undefined") {
                benchGenerator(center, volume, benchTypes[round(rands(0, NUMBER_OF_BENCH_TYPES-1, 1)[0])], style, back_seat_p);
            }
            
            //undefined style
            else {
                benchGenerator(center, volume, benchTypes[round(rands(0, NUMBER_OF_BENCH_TYPES-1, 1)[0])], "bench", back_seat_p);
            }
        }
        
        //simple chair type
        else if (type == "simple") {
            //defined style
            if (style != "undefined") {
                simpleChairGenerator(center, volume, style, "undefined", back_seat_p);
            }
            
            //undefined style
            else {
                simpleChairGenerator(center, volume, "bench", "undefined", back_seat_p);
            }
        }
        
        //arm chair type
        else if (type == "arm") {
            //defined style
            if (style != "undefined") {
                armChairGenerator(center, volume, style, "undefined", back_seat_p);
            }
            
            //undefined style
            else {
                armChairGenerator(center, volume, "bench", "undefined", back_seat_p);
            }
        }
    }
    
    //undefined back and seat percentages 
    else {
        back_p = round(rands(70, 90, 1)[0]);
        seat_p = 100 - back_p;

        back_seat_p = [back_p, seat_p];
        
        //undefined type
        if (type == "undefined") {
            echo("generating random bench");
            
            //available bench types
            benchTypes = ["simple", "arm"];
            NUMBER_OF_BENCH_TYPES = 2;
            
            //defined style
            if (style != "undefined") {
                benchGenerator(center, volume, benchTypes[round(rands(0, NUMBER_OF_BENCH_TYPES-1, 1)[0])], style, back_seat_p);
            }
            
            //undefined style
            else {
                benchGenerator(center, volume, benchTypes[round(rands(0, NUMBER_OF_BENCH_TYPES-1, 1)[0])], "bench", back_seat_p);
            }
        }
        
        //simple chair type
        else if (type == "simple") {
            //defined style
            if (style != "undefined") {
                simpleChairGenerator(center, volume, style, "undefined", back_seat_p);
            }
            
            //undefined style
            else {
                simpleChairGenerator(center, volume, "bench", "undefined", back_seat_p);
            }
        }
        
        //arm chair type
        else if (type == "arm") {
            //defined style
            if (style != "undefined") {
                armChairGenerator(center, volume, style, "undefined", back_seat_p);
            }
            
            //undefined style
            else {
                armChairGenerator(center, volume, "bench", "undefined", back_seat_p);
            }
        }
    }
}
