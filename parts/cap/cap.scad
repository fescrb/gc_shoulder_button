$fn=50;
module cap() {
    module cap_shape(width,depth,height) {
        // Left corner + rounded top
        cube([3,depth-2,height-3]);
        translate([3,0,height-3]){
            rotate([270,0,0]){
                cylinder(r=3,h=depth-7);
            }
        }
        intersection(){
            translate([3,0,height-3]){
                rotate([270,0,0]){
                    cylinder(r=3,h=depth);
                }
            }
            translate([0,depth-7,height-7]){
                rotate([0,90,0]){
                    cylinder(r=7,h=16);
                }
            }
        }
        translate([0,depth-2,0]){
            cube([3,2,height-7]);
        }
        difference(){
            translate([0,depth-7,height-7]){
                rotate([0,90,0]){
                    cylinder(r=7,h=3);
                }
            }
            
            cube([3,depth-2,height*2]);
        }
        // Middle bit
        translate([3,0,-2]) {
            cube([width-11,depth,height-5]);
            translate([0,0,height-5]){
                cube([width-12,depth-7,7]);
            }
            rotate([0,0,-atan(1/11)]){
                cube([sqrt((11*11)+2),2,height+2]);
            }
            translate([0,depth-7,height-5]){
                rotate([0,90,0]){
                    cylinder(r=7,h=13);
                }
            }
            //closing some holes
            translate([width-12,-1,height]){
                cube([2,depth-6,2]);
            }
        }
        // Right straight bit
        translate([width-9,-1,-3]){
            cube([9,depth-6,height-4]);
            difference(){
                translate([2,0,height-4]){
                    rotate([270,0,0]){
                        cylinder(r=7,h=12);
                    }
                }
                translate([-6,-0.5,0]){
                    cube([6,3,height+3]);
                }
            }
        }
        // Right-far rounded corner
        translate([width-3,depth-7,-2]){
            cylinder(r=3,h=height-5);
            translate([0,0,height-5]) {
                rotate([270,0,0]){
                    sphere(r=3);
                }
            }
        }
    }
    difference(){
        cap_shape(width=23,depth=18,height=16);
        translate([1,1,-2]){
            cap_shape(width=21,depth=16,height=17);
        }
    }
}
cap();