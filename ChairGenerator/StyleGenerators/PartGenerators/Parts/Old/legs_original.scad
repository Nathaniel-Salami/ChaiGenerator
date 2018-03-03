use <Curved_Pipe_Library_for_OpenSCAD/curvedPipe.scad>
use <Curved_Pipe_Library_for_OpenSCAD/curvedPipe.scad>
use <seats.scad>
use <backs.scad>
//legs library
center1 = [25, 25, 35];

//rectangular legs

//dimensions = [length(x), width(y), depth(z)]
legs1_Dimensions = [40, 40, 50];        //length and width between the legs  

//undefined
//legs1(center1);

//defined
//legs1(center1, legs1_Dimensions);

module legs1(center, legs_Dimensions = "undefined") {    
    //leg dimensions
    if (legs_Dimensions == "undefined") {
        echo("undefined");
        
        //dimensions of each individual leg
        legLength = (center[0]*2 - center[0]*2 * round(rands(90, 95, 1)[0])/100);
        legWidth = legLength;
        legDepth = center[2]*2;
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
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
    
    else {
        echo("defined");
        
        //dimensions of each individual leg
        legLength = (center[0]*2 - legs_Dimensions[0])/2;
        legWidth = (center[1]*2 - legs_Dimensions[1])/2;
        legDepth = legs_Dimensions[2];
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
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

//dimensions = [length(x), width(y), depth(z)]
legs2_Dimensions = [45, 45, 50];        //length and width between the legs   

//undefined
//legs2(center1);

//defined
//legs2(center1, legs2_Dimensions);

module legs2(center, legs_Dimensions = "undefined") {    
    //leg dimensions
    if (legs_Dimensions == "undefined") {
        echo("undefined");
        
        //dimensions of each individual leg
        legRadius = ((center[0] + center[1]) - (center[0] + center[1]) * round(rands(95, 97, 1)[0])/100);
        legDepth = center[0]*2;
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
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
    
    else {
        echo("defined");
        
        //dimensions of each individual leg
        legRadius = ((center[0] + center[1]) - legs_Dimensions[0])/2;
        legDepth = legs_Dimensions[2];
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
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

//dimensions = [radius, depth(z)]
leg3_Dimensions = [45, 45, 50];  //uses the length and width from the seat 
leg3_CurveRadius = 5;

//undefined
//legs3(center1);

//defined
legs3(center1, leg3_Dimensions, leg3_CurveRadius);

module legs3(center, leg_Dimensions = "undefined", leg_CurveRadius = "undefined") { 
 
    //leg dimensions
    if ((leg_Dimensions == "undefined") || (leg_CurveRadius == "undefined")) {
        echo("undefined");
        
        //leg dimensions
        legRadius = ((center[0] + center[1]) - (center[0] + center[1]) * round(rands(95, 97, 1)[0])/100);
        legDepth = center[2]*2;
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
        
        leg_CurveRadius = legRadius*round(rands(3, 5, 1)[0]);
        
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
            curvedPipe (points = [[-fullLength/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],                       //1
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],          //2
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],          //3
                                  [-fullLength/2 + legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],         //4
                                  [-fullLength/2 + legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],          //5
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],           //6
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2],           //7
                                  [-fullLength/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2]],                       //8
                     
                        segments = 7, 
    
                        radii = [leg_CurveRadius, leg_CurveRadius,
                                 leg_CurveRadius, leg_CurveRadius,
                                 leg_CurveRadius, leg_CurveRadius], 
    
                         od = legRadius, 
                         id = 0,
					     $fn = legRadius*50);
        }
    }
    
    else {
        echo("defined");
        
        //leg dimensions
        legRadius = ((center[0] + center[1]) - leg_Dimensions[0])/2;
        legDepth = leg_Dimensions[2];
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;
        
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
            curvedPipe (points = [[-fullLength/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],                       //1
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legRadius/2 + legDepth/2],          //2
                                  [fullLength/2 - legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],          //3
                                  [-fullLength/2 + legRadius/2, -fullWidth/2 + legRadius/2, -legDepth/2 + legRadius/2],         //4
                                  [-fullLength/2 + legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],          //5
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legDepth/2 + legRadius/2],           //6
                                  [fullLength/2 - legRadius/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2],           //7
                                  [-fullLength/2, fullWidth/2 - legRadius/2, -legRadius/2 + legDepth/2]],                       //8
                     
                        segments = 7, 
    
                        radii = [leg_CurveRadius, leg_CurveRadius,
                                 leg_CurveRadius, leg_CurveRadius,
                                 leg_CurveRadius, leg_CurveRadius], 
    
                         od = legRadius, 
                         id = 0,
					     $fn = legRadius*10);
        }
    }
}





