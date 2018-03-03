use <Libraries/Utilities/Utilities.scad>
use <Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Libraries/Backs.scad>

//***BACK GENERATOR***//

/*
//randomly draws a back from the backs.scad library 

//list of available backs
BACKS = [["back1", ["angular", "armChair", "stool", "bench"]],
         ["back2", ["angular", "stool"]],
         ["back3", ["angular", "stool", "bench", "armChair"]],
         ["back4", ["angular", "stool", "bench", "armChair"]],
         ["back5", ["angular", "stool"]],
         ["back6", ["rounded", "stool"]],
         ["back7", ["bench", "stool"]], 
         ["back8", ["angular", "rounded", "armChair", "stool"]]];

NUMBER_OF_BACKS = 8;

module backGenerator(center, volume, style = "undefined", back_dimensions = "undefined") {
    back_picked = round(rands(0, NUMBER_OF_BACKS-1, 1)[0]);
        //echo(BACKS[back_picked][0]);
    
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
        
        else if ((BACKS[back_picked][0] == BACKS[6][0]) && ((style == BACKS[6][1][0]) || 
                                                            (style == BACKS[6][1][1]))) {
                                                                
            echo(BACKS[6][0], BACKS[6][1]);
       
            back7(center, volume, back_dimensions);
        }
        
        else if ((BACKS[back_picked][0] == BACKS[7][0]) && ((style == BACKS[7][1][0]) || 
                                                            (style == BACKS[7][1][1]) || 
                                                            (style == BACKS[7][1][2]) || 
                                                            (style == BACKS[7][1][3]))) {
                                                                
            echo(BACKS[7][0], BACKS[7][1]);
            
            if (back_dimensions == "undefined") {
                back8(center, volume);
            }
            
            else {
                back8(center, volume, back_dimensions);
            }
        }
        
        else if (BACKS[back_picked][1][0] != style) {
            echo("back doesnt match style");
            echo("trying for new back");
            backGenerator(center, volume, style);
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_back_Dimensions = [10]; 
test_style = "rounded";

//visualization(test_center, test_volume);

//defined
//backGenerator(test_center, test_volume, test_back_Dimensions);
backGenerator(test_center, test_volume, test_style);

//undefined
//backGenerator(test_center, test_volume);