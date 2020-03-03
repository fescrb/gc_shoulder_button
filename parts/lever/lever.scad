module lever(action_offset){
    translate([0,0,-action_offset]) {
        difference(){
            union(){
                cube([10,2,action_offset+7]);
                translate([10,0,action_offset+3]){
                    cube([2,2,4]);
                }
            }
            translate([2,-0.5,2.5]){
                cube([3,3,2]);
            }
        }
    }
}
lever(action_offset=0);