//curved cylindrical legs
//leads up to the back of the seat

//back seat dimensions
back4_Dimensions = [2, 50];
seat4_Dimensions = [50, 2];
back_seat_radius4 = 10;
combinedWidth4 = 50;

back4_Depth = back4_Dimensions[1];

seat4_Length = seat4_Dimensions[0];
seat4_Width = combinedWidth4;

//dimensions = [radius, depth(z)]
legs4_Dimensions = [3, 3, 50];  //uses the length and width from the seat 
leg4_CurveRadius = 5;

/*translate ([0, 0, 0]) {
    seat_back(back4_Dimensions, seat4_Dimensions, combinedWidth4, back_seat_radius4);
    legs4(legs4_Dimensions, leg4_CurveRadius, seat4_Length, seat4_Width, back4_Depth, back_seat_radius4);
}*/

module legs4(legs4_Dimensions, leg4_CurveRadius, seat4_Length, seat4_Width, back4_Depth, back_seat_radius4) {    
    //leg dimensions
    legRadius = legs4_Dimensions[0];
    legDepth = legs4_Dimensions[1];
    
    curvedPipe (points = [[-seat4_Length/2 - legRadius/2, -seat4_Width/2 + legRadius/2, back4_Depth],					  //1
						[-seat4_Length/2 - seat4_Length*0.015, -seat4_Width/2 + legRadius/2, -legRadius/2],             //2
                          [seat4_Length/2 - legRadius/2, -seat4_Width/2 + legRadius/2, -legRadius/2],                     //3
                          [seat4_Length/2 - legRadius/2, -seat4_Width/2 + legRadius/2, -legDepth + legRadius/2],          //4
                          [-seat4_Length/2 + legRadius/2, -seat4_Width/2 + legRadius/2, -legDepth + legRadius/2],         //5
                          [-seat4_Length/2 + legRadius/2, seat4_Width/2 - legRadius/2, -legDepth + legRadius/2],          //6
                          [seat4_Length/2 - legRadius/2, seat4_Width/2 - legRadius/2, -legDepth + legRadius/2],           //7
                          [seat4_Length/2 - legRadius/2, seat4_Width/2 - legRadius/2, -legRadius/2],                      //8
                          [-seat4_Length/2 - seat4_Length*0.015, seat4_Width/2 - legRadius/2, -legRadius/2],              //9
						[-seat4_Length/2 - legRadius/2, seat4_Width/2 - legRadius/2, back4_Depth]],					  //10
                     
                         segments = 9, 
    
                         radii = [back_seat_radius4,
								leg4_CurveRadius, leg4_CurveRadius,
                                  leg4_CurveRadius, leg4_CurveRadius,
                                  leg4_CurveRadius, leg4_CurveRadius,
								back_seat_radius4], 
    
                         od = legRadius, 
                         id = 0,
					    $fn = legRadius*10);
}





//legs5
//similar to leg 4
//back seat dimensions
back5_Dimensions = [1.5, 30];
seat5_Dimensions = [40, 1.5];
back_seat_radius5 = 5;
combinedWidth5 = 55;

back5_Depth = back5_Dimensions[1];

seat5_Length = seat5_Dimensions[0];
seat5_Width = combinedWidth5;

//dimensions = [radius, depth(z)]
legs5_Dimensions = [2, 30];  //uses the length and width from the seat 
leg5_CurveRadius = 5;
leg5_Curve2_Radius = 15;

//starts from the back of the seat
leg5_FullLength = 60;

