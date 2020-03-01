use <parts/cap/cap.scad>
use <parts/lever/lever.scad>
use <parts/clips/clips.scad>
use <parts/lip/lip.scad>
use <parts/tube/tube.scad>


cap();
translate([-12,0,-3]){
    lever();
}
translate([-3,0,0]){
    clips();
}
translate([22,1,-4.5]){
    lip();
}
translate([12,8,-4.5]){
    tube();
}