use <Utilities/Utilities.scad>
use <Utilities/CurvedPipe/curvedPipe.scad>

//***BACKS LIBRARY***//

/*
//center used for constructing the backs 
center0 = [25, 25, 25];

//dimensions of the space the backs occupy 
volume0 = [50, 50, 50];

//shows the center and volume 
//visualization(center0, volume0);





//simple back

//length of the back 
back1_dimensions = [10];

//undefined 
//back1(center0, volume0);

//defined
//back1(center0, volume0, back1_dimensions);

//module that makes the back
module main_back1(center, volume, back_dimensions) {
    //back dimensions
    backLength = back_dimensions[0];
    backWidth = volume[1];
    backDepth = volume[2];
    
    //back
    translate ([center[0], center[1], center[2]]) {
        translate ([-volume[0]/2, -backWidth/2, -backDepth/2])
            cube([backLength, backWidth, backDepth]);
    }
}

//module that handles undefined dimensions 
module back1(center, volume, back_dimensions = "undefined") {    
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        //back
        main_back1(center, volume, back_dimensions);
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        
        back_dimensions = [backLength, volume[1], volume[2]];
        
        //back
        main_back1(center, volume, back_dimensions);
    }
}






//back with (cutout) vertical spaces

//width of space, depth of space, gap, number of spaces
space2_Dimensions = [5, 40, 5, 4];

//back length and space dimensions 
back2_Dimensions = [5, space2_Dimensions]; 

//undefined
//back2(center0, volume0);

//defined
//back2(center0, volume0, back2_Dimensions);

//module that makes the back
module main_back2(center, volume, back_dimensions) {
    //back dimensions 
    backLength = back_dimensions[0];
    backWidth = volume[1];
    backDepth = volume[2];
    
    //space dimensions
    spaceWidth = back_dimensions[1][0];
    spaceDepth = back_dimensions[1][1];
    gap = back_dimensions[1][2]; 
    spaceAmount = back_dimensions[1][3];
    
    fullCutOutWidth = (spaceWidth + gap)*spaceAmount - gap;
    
    //back
    translate ([center[0], center[1], center[2]]) {
        translate ([-volume[0]/2, -backWidth/2, -backDepth/2]) {
            difference() {
                //main
                cube([backLength, backWidth, backDepth]);
                
                //cutout
                translate([0, (backWidth - fullCutOutWidth)/2, 0]) {
                    for (i = [0: 1: spaceAmount-1]) {
                        translate([-backLength/2, (spaceWidth + gap)*i, 0])
                            cube([backLength*2, spaceWidth, spaceDepth]);
                    }
                }
            }
        }
    }
}

//module that handles undefined dimensions 
module back2(center, volume, back_dimensions = "undefined") {
    
    //back dimensions
    backWidth = volume[1];
    backDepth = volume[2];
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        
        //back
        main_back2(center, volume, back_dimensions);
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        
        //space dimensions
        spaceAmount = rand_percentage(backWidth, 7, 10);
        spaceWidth = rand_percentage(backWidth, 5, 20);
        spaceDepth = rand_percentage(backDepth, 70, 80);
        gap = rand_percentage(backWidth, 5, 10); 
        
        space_dimensions = [spaceWidth, spaceDepth, gap, spaceAmount];

        //back length and space dimensions 
        back_dimensions = [backLength, space_dimensions]; 
    
        //back
        main_back2(center, volume, back_dimensions);
    }
}





//back with (cutout) horizontal spaces

//width of space, depth of space, gap, number of spaces
space3_Dimensions = [40, 5, 5, 4];

//back length and space dimensions 
back3_Dimensions = [5, space3_Dimensions]; 

//undefined
//back3(center0, volume0);

//defined
//back3(center0, volume0, back3_Dimensions);

//module that makes the back
module main_back3(center, volume, back_dimensions) {
    //back dimensions 
    backLength = back_dimensions[0];
    backWidth = volume[1];
    backDepth = volume[2];
    
    //space dimensions
    spaceWidth = back_dimensions[1][0];
    spaceDepth = back_dimensions[1][1];
    gap = back_dimensions[1][2]; 
    spaceAmount = back_dimensions[1][3];
    
    fullCutOutWidth = (spaceDepth + gap)*spaceAmount - gap;

    //back
    translate ([center[0], center[1], center[2]]) {
        translate ([-volume[0]/2, -backWidth/2, -backDepth/2]) {
            difference() {
                //main
                cube([backLength, backWidth, backDepth]);
                
                //cutout
                translate([-backLength/2, (backWidth - spaceWidth)/2, 0]) {
                    for (i = [0: 1: spaceAmount-1]) {
                        translate([0, 0, (spaceDepth + gap)*i])
                            cube([backLength*2, spaceWidth, spaceDepth]);
                    }
                }
            }
        }
    }
}

//module that handles undefined dimensions 
module back3(center, volume, back_dimensions = "undefined") {    
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        //back
        main_back3(center, volume, back_dimensions);
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        backWidth = volume[1];
        backDepth = volume[2];
        
        //space dimensions
        spaceAmount = rand_percentage(backDepth, 5, 15);
        spaceWidth = rand_percentage(backWidth, 70, 90);
        spaceDepth = rand_percentage(backDepth, 5, 15);
        gap = rand_percentage(backDepth, 5, 10);
        
        space_Dimensions = [spaceWidth, spaceDepth, gap, spaceAmount];
        
        back_dimensions = [backLength, space_Dimensions];
        
        //back
        main_back3(center, volume, back_dimensions);
    }
}







//back with a space in the back

//width of space and depth of space
space4_Dimensions = [40, 30];

//back length and space dimensions 
back4_Dimensions = [5, space4_Dimensions]; 

//undefined
//back4(center0, volume0);

//defined
//back4(center0, volume0, back4_Dimensions);

//module that makes the back
module main_back4(center, volume, back_dimensions) {
    //back dimensions 
    backLength = back_dimensions[0];
    
    //space dimensions
    spaceWidth = back_dimensions[1][0];
    spaceDepth = back_dimensions[1][1];
    
    space_Dimensions = [spaceWidth, spaceDepth, 1, 1];
        
    back_dimensions = [backLength, space_Dimensions];

    //back
    //uses back3 
    back3 (center, volume, back_dimensions);
}

//module that handles undefined dimensions 
module back4(center, volume, back_dimensions = "undefined") {    
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        //back
        main_back4(center, volume, back_dimensions);
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        backWidth = volume[1];
        backDepth = volume[2];
        
        //space dimensions
        spaceWidth = rand_percentage(backWidth, 75, 80);
        spaceDepth = rand_percentage(backDepth, 50, 65);
        
        back_dimensions = [backLength, [spaceWidth, spaceDepth]];
        
        //back
        main_back4(center, volume, back_dimensions);
    }
}







//back5
//similar to back4

//width of rest, depth of rest, postion of rest(z)
rest5_Dimensions = [40, 20, 25];

//back length and space dimensions 
back5_Dimensions = [5, rest5_Dimensions]; 

//undefined
//back5(center0, volume0);

//defined
//back5(center0, volume0, back5_Dimensions);

module main_back5 (center, volume, back_dimensions) {
    //back dimensions 
    //back dimensions 
    backLength = back_dimensions[0];
    
    //rest dimensions
    restWidth = back_dimensions[1][0];
    restDepth = back_dimensions[1][1];
    restPosition = back_dimensions[1][2];
    
    //back
    //uses back3 
    back3(center, volume, [backLength, [restWidth, restPosition, restDepth, 2]]);
}

module back5(center, volume, back_dimensions = "undefined") {
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        
        //back
        main_back5(center, volume, back_dimensions);
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        
        //rest dimensions
        restWidth = rand_percentage(volume[1], 75, 85);
        restDepth = rand_percentage(volume[2], 30, 40);
        restPosition = rand_percentage(volume[2], 45, 50);
        
        back_dimensions = [backLength, [restWidth, restDepth, restPosition]];
        
        //back
        main_back5(center, volume, back_dimensions);
    }
}





//back with vertical rods

//radius of rods, depth of rods, gap, number of rods
rod6_Dimensions = [40, 10, 5];

//back length and space dimensions 
back6_Dimensions = [5, rod6_Dimensions]; 

//undefined
back6(center0, volume0);

//defined
//back6(center0, volume0, back6_Dimensions);

module back6(center, volume, back_dimensions = "undefined") {
    rez = 25;
    
    //back dimensions
    backWidth = volume[1];
    backDepth = volume[2];
    
    //undefined back dimensions
    if (back_dimensions == "undefined") {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 12);
        
        //space dimensions
        rodRadius = backLength/4;
        rodDepth = rand_percentage(backDepth, 80, 90);
        gap = rand_percentage(backWidth, 15, 20);
        rodAmount = round(rands(4, 5, 1)[0]);
        
        fullRodWidth = ((rodRadius + gap) * rodAmount) - gap + rodRadius;
    
        //back
        translate ([center[0], center[1], center[2]]) {
            translate ([-volume[0]/2, -backWidth/2, -backDepth/2]) {
                //top
                translate ([0, 0, rodDepth])
                    cube([backLength, backWidth, backDepth - rodDepth]);
                
                //cutout
                translate([rodRadius + backLength/4, (backWidth - fullRodWidth)/2 + rodRadius, rodDepth/2]) {
                    for (i = [0: 1: rodAmount-1]) {
                        translate([0, (rodRadius + gap)*i, 0])
                            cylinder (rodDepth, rodRadius, rodRadius, center = true, $fn = rez);
                    }
                }
                
            }
        }
    }
    
    //defined back dimensions
    else {
       
        //back dimensions 
        backLength = back_dimensions[0];
        
        //space dimensions
        rodRadius = backLength/4;
        rodDepth = back_dimensions[1][0];
        gap = back_dimensions[1][1]; 
        rodAmount = back_dimensions[1][2];
        
        fullRodWidth = ((rodRadius + gap) * rodAmount) - gap + rodRadius;
    
        //back
        translate ([center[0], center[1], center[2]]) {
            translate ([-volume[0]/2, -backWidth/2, -backDepth/2]) {
                //top
                translate ([0, 0, rodDepth])
                    cube([backLength, backWidth, backDepth - rodDepth]);
                
                //cutout
                translate([rodRadius + backLength/4, (backWidth - fullRodWidth)/2 + rodRadius, rodDepth/2]) {
                    for (i = [0: 1: rodAmount-1]) {
                        translate([0, (rodRadius + gap)*i, 0])
                            cylinder (rodDepth, rodRadius, rodRadius, center = true, $fn = rez);
                    }
                }
                
            }
        }
    }
}



//not a back 
//back7(center0, volume0);

module back7(center, volume, back_dimensions) {
    echo("EMPTY BACK");
}



//back 8
//length and top curvature
back8_dimensions = [10, 5];

//TEST
//back8(center0, volume0, back8_dimensions);
//back8(center0, volume0, "undefined");

module back8(center, volume, back_dimensions = "undefined") {
    rez = 25;  
    
    //defined back dimensions
    if (back_dimensions != "undefined") {
        //back
        //back dimensions
        backLength = back_dimensions[0];
        backWidth = volume[1];
        backDepth = volume[2];
        
        topRadius = back_dimensions[1];
        
        //back
        translate ([center[0], center[1], center[2]]) {
            hull() {
                translate ([-volume[0]/2, -backWidth/2, -backDepth/2])
                    cube([backLength, backWidth, backDepth]);
                
                rotate ([90, 0, 0]) 
                    translate ([-volume[0]/2 + topRadius, backDepth/2, 0])
                        cylinder (backWidth, topRadius, topRadius, center = true, $fn = rez);
            }
        }
    }
    
    //undefined back dimensions
    else {
        //echo("undefined back dimensions");
        
        //back dimensions 
        backLength = rand_percentage(volume[0], 10, 15);
        backWidth = volume[1];
        backDepth = volume[2];
        
        topRadius = backLength/2;
        
        //back
        translate ([center[0], center[1], center[2]]) {
            hull() {
                translate ([-volume[0]/2, -backWidth/2, -backDepth/2])
                    cube([backLength, backWidth, backDepth]);
                
                rotate ([90, 0, 0]) 
                    translate ([-volume[0]/2 + topRadius, backDepth/2, 0])
                        cylinder (backWidth, topRadius, topRadius, center = true, $fn = rez);
            }
        }
    }
}