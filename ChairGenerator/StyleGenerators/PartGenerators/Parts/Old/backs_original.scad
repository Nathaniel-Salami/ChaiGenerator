use<seats.scad>
//libraries for different backs 


center1 = [25, 25, 25];

//simple back

//dimensions = [length(x), width(y), depth(z)]
back1_Dimensions = [5, 50, 50]; 

//back1(center1, back1_Dimensions);

module back1(center, back_Dimensions) {    
    //back dimensions
    backLength = back_Dimensions[0];
    backWidth = back_Dimensions[1];
    backDepth = back_Dimensions[2];
    
    
    translate ([center[0], center[1], center[2]]) {
        //center
        translate ([-5/2, -5/2, -5/2])
            %cube([5, 5, 5]);
        
        //back
        translate ([-center[0], -backWidth/2, -backDepth/2])
            cube([backLength, backWidth, backDepth]);
    }
}





//back with a raised back rest

//dimensions = [length(x), depth(z)]
back2_Dimensions = [5, 50, 50];

//space between the back and seat
//starts from the seat 
back2_SpaceDimensions = [40, 30]; //width(y) and depth(z) 

//undefined
//back2(center1, back2_Dimensions);

//defined
//back2(center1, back2_Dimensions, back2_SpaceDimensions);

module back2(center, back_Dimensions, space_Dimensions = "undefined") {
    //back dimensions
    backLength = back_Dimensions[0];
    backWidth = back_Dimensions[1];
    backDepth = back_Dimensions[2];
    
    translate ([center[0], center[1], center[2]]) {
        //center
        translate ([-5/2, -5/2, -5/2])
            %cube([5, 5, 5]);
        
        //back
        translate ([-center[0], -backWidth/2, -backDepth/2]) {
            difference() {
                //main
                cube ([backLength, backWidth, backDepth]);
        
                //cut out
                if (space_Dimensions == "undefined") {
                    echo("undefined");
                    spaceWidth = backWidth * round(rands(55, 80, 1)[0])/100;
                    spaceDepth = backDepth * round(rands(45, 70, 1)[0])/100;
                    
                    translate ([-backLength, (backWidth - spaceWidth)/2, 0])
                        cube ([backLength*3, spaceWidth, spaceDepth]);
                }
    
                else {
                    echo("defined");
                    spaceWidth = space_Dimensions[0];
                    spaceDepth = space_Dimensions[1];
                    
                    translate ([-backLength, (backWidth - spaceWidth)/2, 0])
                        cube ([backLength*3, spaceWidth, spaceDepth]);
                }
            }
        }
    }
}





//back with cutout vertical spaces

//dimensions = [length(x), depth(z)]
back3_Dimensions = [5, 50, 50]; 

//width and depth of each space, width between spaces, number of spaces
space3_Dimensions = [5, 40, 5, 4];

//undefined
//back3(center1, back3_Dimensions);

//defined
//back3(center1, back3_Dimensions, space3_Dimensions);

module back3(center, back_Dimensions, space_Dimensions = "undefined") {
    //back dimensions
    backLength = back_Dimensions[0];
    backWidth = back_Dimensions[1];
    backDepth = back_Dimensions[2];
    
