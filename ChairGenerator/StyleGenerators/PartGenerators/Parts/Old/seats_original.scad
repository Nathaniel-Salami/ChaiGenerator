//libraries used to create seats 



center1 = [25, 25, 25];

//simple seat

//dimensions = [length(x), width(y), depth(z)]
seat1_dimensions = [50, 50, 10];

//seat1(center1, seat1_dimensions);

module seat1(center, seat_dimensions) {
    //seat dimensions
    seatLength = seat_dimensions[0];
    seatWidth = seat_dimensions[1];
    seatDepth = seat_dimensions[2];
    
    translate ([center[0], center[1], center[2]]) {
        //center
        translate ([-5/2, -5/2, -5/2])
            %cube([5, 5, 5]);
        
        //seat
        translate ([-seatLength/2, -seatWidth/2, -seatDepth/2])
            cube([seatLength, seatWidth, seatDepth]);
    }
}





//champhered seat

//top and middle sections of the seat
top2_Dimensions = [50, 50]; //[length(x), width(y)]

//[length(x), width(y), depth(z)]
mid2_Dimensions = [55, 55, 5];      //depth is its position above the base of the seat

//bottom section of seat, acts as main dimension when other section dimension arent given
//[length(x), width(y), full depth(z)]
seat2_Dimensions = [50, 50, 10]; 

//defined 
//seat2(center1, seat2_Dimensions, mid2_Dimensions, top2_Dimensions);

//undefined 
//seat2(center1, seat2_Dimensions);

module seat2(center, seat_dimensions, mid_Dimensions = "undefined", top_Dimensions = "undefined") {
    //seat dimensions
    bottomSeatLength = seat_dimensions[0];
    bottomSeatWidth = seat_dimensions[1];
    
    seatDepth = seat_dimensions[2];
    
    if ((mid_Dimensions == "undefined") || (top_Dimensions == "undefined")) {
        echo("undefined");
        
        topSeatLength = bottomSeatLength;
        topSeatWidth = bottomSeatWidth;
    
        midSeatLength = bottomSeatLength*1.10;
        midSeatWidth = bottomSeatWidth*1.10;
        midSeatDepth = seatDepth/2;
        
        //seat
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //seat
            translate ([0, 0, -seatDepth/2]) {
                hull() {
                    //top
                    translate ([-topSeatLength/2, -topSeatWidth/2, seatDepth])
                        cube([topSeatLength, topSeatWidth, seatDepth*0.0001]);
            
                    //middle
                    translate ([-midSeatLength/2, -midSeatWidth/2, midSeatDepth])
                        cube([midSeatLength, midSeatWidth, seatDepth*0.0001]);
        
                    //bottom    
                    translate ([-bottomSeatLength/2, -bottomSeatWidth/2, 0])
                        cube([bottomSeatLength, bottomSeatWidth, seatDepth*0.0001]);
                }
            }
        }
    }
    
    else {
        echo("defined");
        
        topSeatLength = top_Dimensions[0];
        topSeatWidth = top_Dimensions[1];
    
        midSeatLength = mid_Dimensions[0];
        midSeatWidth = mid_Dimensions[1];
        midSeatDepth = mid_Dimensions[2];
    
        //seat
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //seat
            translate ([0, 0, -seatDepth/2]) {
                hull() {
                    //top
                    translate ([-topSeatLength/2, -topSeatWidth/2, seatDepth])
                        cube([topSeatLength, topSeatWidth, seatDepth*0.0001]);
            
                    //middle
                    translate ([-midSeatLength/2, -midSeatWidth/2, midSeatDepth])
                        cube([midSeatLength, midSeatWidth, seatDepth*0.0001]);
        
                    //bottom    
                    translate ([-bottomSeatLength/2, -bottomSeatWidth/2, 0])
                        cube([bottomSeatLength, bottomSeatWidth, seatDepth*0.0001]);
                }
            }
        }
    }
}


