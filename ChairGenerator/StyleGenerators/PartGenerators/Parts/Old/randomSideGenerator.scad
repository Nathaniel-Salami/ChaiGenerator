use <C:/Users/user/OneDrive/Research_Project/chairs/so_far/custom_libraries/chair_generator/other.scad>
use<sides.scad>

//***SIDE GENERATOR***\\
//randomly draws sides (regardless of style)from the sides.scad library 

//list of available sides
SIDES = ["side1", "side2", "side3", "side4"];

NUMBER_OF_SIDES = 4;

module randomSideGenerator(center, volume, top_volume, side_Dimensions = "undefined") {
    side_picked = round(rands(0, NUMBER_OF_SIDES-1, 1)[0]);
        //echo(SIDES[side_picked]);
    
    if (SIDES[side_picked] == SIDES[0]) {
        echo(SIDES[0]);
        if (side_Dimensions == "undefined") {
            side1(center, volume, top_volume);
        }
        
        else {
            side1(center, volume, top_volume, side_Dimensions);
        }
    }
    
    else if (SIDES[side_picked] == SIDES[1]) {
        echo(SIDES[1]);
        
        side2(center, volume, top_volume);
    }
    
    else if (SIDES[side_picked] == SIDES[2]) {
        echo(SIDES[2]);
        if (side_Dimensions == "undefined") {
            side3(center, volume, top_volume);
        }
        
        else {
            side3(center, volume, top_volume, side_Dimensions);
        }
    }
    
    else if (SIDES[side_picked] == SIDES[3]) {
        echo(SIDES[3]);
        if (side_Dimensions == "undefined") {
            side4(center, volume, top_volume);
        }
        
        else {
            side4(center, volume, top_volume, side_Dimensions);
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_top_volume = [40, 40, 40];


//visualization(test_center, test_volume);

randomSideGenerator(test_center, test_volume, test_top_volume);