/*translate ([0, 0, 0]) {
    seat_back(back5_Dimensions, seat5_Dimensions, combinedWidth5, back_seat_radius5);
    legs5(legs5_Dimensions, leg5_CurveRadius, seat5_Length, seat5_Width, back5_Depth, back_seat_radius5, leg5_FullLength, leg5_Curve2_Radius);
}*/

module legs5(legs5_Dimensions, leg5_CurveRadius, seat5_Length, seat5_Width, back5_Depth, back_seat_radius5, leg5_FullLength, leg5_Curve2_Radius) {    
    //leg dimensions
    legRadius = legs5_Dimensions[0];
    legDepth = legs5_Dimensions[1];
    
    curvedPipe (points = [[-seat5_Length/2 - legRadius/2, 0, back5_Depth - legRadius/2],					  							//1
						[-seat5_Length/2 - legRadius/2, -seat5_Width/2 + legRadius/2, back5_Depth - legRadius/2],						//2
						[-seat5_Length/2 - seat5_Length*0.015, -seat5_Width/2 + legRadius/2, -legRadius/2],             				//3
                       	[seat5_Length/2 - legRadius/2, -seat5_Width/2 + legRadius/2, -legRadius/2],                     				//4
						[(leg5_FullLength - seat5_Length/2) - legRadius/2, -seat5_Width/2 + legRadius/2, -legRadius/2],				//5
						[(leg5_FullLength - seat5_Length/2) - legRadius/2, -seat5_Width/2 + legRadius/2, -legDepth + legRadius/2],		//6
                          [seat5_Length/2 - legRadius/2, -seat5_Width/2 + legRadius/2, -legDepth + legRadius/2],          				//7
                          [-seat5_Length/2 + legRadius/2, -seat5_Width/2 + legRadius/2, -legDepth + legRadius/2],         				//8
                          [-seat5_Length/2 + legRadius/2, seat5_Width/2 - legRadius/2, -legDepth + legRadius/2],          				//9
                          [seat5_Length/2 - legRadius/2, seat5_Width/2 - legRadius/2, -legDepth + legRadius/2],           				//10
						[(leg5_FullLength - seat5_Length/2) - legRadius/2, seat5_Width/2 - legRadius/2, -legDepth + legRadius/2],		//11
						[(leg5_FullLength - seat5_Length/2) - legRadius/2, seat5_Width/2 - legRadius/2, -legRadius/2],					//12
                          [seat5_Length/2 - legRadius/2, seat5_Width/2 - legRadius/2, -legRadius/2],                      				//13
                          [-seat5_Length/2 - seat5_Length*0.015, seat5_Width/2 - legRadius/2, -legRadius/2],              				//14
						[-seat5_Length/2 - legRadius/2, seat5_Width/2 - legRadius/2, back5_Depth - legRadius/2],						//15
						[-seat5_Length/2 - legRadius/2, 0, back5_Depth - legRadius/2]],					  							//16
                     
                         segments = 15, 
    
                         radii = [leg5_CurveRadius,
								back_seat_radius5, 
								0, 
								leg5_Curve2_Radius, leg5_Curve2_Radius, 
								0, 
								leg5_CurveRadius, leg5_CurveRadius, 
								0, 
								leg5_Curve2_Radius, leg5_Curve2_Radius, 
								0,
								back_seat_radius5, 
								leg5_CurveRadius], 
    
                         od = legRadius, 
                         id = 0,
					    $fn = legRadius*10);
}





//legs and arm-rest 
//full 
//dimensions= [length(x), width(y), depth(z)]
side6_Dimensions = [40, 5, 40];

//dimensions of the cutout space 
space6_Dimensions = [30, 30];	//[length(y), depth(z)]

//depth below the seat
side6_Position = 20;

/*translate ([0, 0, 0]) {
    seat1(seatDimensions);
	back1([5, 30], seatLength, seatWidth, seatDepth);
    legs6(side6_Dimensions, space6_Dimensions, side6_Position, seatLength, seatWidth);
}*/

module legs6(side6_Dimensions, space6_Dimensions, side6_Position, seatLength, seatWidth) { 
	//side dimensions 
	fullSideLength = side6_Dimensions[0];
	fullSideWidth = side6_Dimensions[1];
	fullSideDepth = side6_Dimensions[2];

