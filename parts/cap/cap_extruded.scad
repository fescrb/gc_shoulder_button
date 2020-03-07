module cap() {
    function lerp(start, end, alpha) = [for (i = [0: len(start)-1]) start[i] + (alpha * (end[i] - start[i]))];
    function lin_bezier(start, end, control, steps) = [ 
        for (i = [1: steps]) lerp(lerp(start, control, i/steps),lerp(control,end,i/steps),i/steps)
    ];
    function concatenate(lhs, rhs) = [for (i = [0 : len(lhs)+len(rhs) -1]) i < len(lhs) ? lhs[i] : rhs[i-len(lhs)]];
    module cap_shape(width,depth,h) {
        // Lhs straight shape
        base_shape0=[[0,1],[0,depth-2]];
        // Add curve at far left
        base_shape1 = concatenate(base_shape0, lin_bezier([0,depth-2],[2,depth],[0,depth],40));
        // Add the back
        base_shape2 = concatenate(base_shape1, lin_bezier([2,depth], [width,depth-9],[width+1,depth],200));
        // Add the right straight shape
        base_shape3 = concatenate(base_shape2, [[width,1]]);
        // Ass the curve at the right front
        base_shape4 = concatenate(base_shape3, lin_bezier([width,0],[width-1,-1],[width,-1],40));
        // Add the front
        base_shape5 = concatenate(base_shape4, lin_bezier([width-1,-1],[1,0],[8,-1],200));
        // Add the curve at the front left
        base_shape = concatenate(base_shape5, lin_bezier([1,0],[0,1],[0,0], 40));
        /*
         * Top of the cap
         */
        intersection() {
            linear_extrude(height=h,center=false, twisth=0,slices=0) {
                polygon(points=base_shape);
            }
            translate([width*.25, depth*0.35,-h*0.35]){ 
                sphere(r=width, $fn=300);
            }
        }
        translate([0,0,-2]){
            // First tier
            difference() {
                linear_extrude(height=2,center=false, twisth=0,slices=0) {
                    polygon(points=base_shape);
                }
                cube([3,depth,2]);
            }
            translate([0,0,-1]){
                difference() {
                    linear_extrude(height=1,center=false, twisth=0,slices=0) {
                        polygon(points=base_shape);
                    }
                    translate([0,-1,0]){
                        union() {
                            cube([width-9,depth+2,1]);
                            translate([width-9,11,0]){
                                cube([9,depth-10,1]);
                            }
                        }
                    }
                }
            }
        }
    }
    difference(){
        cap_shape(width=24,depth=18,h=16);
        translate([1,1,-2]){
            cap_shape(width=22,depth=16,h=17);
        }
    }
}
cap();