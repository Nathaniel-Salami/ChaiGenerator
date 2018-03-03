use <Libraries/Utilities/Utilities.scad>
use <Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Libraries/Seats.scad>

//***SEAT GENERATOR***//

/*
//randomly draws a seat from the seats.scad library 

//list of available seats
SEATS = [["seat1", ["angular", "armChair", "bench", "stool"]],
         ["seat2", ["rounded"]],
         ["seat3", ["rounded", "stool"]]];

NUMBER_OF_SEATS = 3;

module seatGenerator(center, volume, style = "undefined") {
    seat_picked = round(rands(0, NUMBER_OF_SEATS-1, 1)[0]);
        //echo(seat_picked + 1);
    
    echo("seat style entered", style);
    
    if (style == "undefined") {
        randomSeatGenerator(center, volume);
    }
    
    else {
        if ((SEATS[seat_picked][0] == SEATS[0][0]) && ((style == SEATS[0][1][0]) ||
                                                       (style == SEATS[0][1][1]) || 
                                                       (style == SEATS[0][1][2]) || 
                                                       (style == SEATS[0][1][3]))) {
            echo(SEATS[0][0], SEATS[0][1]);
            
            seat1(center, volume);
        }
        
        else if ((SEATS[seat_picked][0] == SEATS[1][0]) && (style == SEATS[1][1][0])) {
            echo(SEATS[1][0], SEATS[1][1]);
            
            seat2(center, volume);
        }
        
        else if ((SEATS[seat_picked][0] == SEATS[2][0]) && ((style == SEATS[2][1][0]) || 
                                                            (style == SEATS[2][1][1]))) {
            echo(SEATS[2][0], SEATS[2][1]);
            
            seat3(center, volume);
        }
        
        else if (SEATS[seat_picked][1][0] != style) {
            echo("seat doesnt match style");
            echo("trying for new seat");
            seatGenerator(center, volume, style);
        }
    }
}


//test dimensions 
test_center = [25, 25, 5];
test_volume = [50, 50, 10];
test_seat_Dimensions = [50, 50, 10]; 
test_style = "stool";

//visualization(test_center, test_volume);

seatGenerator(test_center, test_volume, test_style, test_seat_Dimensions);