	//cutout space dimensions
	spaceLength = space6_Dimensions[0];
	spaceDepth = space6_Dimensions[1];

    //right side
    difference() {
		//main 
        translate ([-seatLength/2, -seatWidth/2 - fullSideWidth, -side6_Position])
            cube ([fullSideLength, fullSideWidth, fullSideDepth]);

		//cutout
        translate ([-seatLength/2 + (fullSideLength - spaceLength)/2, -seatWidth/2 - fullSideWidth*2, -side6_Position + (fullSideDepth - spaceDepth)/2])
            cube ([spaceLength, fullSideWidth*3, spaceDepth]);
    }
    
    //left side
    difference() {
		//main 
        translate ([-seatLength/2, seatWidth/2, -side6_Position])
            cube ([fullSideLength, fullSideWidth, fullSideDepth]);

		//cutout
        translate ([-seatLength/2 + (fullSideLength - spaceLength)/2, seatWidth/2 - fullSideWidth, -side6_Position + (fullSideDepth - spaceDepth)/2])
            cube ([spaceLength, fullSideWidth*3, spaceDepth]);
    }
}






//legs and arm-rest 
//full 
//dimensions= [length(x), width(y), depth(z)]
/*outerFrame7_Dimensions = [60, 60, 60];
innerFrame7_Dimensions = [50, 50, 50];

//dimensions of the cutout space 
space7_Dimensions = [30, 30];	//[length(y), depth(z)]

//depth below the seat
frame7_Position = 30;

/*translate ([0, 0, 0]) {
    seat1(seatDimensions);
	back1([5, 40], seatLength, seatWidth, seatDepth);
    legs7(outerFrame7_Dimensions, innerFrame7_Dimensions, space7_Dimensions, frame7_Position, seatLength, seatWidth);
}*/

module legs7(outerFrame7_Dimensions, innerFrame7_Dimensions, space7_Dimensions, frame7_Position, seatLength, seatWidth) { 
	//outer frame dimensions 
	outerFrameLength = outerFrame7_Dimensions[0];
	outerFrameWidth = outerFrame7_Dimensions[1];
	outerFrameDepth = outerFrame7_Dimensions[2];

	//outer frame dimensions 
	innerFrameLength = innerFrame7_Dimensions[0];
	innerFrameWidth = innerFrame7_Dimensions[1];
	innerFrameDepth = innerFrame7_Dimensions[2];

    //frame
    difference() {
        //main
		translate ([seatLength/2 - outerFrameLength, -outerFrameWidth/2, -frame7_Position])
        		cube ([outerFrameLength, outerFrameWidth, outerFrameDepth]);  
      
        //cut out
		translate ([seatLength/2 - innerFrameLength - (outerFrameLength - innerFrameLength)/2, -outerFrameWidth, -frame7_Position + (outerFrameDepth - innerFrameDepth)/2])
        		cube ([innerFrameLength, outerFrameWidth*2, innerFrameDepth]);

		translate ([-outerFrameLength, -innerFrameWidth/2, -frame7_Position + (outerFrameDepth - innerFrameDepth)/2])
        		cube ([outerFrameLength*2, innerFrameWidth, innerFrameDepth]);

		translate ([seatLength/2 - innerFrameLength - (outerFrameLength - innerFrameLength)/2, -innerFrameWidth/2, -innerFrameDepth])
        		cube ([innerFrameLength, innerFrameWidth, innerFrameDepth*2]);

        	translate ([seatLength - innerFrameLength, -innerFrameWidth/2, (outerFrameDepth - innerFrameDepth)])
            cube ([innerFrameLength, innerFrameWidth, innerFrameDepth]);
    }
}






//rectangular connected legs
//bottom of the legs are connected

//dimensions= [length(x), width(y), depth(z)]
legs8_Dimensions = [5, 5, 40];		

//dimensions of the cutout space 
connector8_Depth = 5;	//[length(y), depth(z)]

/*translate ([0, 0, 0]) {
    seat1(seatDimensions);
	back1([5, 50], seatLength, seatWidth, seatDepth);
    legs8(legs8_Dimensions, connector8_Depth, seatLength, seatWidth);
}*/

