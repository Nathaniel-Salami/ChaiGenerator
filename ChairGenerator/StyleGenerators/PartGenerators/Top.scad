use <Parts/Libraries/Utilities/Utilities.scad>
use <Parts/Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Parts/Libraries/Sides.scad>
use <Parts/SeatGenerator.scad>
use <Parts/LegGenerator.scad>
use <Parts/SideGenerator.scad>
use <Parts/BackGenerator.scad>

//***TOP GENERATOR***//

/*
//simple top generator
module simpleTop_generator(center, volume, style, back_seat_p = "undefined") {
    //defined style
    if (style != "undefined") {
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(75, 85, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
    
    //undefined style
    else {
        echo("undefined back and seat style");
        
        rand_styles = ["angular", "rounded"];
        
        style = rand_styles[round(rands(0, 1, 1)[0])];
        
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(75, 85, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
}





//arm chair top generator
module armChairTop_generator(center, volume, style, back_seat_p = "undefined") {
    
    //defined style
    if (style != "undefined") {
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(70, 85, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
    
    //undefined style
    else {
        echo("undefined back and seat style");
        
        style = "armChair";
        
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(70, 85, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
}





//stool top genrator
module stoolTop_generator(center, volume, style, back_seat_p = "undefined") {
    //defined style
    if (style != "undefined") {
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(80, 90, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
    
    //undefined style
    else {
        echo("undefined back and seat style");
        
        rand_styles = ["angular", "rounded"];
        
        style = rand_styles[round(rands(0, 1, 1)[0])];
        
        //defined back and seat percentages
        if (back_seat_p != "undefined") {
            
            //back and seat percentages
            back_p = back_seat_p[0];
            seat_p = back_seat_p[1];
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
        
        //undefined back and seat percentages
        else {
            echo("undefined back and seat percentages");
            
            //back and seat percentages
            back_p = round(rands(80, 90, 1)[0]);
            seat_p = 100 - back_p;
            
            back_seat = split(center, volume, back_p, seat_p);
            
            back_center = back_seat[0][0];
            back_volume = back_seat[0][1];
            
            //generates back
            backGenerator(back_center, back_volume, style);
            
            seat_center = back_seat[1][0];
            seat_volume = back_seat[1][1];
            
            //generates seat
            seatGenerator(seat_center, seat_volume, style);
        }
    }
}
