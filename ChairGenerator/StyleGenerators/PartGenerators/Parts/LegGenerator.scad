use <Libraries/Utilities/Utilities.scad>
use <Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Libraries/Legs.scad>

//***LEGS GENERATOR***//

/*
//randomly draws legs from the legs.scad library 

//list of available legs
LEGS = [["leg1", ["angular", "stool", "bench"]],
        ["leg2", ["rounded", "stool"]],
        ["leg3", ["rounded"]],
        ["leg4", ["angular", "stool"]],
        ["leg5", ["angular", "bench"]]];

NUMBER_OF_LEGS = 5;

module legGenerator(center, volume, style = "undefined", leg_Dimensions = "undefined") {
    leg_picked = round(rands(0, NUMBER_OF_LEGS-1, 1)[0]);
        //echo(leg_picked + 1);
    echo("leg style entered", style);
    
    if (style == "undefined") {
        randomLegGenerator(center, volume);
    }
    
    else {
        if ((LEGS[leg_picked][0] == LEGS[0][0]) && ((style == LEGS[0][1][0]) || 
                                                    (style == LEGS[0][1][1]) || 
                                                    (style == LEGS[0][1][2]))) {
                                                        
            echo(LEGS[0][0], LEGS[0][1]);
            
            if (leg_Dimensions == "undefined") {
                legs1(center, volume);
            }
            
            else {
                legs1(center, volume, leg_Dimensions);
            }
        }
        
        else if ((LEGS[leg_picked][0] == LEGS[1][0]) && ((style == LEGS[1][1][0]) || 
                                                         (style == LEGS[1][1][1]))) {
                                                             
            echo(LEGS[1][0], LEGS[1][1]);
            
            if (leg_Dimensions == "undefined") {
                legs2(center, volume);
            }
            
            else {
                legs2(center, volume, leg_Dimensions);
            }
        }
        
        else if ((LEGS[leg_picked][0] == LEGS[2][0]) && (style == LEGS[2][1][0])) {
            echo(LEGS[2][0], LEGS[2][1]);
            
            if (leg_Dimensions == "undefined") {
                legs3(center, volume);
            }
            
            else {
                legs3(center, volume, leg_Dimensions);
            }
        }
        
        else if ((LEGS[leg_picked][0] == LEGS[3][0]) && ((style == LEGS[3][1][0]) || 
                                                         (style == LEGS[3][1][1]))) {
            echo(LEGS[3][0], LEGS[3][1]);
            
            if (leg_Dimensions == "undefined") {
                legs4(center, volume);
            }
            
            else {
                legs4(center, volume, leg_Dimensions);
            }
        }
        
        else if ((LEGS[leg_picked][0] == LEGS[4][0]) && ((style == LEGS[4][1][0]) || 
                                                         (style == LEGS[4][1][1]))) {
                                                             
            echo(LEGS[4][0], LEGS[4][1]);
            
            if (leg_Dimensions == "undefined") {
                legs5(center, volume);
            }
            
            else {
                legs5(center, volume, leg_Dimensions);
            }
        }
        
        else if (LEGS[leg_picked][1][0] != style) {
            echo("legs doesnt match style");
            echo("trying for new legs");
            legGenerator(center, volume, style);
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_leg_Dimensions = [45, 45, 5]; 
test_style = "stool";

//visualization(test_center, test_volume);

//defined
//legGenerator(test_center, test_volume, test_style, test_leg_Dimensions);

//undefined
legGenerator(test_center, test_volume, test_style);