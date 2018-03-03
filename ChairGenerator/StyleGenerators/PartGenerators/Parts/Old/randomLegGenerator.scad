use <C:/Users/user/OneDrive/Research_Project/chairs/so_far/custom_libraries/chair_generator/other.scad>
use<legs.scad>

//***LEGS GENERATOR***\\
//randomly draws legs from the legs.scad library 

//list of available legs
LEGS = ["leg1", "leg2", "leg3", "leg4", "leg5"];

NUMBER_OF_LEGS = 5;

module randomLegGenerator(center, volume, leg_Dimensions = "undefined") {
    leg_picked = round(rands(0, NUMBER_OF_LEGS-1, 1)[0]);
        //echo(leg_picked + 1);
    
    if (LEGS[leg_picked] == LEGS[0]) {
        echo("legs 1");
        if (leg_Dimensions == "undefined") {
            legs1(center, volume);
        }
        
        else {
            legs1(center, volume, leg_Dimensions);
        }
    }
    
    else if (LEGS[leg_picked] == LEGS[1]) {
        echo("legs 2");
        if (leg_Dimensions == "undefined") {
            legs2(center, volume);
        }
        
        else {
            legs2(center, volume, leg_Dimensions);
        }
    }
    
    else if (LEGS[leg_picked] == LEGS[2]) {
        echo("legs 3");
        if (leg_Dimensions == "undefined") {
            legs3(center, volume);
        }
        
        else {
            legs3(center, volume, leg_Dimensions);
        }
    }
    
    else if (LEGS[leg_picked] == LEGS[3]) {
        echo("legs 4");
        if (leg_Dimensions == "undefined") {
            legs4(center, volume);
        }
        
        else {
            legs4(center, volume, leg_Dimensions);
        }
    }
    
    else if (LEGS[leg_picked] == LEGS[4]) {
        echo("legs 5");
        if (leg_Dimensions == "undefined") {
            legs5(center, volume);
        }
        
        else {
            legs5(center, volume, leg_Dimensions);
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_leg_Dimensions = [45, 45, 5]; 

//visualization(test_center, test_volume);

//defined
//randomLegGenerator(test_center, test_volume, test_leg_Dimensions);

//undefined
randomLegGenerator(test_center, test_volume);