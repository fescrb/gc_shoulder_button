$fn=30;
module clips(){
    module pegs() {
        cube([2,1.5,4]);
        translate([2.5,0,0]){
            difference(){
                cube([0.5,1.5,4]);
                translate([0,0,-3]){
                    rotate([90,0,0]){
                        translate([0,4,-2]){
                            cylinder(h=2.5, r=0.25);
                        }
                    }
                }
            }
        }
    }
    cube([4,16,1]);
    translate([0,1.5,-4]){
       pegs();
    }
    translate([0,13,-4]){
       pegs();
    }
}
clips();