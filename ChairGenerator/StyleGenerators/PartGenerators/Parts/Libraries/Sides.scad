use <Utilities/Utilities.scad>
use <Utilities/CurvedPipe/curvedPipe.scad>

//***SIDES LIBRARY***//

/*
//SIDES LIBRARY\\
//center used for constructing the sides 
center0 = [0, 0, 0];

//dimensions of the space the sides occupy 
volume0 = [50, 50, 50];

//seat and back center and volume 
//used for proper positioning of the sides 
//topCenter0 = [25, 40, 40];
topVolume0 = [45, 40, 40];

//chairCenter0 = [25, 40, 30];
//chairVolume0 = [50, 80, 60];

//shows the center and volume for the sides
//visualization(center0, volume0, false);

//shows the center and volume of the top (seat and back)
//visualization(topCenter0, topVolume0, true);

//shows the center and volume  of the chair 
//visualization(chairCenter0, chairVolume0);





//simple rectangular sides with spaces

//length and depth of the inner space 
side1_dimensions = [40, 40];

//undefined
//side1(center0, volume0, topVolume0);

//defined
//side1(center0, volume0, topVolume0, side1_dimensions);

//module that generates the sides 
module main_sides1 (center, volume, topVolume, sideDimensions) {
    //main dimensions
    //full dimensions of the sides
    fullLegnth = volume[0];
    fullWidth = volume[1];
    fullDepth = volume[2];
    
    widthBetweenSides = topVolume[1];
    
    //dimensions of the space on the sides 
    spaceLength = sideDimensions[0];
    spaceDepth = sideDimensions[1];
    
    sideThickness = (fullWidth - widthBetweenSides)/2;
    
    translate ([center[0], center[1], center[2]]) {
        translate ([-fullLegnth/2, -fullWidth/2, -fullDepth/2]) {
            difference() {
                //main
                cube ([fullLegnth, fullWidth, fullDepth]);
        
                //cutouts
                translate ([-fullLegnth/2, (fullWidth - widthBetweenSides)/2, -fullDepth/2])
                    cube ([fullLegnth*2, widthBetweenSides, fullDepth*2]);
                    
                translate ([(fullLegnth - spaceLength)/2, -fullWidth/2, (fullDepth - spaceDepth)/2])
                    cube ([spaceLength, fullWidth*2, spaceDepth]);
            }   
        }
    }
}

//module that handles undefined dimensions 
module side1 (center, volume, topVolume, sideDimensions = "undefined") {

    //defined side dimensions 
    if (sideDimensions != "undefined") {
        //generates the sides
        main_sides1(center, volume, topVolume, sideDimensions);
    }
    
    //undefined side dimensions
    else {
        echo("undefined side dimensions");
        
        //estimates side dimensions 
        spaceLegnth = rand_percentage(volume[0], 80, 85);
        spaceDepth = rand_percentage(volume[2], 80, 85);
        
        sideDimensions = [spaceLegnth, spaceDepth];
        
        //generates the sides
        main_sides1(center, volume, topVolume, sideDimensions);
    }
}







//simple rectangular sides 

//side2(center0, volume0, topVolume0);

module side2 (center, volume, topVolume) {
    //main dimensions
    //full dimensions of the sides
    fullLegnth = volume[0];
    fullWidth = volume[1];
    fullDepth = volume[2];
    
    widthBetweenSides = topVolume[1];
    
    sideThickness = (fullWidth - widthBetweenSides)/2;
    
    translate ([center[0], center[1], center[2]]) {
        translate ([-fullLegnth/2, -fullWidth/2, -fullDepth/2]) {
            difference() {
                //main
                cube ([fullLegnth, fullWidth, fullDepth]);
        
                //cutouts
                translate ([-fullLegnth/2, (fullWidth - widthBetweenSides)/2, -fullDepth/2])
                    cube ([fullLegnth*2, widthBetweenSides, fullDepth*2]);
            }   
        }
    }
}





//simple rectangular sides with spaces

//length and depth of the inner space (on both sides and back
side3_dimensions = [40, 40];

//undefined
//side3(center0, volume0, topVolume0);

//defined
//side3(center0, volume0, topVolume0, side3_dimensions);

//module that generates the sides 
module main_sides3 (center, volume, topVolume, sideDimensions) {
    //main dimensions
    //full dimensions of the sides
    fullLegnth = volume[0];
    fullWidth = volume[1];
    fullDepth = volume[2];
    
    widthBetweenSides = topVolume[1];
    topLength = topVolume[0];
    
    //dimensions of the space on the sides 
    spaceLength = sideDimensions[0];
    spaceWidth = spaceLength;
    spaceDepth = sideDimensions[1];
    
    sideThickness = (fullWidth - widthBetweenSides)/2;
    
    translate ([center[0], center[1], center[2]]) {
        translate ([-fullLegnth/2, -fullWidth/2, -fullDepth/2]) {
            difference() {
                //main
                cube ([fullLegnth, fullWidth, fullDepth]);
        
                //cutouts 
                translate ([-fullLegnth/2, (fullWidth - widthBetweenSides)/2, (fullDepth - spaceDepth)/2])
                    cube ([fullLegnth*2, widthBetweenSides, spaceDepth]);
            
                translate ([(fullLegnth - spaceLength)/2, -fullWidth/2, (fullDepth - spaceDepth)/2])
                    cube ([spaceLength, fullWidth*2, spaceDepth]);
            
                translate ([(fullLegnth - spaceLength)/2, (fullWidth - widthBetweenSides)/2, -fullDepth/2])
                    cube ([spaceLength, widthBetweenSides, fullDepth]);
            
                translate ([(fullLegnth - topLength), (fullWidth - widthBetweenSides)/2, spaceDepth/2])
                    cube ([topLength, widthBetweenSides, spaceDepth]);
            
                translate ([fullLegnth - (fullLegnth/8), (fullWidth - widthBetweenSides)/2, fullDepth - (fullDepth/8)])
                    cube ([fullLegnth/4, widthBetweenSides, fullDepth/4]);
            }   
        }
    }
}

//module that handles undefined dimensions 
module side3(center, volume, topVolume, sideDimensions = "undefined") {

    //defined side dimensions 
    if (sideDimensions != "undefined") {
        //generates the sides
        main_sides3(center, volume, topVolume, sideDimensions);
    }
    
    //undefined side dimensions
    else {
        echo("undefined side dimensions");
        
        //estimates side dimensions 
        spaceLegnth = rand_percentage(volume[0], 80, 85);
        spaceDepth = rand_percentage(volume[2], 80, 85);
        
        sideDimensions = [spaceLegnth, spaceDepth];
        
        //generates the sides
        main_sides3(center, volume, topVolume, sideDimensions);
    }
}





//radius of curve, length and depth of the inner space 
side4_dimensions = [8, 45, 45];

//undefined
//side4(center0, volume0, topVolume0);

//defined
//side4(center0, volume0, topVolume0, side4_dimensions);

//module that generates the sides 
module main_sides4(center, volume, topVolume, sideDimensions) {
    //main dimensions
    //full dimensions of the sides
    fullLegnth = volume[0];
    fullWidth = volume[1];
    fullDepth = volume[2];
    
    widthBetweenSides = topVolume[1];
    
    //dimensions of the space on the sides 
    sideRadius = sideDimensions[0];
    spaceLength = sideDimensions[1];
    spaceDepth = sideDimensions[2];
    
    sideThickness = (fullWidth - widthBetweenSides)/2;
    
    translate ([center[0], center[1], center[2]]) {
        translate ([-fullLegnth/2, -fullWidth/2, -fullDepth/2]) {
            difference() {
                //main
                roudedCube(fullLegnth, fullWidth, fullDepth, sideRadius);

                //%cube ([fullLegnth, fullWidth, fullDepth]);
        
                //cutouts
                translate ([-fullLegnth/2, (fullWidth - widthBetweenSides)/2, -fullDepth/2])
                    cube ([fullLegnth*2, widthBetweenSides, fullDepth*2]);
                    
                translate ([-spaceLength + (fullLegnth - spaceLength)/2, -fullWidth/2, (fullDepth - spaceDepth)/2])
                    //cube ([spaceLength, fullWidth*2, spaceDepth]);
                    roudedCube(spaceLength*2, fullWidth*2, spaceDepth, sideRadius);
            }   
        }
    }
}

//module that handles undefined dimensions 
module side4 (center, volume, topVolume, sideDimensions = "undefined") {

    //defined side dimensions 
    if (sideDimensions != "undefined") {
        //generates the sides
        main_sides4(center, volume, topVolume, sideDimensions);
    }
    
    //undefined side dimensions
    else {
        echo("undefined side dimensions");
        
        //estimates side dimensions 
        sideRadius = rand_percentage((volume[0] + volume[2])/2, 10, 25);
        spaceLegnth = rand_percentage(volume[0], 88, 95);
        spaceDepth = rand_percentage(volume[2], 88, 95);
        
        sideDimensions = [sideRadius, spaceLegnth, spaceDepth];
        
        //generates the sides
        main_sides4(center, volume, topVolume, sideDimensions);
    }
}






//curved sides

//curvature radius
side5_dimensions = [10];

//undefined
//side5(center0, volume0, topVolume0);

//defined
side5(center0, volume0, topVolume0, side5_dimensions);

//module that generates the sides 
module main_sides5 (center, volume, topVolume, sideDimensions) {
    rez = 25;
    
    //main dimensions
    //full dimensions of the sides
    fullLegnth = volume[0];
    fullWidth = volume[1];
    fullDepth = volume[2];
    
    widthBetweenSides = topVolume[1];
    
    //dimensions of the space on the sides 
    curveRadius = sideDimensions[0];
    
    sideThickness = (fullWidth - widthBetweenSides)/2;
    
    translate ([center[0], center[1], center[2]]) {
        translate ([-fullLegnth/2, -fullWidth/2, -fullDepth/2]) {
            difference() {
                //main
                //%cube ([fullLegnth, fullWidth, fullDepth]);
                
                hull() {
                    rotate ([90, 0, 0]){
                        translate([fullLegnth - curveRadius, fullDepth - curveRadius, -fullWidth/2])
                            cylinder (fullWidth, curveRadius, curveRadius, center = true, $fn = rez);
                    
                    //rotate ([90, 0, 0])
                        translate([fullLegnth - curveRadius, curveRadius, -fullWidth/2])
                            cylinder (fullWidth, curveRadius, curveRadius, center = true, $fn = rez);
                
                    //rotate ([90, 0, 0])
                        translate([curveRadius, curveRadius, -fullWidth/2])
                            cylinder (fullWidth, curveRadius, curveRadius, center = true, $fn = rez);
                
                    //rotate ([90, 0, 0])
                        translate([curveRadius, fullDepth - curveRadius, -fullWidth/2])
                            cylinder (fullWidth, curveRadius, curveRadius, center = true, $fn = rez);
                    }
                }
                
        
                //cutouts
                translate ([-fullLegnth/2, (fullWidth - widthBetweenSides)/2, -fullDepth/2])
                    cube ([fullLegnth*2, widthBetweenSides, fullDepth*2]);
                    
                //%translate ([(fullLegnth - spaceLength)/2, -fullWidth/2, (fullDepth - spaceDepth)/2])
                    //cube ([spaceLength, fullWidth*2, spaceDepth]);
            }   
        }
    }
}

//module that handles undefined dimensions 
module side5 (center, volume, topVolume, sideDimensions = "undefined") {

    //defined side dimensions 
    if (sideDimensions != "undefined") {
        //generates the sides
        main_sides5(center, volume, topVolume, sideDimensions);
    }
    
    //undefined side dimensions
    else {
        echo("undefined side dimensions");
        
        //estimates side dimensions 
        curveRadius = rand_percentage((volume[0] + volume[2])/2, 7, 13);
        
        sideDimensions = [curveRadius];
        
        //generates the sides
        main_sides5(center, volume, topVolume, sideDimensions);
    }
}