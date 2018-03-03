use <curvedPipe.scad>

/*translate ([0, 0, 0])
    intersection() {
        curvedPipe (points = [[0,0,0], [100,0,0], [100,100,0], [0, 100, 0]], segments = 3, radii = [30, 30], od = 20, id = 0);


        translate ([10, 0, 50 - 10])
            cylinder (h = 100, r1 = 10, r2 = 10, center = true);
    }


translate ([10, 0, 50])
    cylinder (h = 100, r1 = 10, r2 = 10, center = true);

translate ([50 + 10, 0, 0])
    rotate ([0, 90, 0])
        cylinder (h = 100, r1 = 10, r2 = 10, center = true);*/
        
    //hull(){    
curvedPipe (points = [[0, 0, 0], 
                     [100, 0, 0], 
                     [100, 180, 0], 
                     //[0, 180, 0]
					],
                     
            segments = 2, 
            radii = [90], 
            od = 20, 
            id = 0);//}

/*hull() {
cube ([10, 10, 2], true);
translate ([0, 0, 50])
    cube  ([30, 30, 2], true);
}*/
