module lever(){
    difference(){
        union(){
            cube([10,2,3]);
            translate([0,0,3]){
                cube([12,2,4]);
            }
        }
        translate([2,-0.5,2.5]){
            cube([3,3,2]);
        }
    }
}
lever();