/*


//multi width seat

//dimensions = [length(x), frontWidth(y), backWidth(y), depth(z)]
seat3_dimensions = [60, 60, 40, 15];

translate([0, -100, 0])
    seat3(seat3_dimensions);

module seat3(seat3_dimensions) {
    //seat dimensions
    seatLength = seat3_dimensions[0];
    frontSeatWidth = seat3_dimensions[1];
    backSeatWidth = seat3_dimensions[2];
    seatDepth = seat3_dimensions[3];
    
    //seat
    hull() {
        translate ([seatLength/2, -frontSeatWidth/2, 0])
            cube ([seatLength*0.001, frontSeatWidth, seatDepth]); //front 
        translate ([-seatLength/2, -backSeatWidth/2, 0])
            cube ([seatLength*0.001, backSeatWidth, seatDepth]);  //back
    }
}




//fourth seat: combination of seat 2 and 3

//dimensions = [length(x), frontWidth(y), backWidth(y), depth(z)]
topSeat4Dimensions = [40, 40, 40]; //[length(x), frontWidth(y), backWidth(y)]

midSeat4Dimensions = [50, 50, 50, 5]; //[length(x), frontWidth(y), backWidth(y), depth(z)]

bottomSeat4Dimensions = [40, 40, 40]; //[length(x), frontWidth(y), backWidth(y)]

seat4Depth = 10; //full seat depth

seat4_dimensions = [topSeat4Dimensions, midSeat4Dimensions, bottomSeat4Dimensions, seat4Depth];

translate([100, 0, 0])
    seat4(seat4_dimensions);

module seat4(seat4_dimensions) {
    //seat dimensions
    topSeatLength = seat4_dimensions[0][0];
    topSeatFrontWidth = seat4_dimensions[0][1];
    topSeatBackWidth = seat4_dimensions[0][2];
    
    midSeatLength = seat4_dimensions[1][0];
    midSeatFrontWidth = seat4_dimensions[1][1];
    midSeatBackWidth = seat4_dimensions[1][2];
    midSeatDepth = seat4_dimensions[1][3];
    
    bottomSeatLength = seat4_dimensions[2][0];
    bottomSeatFrontWidth = seat4_dimensions[2][1];
    bottomSeatBackWidth = seat4_dimensions[2][2];
    
    seatDepth = seat4_dimensions[3];
    
    //seat
    hull() {
        //top
        hull() {
            translate ([topSeatLength/2, -topSeatFrontWidth/2, seatDepth])
                cube ([topSeatLength*0.001, topSeatFrontWidth, seatDepth*0.001]); //front 
            translate ([-topSeatLength/2, -topSeatBackWidth/2, seatDepth])
                cube ([topSeatLength*0.001, topSeatBackWidth, seatDepth*0.001]);  //back
        }
            
        //middle
        hull() {
            translate ([midSeatLength/2, -midSeatFrontWidth/2, midSeatDepth])
                cube ([midSeatLength*0.001, midSeatFrontWidth, seatDepth*0.001]); //front 
            translate ([-midSeatLength/2, -midSeatBackWidth/2, midSeatDepth])
                cube ([midSeatLength*0.001, midSeatBackWidth, seatDepth*0.001]);  //back
        }
        
        //bottom    
        hull() {
            translate ([bottomSeatLength/2, -bottomSeatFrontWidth/2, 0])
                cube ([bottomSeatLength*0.001, bottomSeatFrontWidth, seatDepth*0.001]); //front 
            translate ([-bottomSeatLength/2, -bottomSeatBackWidth/2, 0])
                cube ([bottomSeatLength*0.001, bottomSeatBackWidth, seatDepth*0.001]);  //back
        }
    }
}





//seat and back connected with a curve 

//dimensions = [length(x), depth(z)]
back6_Dimensions = [5, 50];
seat6_Dimensions = [50, 5];


//radius of seat and back curve 
//affects th curvature of the back
radius6 = 8;        //radius <= backDepth/2 or seatLength/2

combinedWidth = 50;    //width of both the seat and back

translate ([-100, 0, 0]) {
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


*/


//rounded edges

//dimensions = [length(x), width(y), depth(z)]
seat7_dimensions = [50, 50, 7];

edge7_radius = 3;

//defined 
//seat7(center1, seat7_dimensions, edge7_radius);

//undefined 
seat7(center1, seat7_dimensions);

module seat7(center, seat_dimensions, edge_radius = "undefined") {
    //seat dimensions
    seatLength = seat_dimensions[0];
    seatWidth = seat_dimensions[1];
    seatDepth = seat_dimensions[2];
    
    //%cube ([seatLength, seatWidth, seatDepth]);
    
    if (edge_radius == "undefined") {
        echo("undefined");
        
        edge_radius = ((seatLength + seatWidth)/2) * 0.05;
        
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //seat
            translate ([-seatLength/2, -seatWidth/2, -seatDepth/2]) {
                hull() {
                    //top
                    translate([edge_radius, edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
            
                    translate([edge_radius, seatWidth - edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
                
                    translate([seatLength - edge_radius, edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, seatWidth - edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
       
                    //bottom
                    translate([edge_radius, edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
            
                    translate([edge_radius, seatWidth - edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, seatWidth - edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
                }
            }
        }
    }
    
    else {
        echo("defined");
        
        translate ([center[0], center[1], center[2]]) {
            //center
            translate ([-5/2, -5/2, -5/2])
                %cube([5, 5, 5]);
        
            //seat
            translate ([-seatLength/2, -seatWidth/2, -seatDepth/2]) {
                hull() {
                    //top
                    translate([edge_radius, edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
            
                    translate([edge_radius, seatWidth - edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
                
                    translate([seatLength - edge_radius, edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, seatWidth - edge_radius, seatDepth - edge_radius])
                        sphere (edge_radius, $fn = edge_radius*20);
       
                    //bottom
                    translate([edge_radius, edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
            
                    translate([edge_radius, seatWidth - edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
        
                    translate([seatLength - edge_radius, seatWidth - edge_radius, 0])
                        cylinder (seatDepth*0.0001, edge_radius, edge_radius, $fn = edge_radius*20);
                }
            }
        }
    }
}