    translate ([center[0], center[1], center[2]]) {
        //center
        translate ([-5/2, -5/2, -5/2])
            %cube([5, 5, 5]);
        
        //back
        translate ([-center[0], -backWidth/2, -backDepth/2]) {
            difference() {
                //main
                cube([backLength, backWidth, backDepth]);
        
                //cutout
                //undefined
                if (space_Dimensions == "undefined") {
                    echo("undefined");
                    
                    //space dimensions
                    spaceAmount = round(backWidth * round(rands(30, 80, 1)[0])/1000);
                    widthBetween = backWidth * round(rands(10, 30, 1)[0])/100;
                    spaceWidth = backWidth * round(rands(10, 30, 1)[0])/100;
                    spaceDepth = backDepth * round(rands(60, 80, 1)[0])/100;
    
                    fullCutOutWidth = (spaceWidth + widthBetween)*spaceAmount - widthBetween;
                    
                    translate([0, (backWidth - fullCutOutWidth)/2, 0]) {
                        for (i = [0: 1: spaceAmount-1]) {
                            translate([-backLength/2, (spaceWidth + widthBetween)*i, 0])
                                cube([backLength*2, spaceWidth, spaceDepth]);
                        }
                    }
                }
    
                //defined
                else {
                    echo("defined");
                    
                    //space dimensions
                    spaceWidth = space_Dimensions[0];
                    spaceDepth = space_Dimensions[1];
                    widthBetween = space_Dimensions[2];
                    spaceAmount = space_Dimensions[3];
    
                    fullCutOutWidth = (spaceWidth + widthBetween)*spaceAmount - widthBetween;
                    
                    translate([0, (backWidth - fullCutOutWidth)/2, 0]) {
                        for (i = [0: 1: spaceAmount-1]) {
                            translate([-backLength/2, (spaceWidth + widthBetween)*i, 0])
                                cube([backLength*2, spaceWidth, spaceDepth]);
                        }
                    }
                }
            }   
        }
    }
}





//back with horizontal spaces

//dimensions = [length(x), depth(z)]
back4_Dimensions = [5, 50, 50]; 

//width and depth of each space, depth between spaces, number of spaces
space4_Dimensions = [40, 5, 5, 5];

//undefined
//back4(center1, back4_Dimensions);

//defined
//back4(center1, back4_Dimensions, space4_Dimensions);

module back4(center, back_Dimensions, space_Dimensions = "undefined") {
    //back dimensions
    backLength = back_Dimensions[0];
    backWidth = back_Dimensions[1];
    backDepth = back_Dimensions[2];
    
    translate ([center[0], center[1], center[2]]) {
        //center
        translate ([-5/2, -5/2, -5/2])
            %cube([5, 5, 5]);
        
        //back
        translate ([-center[0], -backWidth/2, -backDepth/2]) {
            difference() {
                //main
                cube([backLength, backWidth, backDepth]);
        
                //cutout
                //undefined
                if (space_Dimensions == "undefined") {
                    echo("undefined");
                    
                    //space dimensions
                    spaceAmount = round(backDepth * round(rands(30, 80, 1)[0])/1000);
                    depthBetween = backWidth * round(rands(10, 30, 1)[0])/100;
                    spaceDepth = backWidth * round(rands(10, 30, 1)[0])/100;
                    spaceWidth = backDepth * round(rands(60, 80, 1)[0])/100;
                    
                    translate([-backLength/2, (backWidth - spaceWidth)/2, 0]) {
                        for (i = [0: 1: spaceAmount-1]) {
                            translate([0, 0, (spaceDepth + depthBetween)*i])
                                cube([backLength*2, spaceWidth, spaceDepth]);
                        }
                    }
                }
    
                //defined
                else {
                    echo("defined");
                    
                    //space dimensions
                    spaceWidth = space_Dimensions[0];
                    spaceDepth = space_Dimensions[1];
                    depthBetween = space_Dimensions[2];
                    spaceAmount = space_Dimensions[3];
                    
                    translate([-backLength/2, (backWidth - spaceWidth)/2, 0]) {
                        for (i = [0: 1: spaceAmount-1]) {
                            translate([0, 0, (spaceDepth + depthBetween)*i])
                                cube([backLength*2, spaceWidth, spaceDepth]);
                        }
                    }
                }
            }   
        }
    }
}





//back with vertical cylindrical rods 

//radius, depth(z), rod number and space between rods
back5_RodDimensions = [1.5, 50, 4, 9];   

//dimensions = [length(x), width(y), depth(z)]
back5_TopDimensions = [4, 50, 5];

translate ([0, 00, 0]) {
    s = [50, 50, 5];
    seat1(s);
    back5(back5_RodDimensions, back5_TopDimensions, s[0], s[1], s[2]);
}

