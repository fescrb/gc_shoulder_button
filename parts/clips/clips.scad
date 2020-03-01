$fn=30;
module clips(){
    module pegs() {
        cube([2,3,4]);
        translate([2.5,0,0]){
            difference(){
                cube([1.5,3,4]);
                translate([0,0,-3]){
                    rotate([90,0,0]){
                        translate([0,4,-2]){
                            cylinder(h=2.5, r=0.5);
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
    translate([0,11.5,-4]){
       pegs();
    }
}
clips();