use <CurvedPipe/curvedPipe.scad>

//***UTILITIES***//
//Useful functions and modules




//**NOTE**//

//center/dimensions == [x, y, z];

/* split = [[[topCenter], [topVolume]],
            [[middleCenter], [middleVolume]],
            [[bottomCenter], [bottomVolume]]]; */

//Radius of center percentage
radiusP = 1;

//Sphere Resolution
rez = 10;




//***TESTING***//

//testing part and chair visualization
testCenter = [0, 0, 50];
testVolume = [50, 50, 100];
testP = [45, 10, 45];

partVisualization([testCenter[0], testCenter[0]-testVolume[1], testCenter[2]], testVolume);
chairVisualization(testCenter, testVolume, testP, true, false, true);




//***FUNCTIONS***//

/* Function: split */
/* in: center, volume and top, middle, and bottom percentages of a chair */
/* out: centers and dimensions for the top, middle and bottom of the chair */
/* Purpose: split the dimensions of the chair using split grammar method, chair is centered around the middle */

function split (center, volume, percentages) = 
         [[[center[0], center[1], center[2] + ((volume[2] * percentages[0]/100)/2) + (volume[2] * percentages[1]/100)/2], //top center
           [volume[0], volume[1], volume[2] * percentages[0]/100]], //top volume
          
          [[center[0], center[1], center[2]], //middle center
           [volume[0], volume[1], volume[2] * percentages[1]/100]], //middle center

          [[center[0], center[1], center[2] - ((volume[2] * percentages[2]/100)/2) - (volume[2] * percentages[1]/100)/2], //bottom center
           [volume[0], volume[1], volume[2] * percentages[2]/100]]]; //bottom volume  




//***MODUELES***//


/* Module: partVisualization */
/* in: center and dimensions of a part */
/* out: translucent box with a solid sphere to show the center */
/* Purpose: show the bounding volume for a part */

module partVisualization(center, dimensions) {
    r = (dimensions[0] + dimensions[1] + dimensions[2]) * (radiusP/100);
    
    translate ([center[0], center[1], center[2]]) {
        //center
        sphere(r, $fn = rez);
        
        //volume
        if (solid) {
            translate ([-dimensions[0]/2, -dimensions[1]/2, -dimensions[2]/2])
                #cube([dimensions[0], dimensions[1], dimensions[2]]);
        }
        
        else {
            translate ([-dimensions[0]/2, -dimensions[1]/2, -dimensions[2]/2])
                %cube([dimensions[0], dimensions[1], dimensions[2]]);
        }
    }
}


/* Module: chairVisualization */
/* in: center, dimensions and percentages of parts of a chair, booleans turning on or off a part visua
*/
/* out: translucent box with solid spheres to show the center of the parts of the chair */
/* Purpose: show how the split grammar works, chair is centered around the middle */

module chairVisualization(center, dimensions, percentages, topOn = true, middleOn = true, bottomOn = true) {
    splitValues = split(center, dimensions, percentages);
    
    //top
    if (topOn == true) {
        topCenter = splitValues[0][0];
        topVolume = splitValues[0][1];
        partVisualization(topCenter, topVolume);
    }
    
    //middle
    if (middleOn == true) {
        middleCenter = splitValues[1][0];
        middleVolume = splitValues[1][1];
        partVisualization(middleCenter, middleVolume);
    }
    
    //bottom
    if (bottomOn == true) {
         bottomCenter = splitValues[2][0];
        bottomVolume = splitValues[2][1];
        partVisualization(bottomCenter, bottomVolume);
    }
}




/*
//returns a random percentage of the value given within the range 
function rand_percentage(number, min_p, max_p) = round(number * round(rands(min_p, max_p, 1)[0])/100);



//divides the center and volume according to the percentage of the parts 
//returns the volume and center depth of the two diffent parts after the split 
function split (center, volume, top_p, bottom_p) = 
        [[[center[0], center[1], (center[2] + volume[2]/2) - (volume[2] * top_p/100)/2],            //top center
          [volume[0], volume[1], volume[2] * top_p/100]],                                           //top volume

         [[center[0], center[1], (center[2] - volume[2]/2) + (volume[2] * bottom_p/100)/2],         //bottom center
          [volume[0], volume[1], volume[2] * bottom_p/100]]];                                       //bottom volume
          
      
      
//breaks down a center and volume
//accepts main center and volume
//accepts array of the percentages of the main volume that the top should occupy 
//accepts the pecentage of the depth that the sides should occupy 
//returns center and volume for a top and sides
function split2 (center, volume, top_p, side_p) = 
    [[[(center[0] + volume[0]/2) - (volume[0] * top_p[0]/100)/2, center[1], 
       (center[2] + volume[2]/2) - (volume[2] * top_p[2]/100)/2],                       //top center
      [volume[0] * top_p[0]/100, volume[1] * top_p[1]/100, volume[2] * top_p[2]/100]],  //top volume

     [[center[0], center[1], (center[2] - volume[2]/2) + (volume[2] * side_p/100)/2],   //side center
      [volume[0], volume[1], volume[2] * side_p/100]]];                                 //side volume    
          
          

//MODULES//

//rouded cube
module roudedCube(length, width, depth, radius) {
    hull() {
        translate ([0, 0, 0])
            cube ([radius*2, width, radius*2]);
            //rotate ([90, 0, 0])
                //cylinder (width, radius, radius);
    
        translate ([length - radius, width, radius])
            rotate ([90, 0, 0])
                cylinder (width, radius, radius);
    
        translate ([length - radius, width, depth - radius])
            rotate ([90, 0, 0])
                cylinder (width, radius, radius);
    
        translate ([0, 0, depth - radius*2])
            cube ([radius*2, width, radius*2]);
            //rotate ([90, 0, 0])
                //cylinder (width, radius, radius);
    }
}

//visual representation of the center and volume
module visualization(center, volume, solid = false) {
    r = (volume[0] + volume[1] + volume[2]) * 0.01;
    
    translate ([center[0], center[1], center[2]]) {
        //center
        sphere(r, $fn = 25);
        
        //volume
        if (solid) {
            translate ([-volume[0]/2, -volume[1]/2, -volume[2]/2])
                #cube([volume[0], volume[1], volume[2]]);
        }
        
        else {
            translate ([-volume[0]/2, -volume[1]/2, -volume[2]/2])
                %cube([volume[0], volume[1], volume[2]]);
        }
    }
}




//TEST//

//rounded cube
//roudedCube(50, 50, 50, 5);

//visualization split2 test
test_center = ([25, 40, 25]);
test_volume = ([50, 80, 50]);

visualization(test_center, test_volume);

top_p_test = [90, 80, 80];
side_p_test = 70;

top_side_test = split2(test_center, test_volume, top_p_test, side_p_test);

top_center_test = top_side_test[0][0];
top_volume_test = top_side_test[0][1];

visualization(top_center_test, top_volume_test);

side_center_test = top_side_test[1][0];
side_volume_test = top_side_test[1][1];

visualization(side_center_test, side_volume_test);
          
          
        