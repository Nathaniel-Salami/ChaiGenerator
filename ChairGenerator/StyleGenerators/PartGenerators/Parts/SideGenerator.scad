use <Libraries/Utilities/Utilities.scad>
use <Libraries/Utilities/CurvedPipe/curvedPipe.scad>
use <Libraries/Sides.scad>

//***SIDE GENERATOR***//

/*
//randomly draws sides (depending on their style) from the sides.scad library 

//list of available legs
SIDES = [["side1", ["angular", "armChair", "bench"]],
         ["side2", ["angular", "armChair", "bench"]],
         ["side3", ["angular", "armChair", "bench"]],
         ["side4", ["rounded", "armChair"]], 
         ["side5", ["rounded", "armChair", "bench"]]];

NUMBER_OF_SIDES = 5;

module sideGenerator(center, volume, top_volume, style = "undefined", side_Dimensions = "undefined") {
    side_picked = round(rands(0, NUMBER_OF_SIDES-1, 1)[0]);
        //echo(SIDES[side_picked]);
    
    if (style == "undefined") {
        echo("undefined style");
        if (side_Dimensions == "undefined") {
            randomSideGenerator(center, volume, top_volume);
        }
        
        else {
            randomSideGenerator(center, volume, top_volume, side_Dimensions);
        }
        
    }
    
    else {
        if ((SIDES[side_picked][0] == SIDES[0][0]) && ((style == SIDES[0][1][0]) || 
                                                       (style == SIDES[0][1][1]) || 
                                                       (style == SIDES[0][1][2]))) {
                                                           
            echo(SIDES[0][0], SIDES[0][1]);
            
            if (side_Dimensions == "undefined") {
                side1(center, volume, top_volume);
            }
            
            else {
                side1(center, volume, top_volume, side_Dimensions);
            }
        }
        
        else if ((SIDES[side_picked][0] == SIDES[1][0]) && ((style == SIDES[1][1][0]) || 
                                                            (style == SIDES[1][1][1]) || 
                                                            (style == SIDES[1][1][2]))) {
                                                                
            echo(SIDES[1][0], SIDES[1][1]);
            
            side2(center, volume, top_volume);
        }
        
        else if ((SIDES[side_picked][0] == SIDES[2][0]) && ((style == SIDES[2][1][0]) || 
                                                            (style == SIDES[2][1][1]) || 
                                                            (style == SIDES[2][1][2]))) {
                                                                
            echo(SIDES[2][0], SIDES[2][1]);
            
            if (side_Dimensions == "undefined") {
                side3(center, volume, top_volume);
            }
            
            else {
                side3(center, volume, top_volume, side_Dimensions);
            }
        }
        
        else if ((SIDES[side_picked][0] == SIDES[3][0]) && ((style == SIDES[3][1][0]) || 
                                                            (style == SIDES[3][1][1]))) {
                                                                
            echo(SIDES[3][0], SIDES[3][1]);
            
            if (side_Dimensions == "undefined") {
                side4(center, volume, top_volume);
            }
            
            else {
                side4(center, volume, top_volume, side_Dimensions);
            }
        }
        
        else if ((SIDES[side_picked][0] == SIDES[4][0]) && ((style == SIDES[4][1][0]) || 
                                                            (style == SIDES[4][1][1]) || 
                                                            (style == SIDES[4][1][2]))) {
                                                                
            echo(SIDES[4][0], SIDES[4][1]);
            
            if (side_Dimensions == "undefined") {
                side5(center, volume, top_volume);
            }
            
            else {
                side5(center, volume, top_volume, side_Dimensions);
            }
        }
        
        else if (SIDES[side_picked][1][0] != style) {
            echo("sides don't match style");
            echo("trying for new sides");
            if (side_Dimensions == "undefined") {
                sideGenerator(center, volume, top_volume, style);
            }
            
            else {
                sideGenerator(center, volume, top_volume, style, side_Dimensions);
            }
            
        }
    }
}


//test dimensions 
test_center = [25, 25, 25];
test_volume = [50, 50, 50];
test_top_volume = [40, 40, 40];
test_style = "rounded";

//visualization(test_center, test_volume);

//defined style
sideGenerator(test_center, test_volume, test_top_volume, test_style);

//undefined style
//sideGenerator(test_center, test_volume, test_top_volume);