module legs8(legs8_Dimensions, connector8_Depth, seatLength, seatWidth) { 
	//side dimensions 
	legLength = legs8_Dimensions[0];
	legWidth = legs8_Dimensions[1];
	legDepth = legs8_Dimensions[2];

	//cutout space dimensions
	spaceLength = seatLength - legLength*2;
	spaceDepth = legDepth - connector8_Depth;

    //right side
    difference() {
		//main 
        translate ([-seatLength/2, seatWidth/2 - legWidth, -legDepth])
            cube ([seatLength, legWidth, legDepth]);

		//cutout
        translate ([-seatLength/2 + legLength, seatWidth/2 - legWidth*2, -legDepth + connector8_Depth])
            cube ([spaceLength, legWidth*3, spaceDepth]);
    }
    
    //left side
    difference() {
		//main 
        translate ([-seatLength/2, -seatWidth/2, -legDepth])
            cube ([seatLength, legWidth, legDepth]);

		//cutout
        translate ([-seatLength/2 + legLength, -seatWidth/2 - legWidth, -legDepth + connector8_Depth])
            cube ([spaceLength, legWidth*3, spaceDepth]);
    }
}





//rectangular legs
//adds 4 connections to the legs 

//dimensions= [length(x), width(y), depth(z)]
legs9_Dimensions = [40, 40, 50];		//length and width between the legs  

//position of the connectors along the legs
connector9_Positions = [30, 25];	//[left/rigth position(z), front/back position(z)]

//depth of the connectors 
connector9_Depth = [5, 5];		//[left/rigth depth(z), front/back depth(z)]

connector9_dimensions = [connector9_Depth, connector9_Positions];

//undefined
//legs9(center1);

//defined
//legs9(center1, legs9_Dimensions, connector9_dimensions);

module legs9(center, legs_Dimensions = "undefined", connector_dimensions = "undefined") {
    
