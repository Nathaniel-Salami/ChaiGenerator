use <Utilities/Utilities.scad>
use <Utilities/CurvedPipe/curvedPipe.scad>

//***LEGS LIBRARY***\\

/*

//LEGS LIBRARY\\
//center used for constructing the legs 
center0 = [25, 25, 25];

//dimensions of the space the legs occupy 
volume0 = [50, 50, 50];

//shows the center and volume 
//visualization(center0, volume0);



//rectangular legs

//length and width between the inner edges legs 
legs1_Dimensions = [40, 40];        //dimensions = [length(x), width(y)]

//undefined
//legs1(center0, volume0);

//defined
//legs1(center0, volume0, legs1_Dimensions);

module legs1(center, volume, legs_Dimensions = "undefined") {    
    //leg dimensions 
    //length and width between the outer edge of the legs 
    fullLength = volume[0];
    fullWidth = volume[1];
    
    //depth of each leg
    legDepth = volume[2];
    
    //undefined leg dimensions
    if (legs_Dimensions == "undefined") {
        echo("undefined leg dimensions");

        //dimensions of each individual leg
        x = (fullLength + fullWidth)/2;
        legLength = x - rand_percentage(x, 88, 93);
        legWidth = legLength;
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            translate([-fullLength/2, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
        }
    }
    
    //defined leg dimensions 
    else {
        
        //dimensions of each individual leg
        legLength = (fullLength - legs_Dimensions[0])/2;
        legWidth = (fullWidth - legs_Dimensions[1])/2;
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            translate([-fullLength/2, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
        }
    }
}





//cylindrical legs

//length and width between the legs
legs2_Dimensions = [45, 45];        //dimensions = [length(x), width(y)]   

//undefined
//legs2(center0, volume0);

//defined
//legs2(center0, volume0, legs2_Dimensions);

module legs2(center, volume, leg_Dimensions = "undefined") { 
    //leg dimensions 
    //length and width between the outer edge of the legs 
    fullLength = volume[0];
    fullWidth = volume[1];
    
    //depth of each leg
    legDepth = volume[2];
    
    //undefined leg dimensions
    if (leg_Dimensions == "undefined") {
        echo("undefined leg dimensions");
        
        //dimensions of each individual leg
        legRadius = (fullLength + fullWidth) - rand_percentage((fullLength + fullWidth), 97, 98);

        //legs
        translate ([center[0], center[1], center[2]]) {
            translate([-fullLength/2 + legRadius, fullWidth/2 - legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([fullLength/2 - legRadius, fullWidth/2 - legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([fullLength/2 - legRadius, -fullWidth/2 + legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([-fullLength/2 + legRadius, -fullWidth/2 + legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
        }
    }
    
    //defined leg dimensions 
    else {
        
        //dimensions of each individual leg
        legRadius = ((fullLength - leg_Dimensions[0]) + (fullWidth - leg_Dimensions[1]))/4;
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            translate([-fullLength/2 + legRadius, fullWidth/2 - legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([fullLength/2 - legRadius, fullWidth/2 - legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([fullLength/2 - legRadius, -fullWidth/2 + legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
    
            translate([-fullLength/2 + legRadius, -fullWidth/2 + legRadius, -legDepth/2])
                cylinder (legDepth, legRadius, legRadius, center = false, $fn = legRadius*10);
        }
    }
}




//curved cylindrical legs

//dimensions = [radius, depth(z), curveRadius]
leg3_Dimensions = [45, 45, 5]; 

//undefined
//legs3(center0, volume0);

//defined
//legs3(center0, volume0, leg3_Dimensions);

module legs3(center, volume, leg_Dimensions = "undefined") { 
    //leg dimensions 
    //length and width between the outer edge of the legs 
    fullLength = volume[0];
    fullWidth = volume[1];

    legDepth = volume[2];
    
    //undefined leg dimensions
    if (leg_Dimensions == "undefined") {
        echo("undefined leg dimensions");
        
        //dimensions of each individual leg
        legRadius = ((fullLength + fullWidth) - rand_percentage((fullLength + fullWidth), 94, 96))/2;   
        curveRadius = rand_percentage(legDepth, 10, 15);
        
        //legs
        translate ([center[0], center[1], center[2]]) {
            curvedPipe (points = [[-fullLength/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],               //1
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],  //2
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],  //3
                                  [-fullLength/2 + legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2], //4
                                  [-fullLength/2 + legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],  //5
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],   //6
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2],   //7
                                  [-fullLength/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2]],               //8
                     
                        segments = 7, 
    
                        radii = [curveRadius, curveRadius,
                                 curveRadius, curveRadius,
                                 curveRadius, curveRadius], 
    
                         od = legRadius, 
                         id = 0,
					     $fn = legRadius*50);
        }
    }
    
    //defined leg dimensions 
    else {
        
        //dimensions of each individual leg
        legRadius = ((fullLength - leg_Dimensions[0]) + (fullWidth - leg_Dimensions[1]))/4;
        curveRadius = leg_Dimensions[2];
        
        //legs
        translate ([center[0], center[1], center[2]]) {
            curvedPipe (points = [[-fullLength/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],               //1
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],  //2
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],  //3
                                  [-fullLength/2 + legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2], //4
                                  [-fullLength/2 + legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],  //5
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],   //6
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2],   //7
                                  [-fullLength/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2]],               //8
                     
                        segments = 7, 
    
                        radii = [curveRadius, curveRadius,
                                 curveRadius, curveRadius,
                                 curveRadius, curveRadius], 
    
                         od = legRadius, 
                         id = 0,
					     $fn = legRadius*50);
        }
    }
}





//rectangular legs with connectors at the bottom

//position of the connectors along the legs
connector4_Positions = [10, 15];	//[left/rigth position(z), front/back position(z)]

//depth of the connectors 
connector4_Depth = [5, 5];		//[left/rigth depth(z), front/back depth(z)]

connector4_dimensions = [connector4_Depth, connector4_Positions];

//length and width between the inner edges legs 
legs4_Dimensions = [40, 40, connector4_dimensions];        //dimensions = [length(x), width(y), connector dimensions]

//undefined
//legs4(center0, volume0);

//defined
//legs4(center0, volume0, legs4_Dimensions);

module legs4(center, volume, legs_Dimensions = "undefined") {   
    //leg dimensions 
    //length and width between the outer edge of the legs 
    fullLength = volume[0];
    fullWidth = volume[1];
    
    //depth of each leg
    legDepth = volume[2];
    
    //undefined leg dimensions
    if (legs_Dimensions == "undefined") {
        echo("undefined leg dimensions");
        
        //length and width of each individual leg
        x = (fullLength + fullWidth)/2;
        
        legLength = x - rand_percentage(x, 88, 93);
        legWidth = legLength;
        
        //connector depth
        LRDepth = (legLength + legWidth)/2; 		//depth of the left and rigth connectors
        FBDepth = LRDepth; 			                //depth of the front and back connectors

        //connector position
        LRPosition = rand_percentage(legDepth, 15, 25); 		//Position of the left and rigth connectors
        FBPosition = LRPosition + FBDepth; 		//Position of the front and back connectors
        
        //legs
        translate ([center[0], center[1], center[2]]) {
            
            //legs
            translate([-fullLength/2, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
            
            //leg connectors
                //left and right
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2 + LRPosition])
                cube([fullLength, legWidth, LRDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -legDepth/2 + LRPosition])
                cube([fullLength, legWidth, LRDepth]); 
        
                //front and back
            translate ([fullLength/2 - legLength, -fullWidth/2, -legDepth/2 + FBPosition])
                cube([legLength, fullWidth, FBDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -legDepth/2 + FBPosition])
                cube([legLength, fullWidth, FBDepth]);
        }
    }
    
    //defined leg dimensions 
    else {
        
        //length and width of each individual leg
        legLength = (fullLength - legs_Dimensions[0])/2;
        legWidth = (fullWidth - legs_Dimensions[1])/2;
        
        //connector depth
        LRDepth = legs_Dimensions[2][0][0]; 			//depth of the left and rigth connectors
        FBDepth = legs_Dimensions[2][0][1]; 			//depth of the front and back connectors

        //connector position
        LRPosition = legs_Dimensions[2][1][0]; 			//Position of the left and rigth connectors
        FBPosition = legs_Dimensions[2][1][1]; 			//Position of the front and back connectors
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            
            //legs
            translate([-fullLength/2, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
    
            translate([fullLength/2 - legLength, -fullWidth/2, -legDepth/2]) 
                cube([legLength, legWidth, legDepth]);
            
            //leg connectors
                //left and right
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2 + LRPosition])
                cube([fullLength, legWidth, LRDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -legDepth/2 + LRPosition])
                cube([fullLength, legWidth, LRDepth]); 
        
                //front and back
            translate ([fullLength/2 - legLength, -fullWidth/2, -legDepth/2 + FBPosition])
                cube([legLength, fullWidth, FBDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -legDepth/2 + FBPosition])
                cube([legLength, fullWidth, FBDepth]);
        }
    }
}







//rectangular legs with a connected base

//depth of base connectors 
base5_depth = 3; 

//length and width between the inner edges legs 
legs5_Dimensions = [45, 40, base5_depth];        //dimensions = [length(x), width(y)]

//undefined
legs5(center0, volume0);

//defined
//legs5(center0, volume0, legs5_Dimensions);

module legs5(center, volume, legs_Dimensions = "undefined") {    
    //leg dimensions 
    //length and width between the outer edge of the legs 
    fullLength = volume[0];
    fullWidth = volume[1];
    
    //depth of each leg
    legDepth = volume[2];
    
    //undefined leg dimensions
    if (legs_Dimensions == "undefined") {
        echo("undefined leg dimensions");

        //dimensions of each individual leg
        x = (fullLength + fullWidth)/2;
        
        legLength = x - rand_percentage(x, 91, 95);
        legWidth = x - rand_percentage(x, 85, 90);
        
        //cutout dimensions
        baseDepth = legLength;
        
        cutLength = fullLength - legLength*2;
        cutWidth = legWidth*2;
        cutDepth = legDepth - baseDepth;
        
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            //left side 
            translate ([-fullLength/2, -fullWidth/2, -legDepth/2]) {
                difference() {
                    //main 
                    cube ([fullLength, legWidth, legDepth]);

                    //cutout
                    translate ([legLength, -legWidth/2, baseDepth])
                        cube ([cutLength, cutWidth, cutDepth]);
                }
            }
            
            //rigth side 
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) {
                difference() {
                    //main 
                    cube ([fullLength, legWidth, legDepth]);

                    //cutout
                    translate ([legLength, -legWidth/2, baseDepth])
                        cube ([cutLength, cutWidth, cutDepth]);
                }
            }
        }
    }
    
    //defined leg dimensions 
    else {
        
        //dimensions of each individual leg
        legLength = (fullLength - legs_Dimensions[0])/2;
        legWidth = (fullWidth - legs_Dimensions[1])/2;
        
        //cutout dimensions
        baseDepth = legs_Dimensions[2];
        
        cutLength = fullLength - legLength*2;
        cutWidth = legWidth*2;
        cutDepth = legDepth - baseDepth;
    
        //legs
        translate ([center[0], center[1], center[2]]) {
            //left side 
            translate ([-fullLength/2, -fullWidth/2, -legDepth/2]) {
                difference() {
                    //main 
                    cube ([fullLength, legWidth, legDepth]);

                    //cutout
                    translate ([legLength, -legWidth/2, baseDepth])
                        cube ([cutLength, cutWidth, cutDepth]);
                }
            }
            
            //rigth side 
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2]) {
                difference() {
                    //main 
                    cube ([fullLength, legWidth, legDepth]);

                    //cutout
                    translate ([legLength, -legWidth/2, baseDepth])
                        cube ([cutLength, cutWidth, cutDepth]);
                }
            }
        }
    }
}