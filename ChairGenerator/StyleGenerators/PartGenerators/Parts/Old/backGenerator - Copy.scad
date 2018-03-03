use <C:/Users/user/OneDrive/Research_Project/chairs/so_far/custom_libraries/chair_generator/other.scad>
use<backs.scad>
use<randomBackGenerator.scad>

//***BACK GENERATOR***\\
//randomly draws a back from the backs.scad library 



module backGenerator(center, volume, style = "undefined", back_dimensions = "undefined") {
    //list of available backs
    BACKS = [["back1", ["angular", "armChair", "stool", "bench"]],
             ["back2", ["angular", "stool"]],
             ["back3", ["angular", "stool", "bench", "armChair"]],
             ["back4", ["angular", "stool", "bench", "armChair"]],
             ["back5", ["angular", "stool"]],
             ["back6", ["rounded", "stool"]]];

    NUMBER_OF_BACKS = 6;
    
    //randomly selects a back
    back_picked = round(rands(0, NUMBER_OF_BACKS-1, 1)[0]);
    
    //echo(BACKS[back_picked][0]);
    
    /*AVAILABLE_STYLES = ["angular", "rounded", "armChair", "stool", "bench"];
    
    NUMBER_OF_STYLES = 5;
    
    //doesnt draw a back if the the style entered doesnt match any available styles 
    for (i = [0: 1: NUMBER_OF_STYLES-1]) {
        if (style != AVAILABLE_STYLES[i]) {
            echo(AVAILABLE_STYLES[i]);
        }
    }*/
    
    
    
    echo("back style entered", style);
    
    if (style == "undefined") {
        //echo("undefined back style");
        randomBackGenerator(center, volume);
    }
    
    else {
        if ((BACKS[back_picked][0] == BACKS[0][0]) && ((style == BACKS[0][1][0]) || 
                                                       (style == BACKS[0][1][1]) || 
                                                       (style == BACKS[0][1][2]) || 
                                                       (style == BACKS[0][1][3]))) {
                                                           
            echo(BACKS[0][0], BACKS[0][1]);
            
            if (back_dimensions == "undefined") {
                back1(center, volume);
            }
            
            else {
                back1(center, volume, back_dimensions);
            }
        }
        
        else if ((BACKS[back_picked][0] == BACKS[1][0]) && ((style == BACKS[1][1][0]) || 
                                                            (style == BACKS[1][1][1]))) {
            
            echo(BACKS[1][0], BACKS[1][1]);
            
            if (back_dimensions == "undefined") {
                back2(center, volume);
            }
            
            else {
                back2(center, volume, back_dimensions);
            }
        }
        
        else if ((BACKS[back_picked][0] == BACKS[2][0]) && ((style == BACKS[2][1][0]) || 
                                                            (style == BACKS[2][1][1]) || 
                                                            (style == BACKS[2][1][2]) ||
                                                            (style == BACKS[2][1][3]))) {
                                                                
            echo(BACKS[2][0], BACKS[2][1]);
            
            if (back_dimensions == "undefined") {
                back3(center, volume);
            }
            
            else {
                back3(center, volume, back_dimensions);
            }
        }
        
        else if ((BACKS[back_picked][0] == BACKS[3][0]) && ((style == BACKS[3][1][0]) || 
                                                            (style == BACKS[3][1][1]) || 
                                                            (style == BACKS[3][1][2]) || 
                                                            (style == BACKS[3][1][3]))) {
                                                                
            echo(BACKS[3][0], BACKS[3][1]);
            
            if (back_dimensions == "undefined") {
                back4(center, volume);
            }
            
            else {
                back4(center, volume, back_dimensions);
            }
        }
        
        else if ((BACKS[back_picked][0] == BACKS[4][0]) && ((style == BACKS[4][1][0]) || 
                                                            (style == BACKS[4][1][1]))) {
                                                                
            echo(BACKS[4][0], BACKS[4][1]);
            
            if (back_dimensions == "undefined") {
                back5(center, volume);
            }
            
            else {
                back5(center, volume, back_dimensions);
            }
        }
        
        else if ((BACKS[back_picked][0] == BACKS[5][0]) && ((style == BACKS[5][1][0]) || 
                                                            (style == BACKS[5][1][1]))) {
                                                                
            echo(BACKS[5][0], BACKS[5][1]);
            
            if (back_dimensions == "undefined") {
                back6(center, volume);
            }
            
            else {
                back6(center, volume, back_dimensions);
            }
        }
        
        //looks for a different back if the back selected doesnt match the style picked
        /*else if (BACKS[back_picked][1][0] != style) {
            echo("back doesnt match style");
            echo("trying for new back");
            backGenerator(center, volume, style);
        }*/
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_back_Dimensions = [10]; 
test_style = "armChair";

//visualization(test_center, test_volume);

//defined
//backGenerator(test_center, test_volume, test_back_Dimensions);
backGenerator(test_center, test_volume, test_style);

//undefined
//backGenerator(test_center, test_volume);