use <parts/cap/cap_extruded.scad>
use <parts/lever/lever.scad>
use <parts/clips/clips.scad>
use <parts/lip/lip.scad>
use <parts/tube/tube.scad>

module r_shoulder_button(action_offset, stop_offset){
    cap();
    translate([-12,0,-3]){
        lever(action_offset);
    }
    translate([-3,0,0]){
        clips();
    }
    translate([23,1,-4.5]){
        lip();
    }
    translate([12,8,-4.5]){
        tube(action_offset+stop_offset);
    }
}

r_shoulder_button(0,0);