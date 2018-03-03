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

//***STOOL***//

/*

//main center and volume
//center used for constructing the chair 
center0 = [25, 25, 50];

//dimensions of the space the chair occupies
volume0 = [35, 35, 100];

//style of chair generated
style0 = "rounded";

//chair
//visualization(center0, volume0);

//top and bottom percentages 
top_p = 40;
bottom_p = 100 - top_p;

top_bottom_p = [top_p, bottom_p];

//seat and leg percentages
back_p = 85;
seat_p = 100 - back_p;

back_seat_p = [back_p, seat_p];

module stoolChairGenerator(center, volume, style, top_bottom_p = "undefined", back_seat_p = "undefined") {
    TOP_P_RANGE = [45, 50];
    
    //visualization(center, volume);
    
    //defined chair style
    if (style != "undefined") {
        
        //defined top and bottom percentages
        if (top_bottom_p != "undefined") {
            
            top_p = top_bottom_p[0];
            bottop_p = top_bottom_p[1];
            
            top_bottom = split(center, volume, top_p, bottop_p);
            
            //chair values
            //seat values
            top_center = top_bottom[0][0];
            top_volume = top_bottom[0][1];
            
            //visualization(top_center, top_volume);
            
            //defined back and seat percentages 
            if (back_seat_p != "undefined") {
                //generate top
                stoolTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generate top
                stoolTop_generator(top_center, top_volume, style);
            }
            
            //leg values 
            bottom_center = top_bottom[1][0];
            bottom_volume = top_bottom[1][1];
            
            //visualization(bottom_center, bottom_volume);
            
            //generate bottom
            simpleLegs_generator(bottom_center, bottom_volume, style);
        }
        
        //undefined top and bottom percentages
        else {
            echo("undefined top and bottom percentages");

            top_p = round(rands(35, 40, 1)[0]);
            bottop_p = 100 - top_p;
            
            top_bottom = split(center, volume, top_p, bottop_p);
            
            //chair values
            //seat values
            top_center = top_bottom[0][0];
            top_volume = top_bottom[0][1];
            
            //visualization(top_center, top_volume);
            
            //defined back and seat percentages 
            if (back_seat_p != "undefined") {
                //generate top
                stoolTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generate top
                stoolTop_generator(top_center, top_volume, style);
            }
            
            //leg values 
            bottom_center = top_bottom[1][0];
            bottom_volume = top_bottom[1][1];
            
            //visualization(bottom_center, bottom_volume);
            
            //generate bottom
            simpleLegs_generator(bottom_center, bottom_volume, style);
        }
    }
    
    //undefined chair style
    else {
        echo("undefined chair style");
        
        rand_style = ["angular", "rounded"];
        
        style = rand_style[round(rands(0, 1, 1)[0])];
        
        //defined top and bottom percentages
        if (top_bottom_p != "undefined") {
            
            top_p = top_bottom_p[0];
            bottop_p = top_bottom_p[1];
            
            top_bottom = split(center, volume, top_p, bottop_p);
            
            //chair values
            //seat values
            top_center = top_bottom[0][0];
            top_volume = top_bottom[0][1];
            
            //visualization(top_center, top_volume);
            
            //defined back and seat percentages 
            if (back_seat_p != "undefined") {
                //generate top
                stoolTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generate top
                stoolTop_generator(top_center, top_volume, style);
            }
            
            //leg values 
            bottom_center = top_bottom[1][0];
            bottom_volume = top_bottom[1][1];
            
            //visualization(bottom_center, bottom_volume);
            
            //generate bottom
            simpleLegs_generator(bottom_center, bottom_volume, style);
        }
        
        //undefined top and bottom percentages
        else {
            echo("undefined top and bottom percentages");

            top_p = round(rands(35, 40, 1)[0]);
            bottop_p = 100 - top_p;
            
            top_bottom = split(center, volume, top_p, bottop_p);
            
            //chair values
            //seat values
            top_center = top_bottom[0][0];
            top_volume = top_bottom[0][1];
            
            //visualization(top_center, top_volume);
            
            //defined back and seat percentages 
            if (back_seat_p != "undefined") {
                //generate top
                stoolTop_generator(top_center, top_volume, style, back_seat_p);
            }
            
            else {
                //generate top
                stoolTop_generator(top_center, top_volume, style);
            }
            
            //leg values 
            bottom_center = top_bottom[1][0];
            bottom_volume = top_bottom[1][1];
            
            //visualization(bottom_center, bottom_volume);
            
            //generate bottom
            simpleLegs_generator(bottom_center, bottom_volume, style);
        }
    }
}

//generates the chair with all percentages defined 
//stoolChairGenerator(center0, volume0, style0, top_bottom_p, back_seat_p);
stoolChairGenerator(center0, volume0, style0, "undefined", "undefined");