module back5(back5_RodDimensions, back5_TopDimensions, seatLength, seatWidth, seatDepth) {
    //back dimensions
    rodRadius = back5_RodDimensions[0];
    rodDepth = back5_RodDimensions[1];
    rodAmount = back5_RodDimensions[2];
    spaceBetween = back5_RodDimensions[3];
    
    topLength = back5_TopDimensions[0];
    topWidth = back5_TopDimensions[1];
    topDepth = back5_TopDimensions[2];
        
    //back rods
    translate ([-seatLength/2 + rodRadius, (spaceBetween - (rodRadius*2 + spaceBetween)*rodAmount)/2, seatDepth])
        for (i = [0: 1: rodAmount-1]) {
                translate([0, rodRadius + (rodRadius*2 + spaceBetween)*i, 0])
                    cylinder (rodDepth, rodRadius, rodRadius, center = false, $fn = rodRadius*10);
            }
    
    //back top
    translate ([-seatLength/2, -topWidth/2, rodDepth + seatDepth])
        cube ([topLength, topWidth, topDepth]);
}



/*

//seat and back connected with a curve 

//dimensions = [length(x), depth(z)]
back6_Dimensions = [5, 50];
seat6_Dimensions = [50, 5];


//radius of seat and back curve 
//affects th curvature of the back
radius6 = 8;        //radius <= backDepth/2 or seatLength/2

combinedWidth = 50;    //width of both the seat and back

translate ([100, 0, 0]) {
    seat_back(back6_Dimensions, seat6_Dimensions, combinedWidth, radius6);
}

module seat_back(back6_Dimensions, seat6_Dimensions, combinedWidth, radius6) {
    //back dimensions
    backLength = back6_Dimensions[0];
    backDepth = back6_Dimensions[1];
    
    //seat dimensions
    seatLength = seat6_Dimensions[0];
    seatDepth = seat6_Dimensions[1];
    
    difference() {
        //main
        hull() {
            translate ([0, -combinedWidth/2, 0])
                cube ([seatLength/2, combinedWidth, seatDepth]);
                
            translate ([-seatLength/2 + radius6, combinedWidth/2, radius6])
                rotate([90, 0, 0])
                    cylinder (combinedWidth, radius6, radius6, $fn = radius6*10);
                
            translate ([-seatLength/2, -combinedWidth/2, backDepth/2])
                cube ([backLength, combinedWidth, backDepth/2]);
        }
        
        //cutout
        translate([backLength, 0, seatDepth])
            hull() {
                translate ([0, -combinedWidth, 0])
                    cube ([seatLength/2, combinedWidth*2, seatDepth]);
                    
                translate ([-seatLength/2 + radius6, combinedWidth, radius6])
                    rotate([90, 0, 0])
                        cylinder (combinedWidth*2, radius6, radius6, $fn = radius6*10);
                    
                translate ([-seatLength/2, -combinedWidth, backDepth/2])
                    cube ([backLength, combinedWidth*2, backDepth/2]);
            }
    }
}





//slanted back
//this back starts from the bottom of the seat

//dimensions = [length(x), depth(z)]
back7_Dimensions = [5, 50];  //uses the width from the seat 

//the top of the back is displaced by this amountto produce the slant 
back7_Slant = 20;

translate ([-100, 0, 0]) {
	seat1(seatDimensions);
	back7(back7_Dimensions, back7_Slant, seatLength, seatWidth, seatDepth);
}

module back7(back7_Dimensions, back7_Slant, seatLength, seatWidth, seatDepth) {    
    //back dimensions
    backLength = back7_Dimensions[0];
    backDepth = back7_Dimensions[1];
    
    //back
	hull() {
    		translate ([-seatLength/2, -seatWidth/2, 0])
        		cube([backLength, seatWidth, backDepth*0.0001]);

		translate ([-seatLength/2 - back7_Slant, -seatWidth/2, seatDepth + backDepth])
        		cube([backLength, seatWidth, backDepth*0.0001]);
	}
}