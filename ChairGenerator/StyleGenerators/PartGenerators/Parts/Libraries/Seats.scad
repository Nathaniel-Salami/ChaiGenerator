use <Utilities/Utilities.scad>
use <Utilities/CurvedPipe/curvedPipe.scad>

//***SEATS LIBRARY***//

/*
//SEATS LIBRARY\\
//center used for constructing the seats 
center0 = [25, 25, 5];

//dimensions of the space the seats occupy 
volume0 = [50, 50, 10];

//shows the center and volume 
//visualization(center0, volume0);

//simple seat
//no dimensions required

//seat1(center0, volume0);

module seat1(center, volume) {
    //seat dimensions
    seatLength = volume[0];
    seatWidth = volume[1];
    seatDepth = volume[2];
    
    translate ([center[0], center[1], center[2]]) {
        //seat
        translate ([-seatLength/2, -seatWidth/2, -seatDepth/2])
            cube([seatLength, seatWidth, seatDepth]);
    }
}




//seat with front rounded edges

//radius of the rounded edges
curve_radius2 = 10;

//undefined
//seat2(center0, volume0);

//defined
//seat2(center0, volume0, curve_radius2);

module seat2(center, volume, curve_radius = "undefined") {
    //seat dimensions
    seatLength = volume[0];
    seatWidth = volume[1];
    seatDepth = volume[2];
    
    rez = 25;
    
    //defined curve radius
    if (curve_radius == "undefined") {
        //echo("undefined curve radius");
    
        //seat dimensions
        curve_radius = rand_percentage((seatLength + seatWidth)/2, 10, 20);
        
        //seat
        translate ([center[0], center[1], center[2]]) {
            hull() {
                translate ([seatLength/2 - curve_radius, seatWidth/2 - curve_radius, -seatDepth/2])
                    cylinder (seatDepth, curve_radius, curve_radius, $fn = rez);
                translate ([seatLength/2 - curve_radius, -seatWidth/2 + curve_radius, -seatDepth/2])
                    cylinder (seatDepth, curve_radius, curve_radius, $fn = rez);
                translate ([-seatLength/2, -seatWidth/2, -seatDepth/2])
                    cube ([curve_radius, seatWidth, seatDepth]);
            }
        }
    }
    
    //defined curve radius
    else {
    
        //seat
        translate ([center[0], center[1], center[2]]) {
            hull() {
                translate ([seatLength/2 - curve_radius, seatWidth/2 - curve_radius, -seatDepth/2])
                    cylinder (seatDepth, curve_radius, curve_radius, $fn = rez);
                translate ([seatLength/2 - curve_radius, -seatWidth/2 + curve_radius, -seatDepth/2])
                    cylinder (seatDepth, curve_radius, curve_radius, $fn = rez);
                translate ([-seatLength/2, -seatWidth/2, -seatDepth/2])
                    cube ([curve_radius, seatWidth, seatDepth]);
            }
        }
    }
}







//rounded seat

//radius of the spheres that make the seat rounded 
sphere_radius3 = 2;

//undefined
//seat3(center0, volume0);

//defined
//seat3(center0, volume0, sphere_radius3);

module seat3(center, volume, sphere_radius = "undefined") {
    //seat dimensions
    seatLength = volume[0];
    seatWidth = volume[1];
    seatDepth = volume[2];
    
    rez = 25;
    
    //defined curve radius
    if (sphere_radius == "undefined") {
        echo("undefined curve radius");
    
        //seat dimensions
        sphere_radius = rand_percentage((seatLength + seatWidth)/2, 2, 6);
        
        //seat
        translate ([center[0], center[1], center[2]]) {
            hull() {
                //top
                translate ([-seatLength/2 + sphere_radius, -seatWidth/2 + sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([-seatLength/2 + sphere_radius, seatWidth/2 - sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, seatWidth/2 - sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, -seatWidth/2 + sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
            
                //bottom
                translate ([-seatLength/2 + sphere_radius, -seatWidth/2 + sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([-seatLength/2 + sphere_radius, seatWidth/2 - sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, seatWidth/2 - sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, -seatWidth/2 + sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
            }
        }
    }
    
    //defined curve radius
    else {
    
        //seat
        translate ([center[0], center[1], center[2]]) {
            hull() {
                //top
                translate ([-seatLength/2 + sphere_radius, -seatWidth/2 + sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([-seatLength/2 + sphere_radius, seatWidth/2 - sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, seatWidth/2 - sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, -seatWidth/2 + sphere_radius, seatDepth/2 - sphere_radius])
                    sphere (sphere_radius, $fn = rez);
            
                //bottom
                translate ([-seatLength/2 + sphere_radius, -seatWidth/2 + sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([-seatLength/2 + sphere_radius, seatWidth/2 - sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, seatWidth/2 - sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
                translate ([seatLength/2 - sphere_radius, -seatWidth/2 + sphere_radius, -seatDepth/2])
                    cylinder (seatDepth*0.01, sphere_radius, sphere_radius, $fn = rez);
            }
        }
    }
}