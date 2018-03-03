use <C:/Users/user/OneDrive/Research_Project/chairs/so_far/custom_libraries/chair_generator/other.scad>
use<backs.scad>

//***BACK GENERATOR***\\
//randomly draws a back from the backs.scad library 

//list of available backs
BACKS = ["back1", "back2", "back3", "back4", "back5", "back 6"];

NUMBER_OF_BACKS = 6;

module randomBackGenerator(center, volume, back_dimensions = "undefined") {
    back_picked = round(rands(0, NUMBER_OF_BACKS-1, 1)[0]);
        //echo(back_picked + 1);
    
    if (BACKS[back_picked] == BACKS[0]) {
        echo("back 1");
        if (back_dimensions == "undefined") {
            back1(center, volume);
        }
        
        else {
            back1(center, volume, back_dimensions);
        }
    }
    
    else if (BACKS[back_picked] == BACKS[1]) {
        echo("back 2");
        if (back_dimensions == "undefined") {
            back2(center, volume);
        }
        
        else {
            back2(center, volume, back_dimensions);
        }
    }
    
    else if (BACKS[back_picked] == BACKS[2]) {
        echo("back 3");
        if (back_dimensions == "undefined") {
            back3(center, volume);
        }
        
        else {
            back3(center, volume, back_dimensions);
        }
    }
    
    else if (BACKS[back_picked] == BACKS[3]) {
        echo("back 4");
        if (back_dimensions == "undefined") {
            back4(center, volume);
        }
        
        else {
            back4(center, volume, back_dimensions);
        }
    }
    
    else if (BACKS[back_picked] == BACKS[4]) {
        echo("back 5");
        if (back_dimensions == "undefined") {
            back5(center, volume);
        }
        
        else {
            back5(center, volume, back_dimensions);
        }
    }
    
    else if (BACKS[back_picked] == BACKS[5]) {
        echo("back 6");
        if (back_dimensions == "undefined") {
            back6(center, volume);
        }
        
        else {
            back6(center, volume, back_dimensions);
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_back_Dimensions = [10]; 

//visualization(test_center, test_volume);

//defined
//randomBackGenerator(test_center, test_volume, test_back_Dimensions);

//undefined
randomBackGenerator(test_center, test_volume);