    if ((legs_Dimensions == "undefined") || (connector_dimensions == "undefined")) {
        echo("undefined");
        
        //leg dimensions
        legLength = (center[0]*2 - center[0]*2 * round(rands(90, 95, 1)[0])/100);
        legWidth = legLength;
        legDepth = center[2]*2;
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;

        //connector depth
        LRDepth = (legLength + legWidth)/2; 			//depth of the left and rigth connectors
        FBDepth = LRDepth; 			//depth of the front and back connectors

        //connector position
        LRPosition = legDepth * round(rands(60, 75, 1)[0])/100;		//Position of the left and rigth connectors
        FBPosition = LRPosition - LRDepth*2; 			//Position of the front and back connectors
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
            translate ([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([fullLength/2 - legLength, -fullWidth/2, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([-fullLength/2, -fullWidth/2, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
        
            //leg connectors

            //left and right
            translate ([-fullLength/2, fullWidth/2 - legWidth, -LRPosition/2])
                cube([fullLength, legWidth, LRDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -LRPosition/2])
                cube([fullLength, legWidth, LRDepth]); 
        
            //front and back
            translate ([fullLength/2 - legLength, -fullWidth/2, -FBPosition/2])
                cube([legLength, fullWidth, FBDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -FBPosition/2])
                cube([legLength, fullWidth, FBDepth]);
        }
    }
    
    else {
        echo("defined");
        
        //leg dimensions
        legLength = (center[0]*2 - legs_Dimensions[0])/2;
        legWidth = (center[1]*2 - legs_Dimensions[1])/2;
        legDepth = legs_Dimensions[2];
    
        //length and width between the outer edge of the legs 
        fullLength = center[0]*2;
        fullWidth = center[1]*2;

        //connector depth
        LRDepth = connector_dimensions[0][0]; 			//depth of the left and rigth connectors
        FBDepth = connector_dimensions[0][1]; 			//depth of the front and back connectors

        //connector position
        LRPosition = connector_dimensions[1][0]; 			//Position of the left and rigth connectors
        FBPosition = connector_dimensions[1][1]; 			//Position of the front and back connectors
    
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //legs
            translate ([fullLength/2 - legLength, fullWidth/2 - legWidth, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([fullLength/2 - legLength, -fullWidth/2, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([-fullLength/2, -fullWidth/2, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
            translate ([-fullLength/2, fullWidth/2 - legWidth, -legDepth/2])
                cube([legLength, legWidth, legDepth]);
        
            //leg connectors

            //left and right
            translate ([-fullLength/2, fullWidth/2 - legWidth, -LRPosition/2])
                cube([fullLength, legWidth, LRDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -LRPosition/2])
                cube([fullLength, legWidth, LRDepth]); 
        
            //front and back
            translate ([fullLength/2 - legLength, -fullWidth/2, -FBPosition/2])
                cube([legLength, fullWidth, FBDepth]); 

            translate ([-fullLength/2, -fullWidth/2, -FBPosition/2])
                cube([legLength, fullWidth, FBDepth]);
        }
    }
}





//display
	//legs1
	/*legs1_Dimensions = [4, 4, 40];

	translate ([0, 0, 0]) {
    		//seat1(seatDimensions);
    		legs1(legs1_Dimensions, seatLength, seatWidth);
	}

	//legs2
	legs2_Dimensions = [2, 40];

	translate ([0, 100, 0]) {
    		seat1(seatDimensions);
    		legs2(legs2_Dimensions, seatLength, seatWidth);
	}

	//legs3
	legs3_Dimensions = [3, 50];
	leg3_CurveRadius = 5;

	translate ([100, 0, 0]) {
    		seat1(seatDimensions);
    		legs3(legs3_Dimensions, leg3_CurveRadius, seatLength, seatWidth);
	}

	//legs4
	legs4_Dimensions = [3, 50];
	leg4_CurveRadius = 5;

	translate ([-100, 0, 0]) {
    		seat_back(back4_Dimensions, seat4_Dimensions, combinedWidth4, back_seat_radius4);
    		legs4(legs4_Dimensions, leg4_CurveRadius, seat4_Length, seat4_Width, back4_Depth, back_seat_radius4);
	}

	//legs5
	leg5_FullLength = 60;

	translate ([0, 200, 0]) {
    		seat_back(back5_Dimensions, seat5_Dimensions, combinedWidth5, back_seat_radius5);
    		legs5(legs5_Dimensions, leg5_CurveRadius, seat5_Length, seat5_Width, back5_Depth, back_seat_radius5, leg5_FullLength, leg5_Curve2_Radius);
	}

	//legs6
	side6_Dimensions = [40, 5, 40];

	//dimensions of the cutout space 
	space6_Dimensions = [30, 30];

	//depth below the seat
	side6_Position = 20;

	translate ([0, -100, 0]) {
    		seat1(seatDimensions);
		back1([5, 30], seatLength, seatWidth, seatDepth);
    		legs6(side6_Dimensions, space6_Dimensions, side6_Position, seatLength, seatWidth);
	}

	//legs7
	outerFrame7_Dimensions = [60, 60, 60];
	innerFrame7_Dimensions = [50, 50, 50];

	//dimensions of the cutout space 
	space7_Dimensions = [30, 30];

	//depth below the seat
	frame7_Position = 30;

	translate ([-200, 0, 0]) {
    		seat1(seatDimensions);
		back1([5, 40], seatLength, seatWidth, seatDepth);
    		legs7(outerFrame7_Dimensions, innerFrame7_Dimensions, space7_Dimensions, frame7_Position, seatLength, seatWidth);
	}

	//legs8
	legs8_Dimensions = [5, 5, 40];		

	//dimensions of the cutout space 
	connector8_Depth = 5;	//[length(y), depth(z)]

	translate ([100, 100, 0]) {
    		seat1(seatDimensions);
    		legs8(legs8_Dimensions, connector8_Depth, seatLength, seatWidth);
	}

	legs9_Dimensions = [5, 5, 70];		

	//position of the connectors along the legs
	connector9_Positions = [45, 50];	//[left/rigth position(z), front/back position(z)]

	//depth of the connectors 
	connector9_Depth = [5, 5];		//[left/rigth depth(z), front/back depth(z)]

	translate ([-100, 100, 0]) {
    		seat1(seatDimensions);
    		legs9(legs9_Dimensions, connector9_Depth, connector9_Positions, seatLength, seatWidth);
	}*/