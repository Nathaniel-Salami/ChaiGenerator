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

//***ARM CHAIR***//

/*


//main center and volume
//center used for constructing the chair 
center0 = [25, 40, 25];

//dimensions of the space the chair occupies 
volume0 = [50, 60, 50];

//style of chair generated
style0 = "rounded";

//chair
//visualization(center0, volume0);

//top and side percentages 
top_p_test = [90, 80, 65];
side_p_test = 75;

top_side_p_test = [top_p_test, side_p_test];

//seat and leg percentages
back_p_test = 75;
seat_p_test = 100 - back_p_test;

back_seat_p_test = [back_p_test, seat_p_test];

module armChairGenerator(center, volume, style = "undefined", top_side_p = "undefined", back_seat_p = "undefined") {
    echo("Arm Chair");
    
    //defined style
    if (style != "undefined") {
        //defined top and bottom percentages
        if (top_side_p != "undefined") {
            
            //top and side percentages 
            top_p = top_side_p[0];
            side_p = top_side_p[1];
            
            top_side = split2(center, volume, top_p, side_p);
            
            top_center = top_side[0][0];
            top_volume = top_side[0][1];
            
            side_center = top_side[1][0];
            side_volume = top_side[1][1];
            
            if (back_seat_p != "undefined") {
                //generates top
                armChairTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generates top
                armChairTop_generator(top_center, top_volume, style);
            }

            //generates side 
            armChairSides_generator(side_center, side_volume, top_volume, style);
        }
        
        //defined top and bottom percentages
        else {
            echo("undefined top and side percentages");
            
            //top and side percentages 
            top_p = [round(rands(88, 90, 1)[0]), round(rands(80, 90, 1)[0]), round(rands(60, 70, 1)[0])];
            side_p = round(rands(70, 80, 1)[0]);
            
            top_side = split2(center, volume, top_p, side_p);
            
            top_center = top_side[0][0];
            top_volume = top_side[0][1];
            
            side_center = top_side[1][0];
            side_volume = top_side[1][1];
            
            if (back_seat_p != "undefined") {
                //generates top
                armChairTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generates top
                armChairTop_generator(top_center, top_volume, style);
            }

            //generates side 
            armChairSides_generator(side_center, side_volume, top_volume, style);
        }
    }
    
    //undefined style
    else {
        echo("undefined chair style");
        
        style = "armChair";
        
        //defined top and bottom percentages
        if (top_side_p != "undefined") {
            
            //top and side percentages 
            top_p = top_side_p[0];
            side_p = top_side_p[1];
            
            top_side = split2(center, volume, top_p, side_p);
            
            top_center = top_side[0][0];
            top_volume = top_side[0][1];
            
            side_center = top_side[1][0];
            side_volume = top_side[1][1];
            
            if (back_seat_p != "undefined") {
                //generates top
                armChairTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generates top
                armChairTop_generator(top_center, top_volume, style);
            }

            //generates side 
            armChairSides_generator(side_center, side_volume, top_volume, style);
        }
        
        //defined top and bottom percentages
        else {
            echo("undefined top and side percentages");
            
            //top and side percentages 
            top_p = [round(rands(88, 90, 1)[0]), round(rands(80, 90, 1)[0]), round(rands(60, 70, 1)[0])];
            side_p = round(rands(70, 80, 1)[0]);
            
            top_side = split2(center, volume, top_p, side_p);
            
            top_center = top_side[0][0];
            top_volume = top_side[0][1];
            
            side_center = top_side[1][0];
            side_volume = top_side[1][1];
            
            if (back_seat_p != "undefined") {
                //generates top
                armChairTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generates top
                armChairTop_generator(top_center, top_volume, style);
            }

            //generates side 
            armChairSides_generator(side_center, side_volume, top_volume, style);
        }
    }
}

//generates the chair with all percentages defined 
//armChairGenerator(center0, volume0, style0, top_side_p_test, back_seat_p_test);

//undefined
armChairGenerator(center0, volume0, "undefined", "undefined", "undefined");
