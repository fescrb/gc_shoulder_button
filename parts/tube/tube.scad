$fn=50;
module tube(stop_offset) {
    module anchor(w,h) {
        // Center the y axis
        translate([0,-0.5,0]){
            difference(){
                cube([w,1,h]);
                translate([1,-0.5,-0.5]){
                    cube([2,2,1.5]);
                }
            }
            rotate([0,45,0]) {
                translate([0.1,0,2]){
                    cube([2,1,1]);
                }
            }
        }
    }
    translate([0,0,-stop_offset]){
        difference() {
            cylinder(d=7,h=20+stop_offset);
            translate([0,0,-0.5]){
                cylinder(d=5,h=21+stop_offset);
            }
        }
    }
    rotate([0,0,45]){
        translate([3.4,0,15]){
            anchor(w=3,h=2);
        }
    }
    rotate([0,0,135]){
        translate([3.4,0,15]){
            anchor(w=4,h=4);
        }
    }
    rotate([0,0,225]){
        translate([3.4,0,15]){
            anchor(w=4,h=4);
        }
    }
    rotate([0,0,315]){
        translate([3.4,0,15]){
            anchor(w=4,h=4);
        }
    }
}
tube(stop_offset=0);