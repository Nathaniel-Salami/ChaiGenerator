use <Parts/Libraries/Utilities/Utilities.scad>
use <Parts/Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Parts/Libraries/Sides.scad>
use <Parts/SeatGenerator.scad>
use <Parts/LegGenerator.scad>
use <Parts/SideGenerator.scad>
use <Parts/BackGenerator.scad>

//***BOTTOM GENERATOR***//

/*
//simple bottom generator
module seatLegs_generator(center, volume, style, seat_legs_p = "undefined") {
    SEAT_P_RANGE = [10, 20];
    
    if (style == "undefined") {
        //undefined seat and leg percentages
        if (seat_legs_p == "undefined") {
            echo("undefined leg percentages");
            
            seat_p = round(rands(SEAT_P_RANGE[0], SEAT_P_RANGE[1], 1)[0]);
            legs_p = 100 - seat_p;
        
            //splits the bottom center and volume for the seat and legs 
            seat_legs = split(center, volume, seat_p, legs_p);

            //chair values
            //seat values
            seat_center = seat_legs[0][0];
            seat_volume = seat_legs[0][1];
            
            //seat
            //visualization(seat_center, seat_volume);

            //leg values 
            legs_center = seat_legs[1][0];
            legs_volume = seat_legs[1][1];
            
            //legs
            //visualization(legs_center, legs_volume);

            //generates seat
            seatGenerator(seat_center, seat_volume);

            //generates leg
            legGenerator(legs_center, legs_volume);
        }
        
        //defined seat and leg percentages
        else {
            echo("defined leg percentages");
            
            seat_p = seat_legs_p[0];
            legs_p = seat_legs_p[1];
        
            //splits the bottom center and volume for the seat and legs 
            seat_legs = split(center, volume, seat_p, legs_p);

            //chair values
            //seat values
            seat_center = seat_legs[0][0];
            seat_volume = seat_legs[0][1];
            
            //seat
            //visualization(seat_center, seat_volume);

            //leg values 
            legs_center = seat_legs[1][0];
            legs_volume = seat_legs[1][1];
            
            //legs
            //visualization(legs_center, legs_volume);

            //generates seat
            seatGenerator(seat_center, seat_volume);

            //generates leg
            legGenerator(legs_center, legs_volume);
        }
    }
    
    else {
        //undefined seat and leg percentages
        if (seat_legs_p == "undefined") {
            echo("undefined leg percentages");
            
            seat_p = round(rands(SEAT_P_RANGE[0], SEAT_P_RANGE[1], 1)[0]);
            legs_p = 100 - seat_p;
        
            //splits the bottom center and volume for the seat and legs 
            seat_legs = split(center, volume, seat_p, legs_p);

            //chair values
            //seat values
            seat_center = seat_legs[0][0];
            seat_volume = seat_legs[0][1];
            
            //seat
            //visualization(seat_center, seat_volume);

            //leg values 
            legs_center = seat_legs[1][0];
            legs_volume = seat_legs[1][1];
            
            //legs
            //visualization(legs_center, legs_volume);

            //generates seat
            seatGenerator(seat_center, seat_volume, style);

            //generates leg
            legGenerator(legs_center, legs_volume, style);
        }
        
        //defined seat and leg percentages
        else {
            echo("defined leg percentages");
            
            seat_p = seat_legs_p[0];
            legs_p = seat_legs_p[1];
        
            //splits the bottom center and volume for the seat and legs 
            seat_legs = split(center, volume, seat_p, legs_p);

            //chair values
            //seat values
            seat_center = seat_legs[0][0];
            seat_volume = seat_legs[0][1];
            
            //seat
            //visualization(seat_center, seat_volume);

            //leg values 
            legs_center = seat_legs[1][0];
            legs_volume = seat_legs[1][1];
            
            //legs
            //visualization(legs_center, legs_volume);

            //generates seat
            seatGenerator(seat_center, seat_volume, style);

            //generates leg
            legGenerator(legs_center, legs_volume, style);
        }
    }
}





//arm chair sides generator
module armChairSides_generator (center, volume, top_volume, style = "undefined") {
    //back values 
    side_center = center;
    side_volume = volume;
        
    if (style == "undefined") {
        //generates back
        sideGenerator(side_center, side_volume, top_volume);
    }
    
    else {
        //generates back
        sideGenerator(side_center, side_volume, top_volume, style);
    }
}





//legs generator for simple chair
module simpleLegs_generator (center, volume, style = "undefined") {
    //back values 
    legs_center = center;
    legs_volume = volume;
        
    if (style == "undefined") {
        //generates back
        legGenerator(legs_center, legs_volume, style);
    }
    
    else {
        //generates back
        legGenerator(legs_center, legs_volume, style);
    }
}