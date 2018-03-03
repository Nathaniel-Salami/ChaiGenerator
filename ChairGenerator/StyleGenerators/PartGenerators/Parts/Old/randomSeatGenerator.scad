use <C:/Users/user/OneDrive/Research_Project/chairs/so_far/custom_libraries/chair_generator/other.scad>
use<seats.scad>

//***SEAT GENERATOR***\\
//randomly draws a seat from the seats.scad library 

//list of available seats
SEATS = ["seat1", "seat2", "seat3"];

NUMBER_OF_SEATS = 3;

module randomSeatGenerator(center, volume, style) {
    seat_picked = round(rands(0, NUMBER_OF_SEATS-1, 1)[0]);
        //echo(seat_picked + 1);
    
    if (SEATS[seat_picked] == SEATS[0]) {
        echo("seat 1");
        seat1(center, volume);
    }
    
    else if (SEATS[seat_picked] == SEATS[1]) {
        echo("seat 2");
        seat2(center, volume);
    }
    
    else if (SEATS[seat_picked] == SEATS[2]) {
        echo("seat 3");
        seat3(center, volume);
    }
}


//test dimensions 
test_center = [25, 25, 5];
test_volume = [50, 50, 10];
test_seat_Dimensions = [50, 50, 10]; 
test_style = "rounded";

//visualization(test_center, test_volume);

randomSeatGenerator(test_center, test_volume, test_seat_Dimensions, test_style);