module cap() {
    function lerp(start, end, alpha) = [for (i = [0: len(start)-1]) start[i] + (alpha * (end[i] - start[i]))];
    function lin_bezier(start, end, control, steps) = [ 
        for (i = [1: steps]) lerp(lerp(start, control, i/steps),lerp(control,end,i/steps),i/steps)
    ];
    function concatenate(lhs, rhs) = [for (i = [0 : len(lhs)+len(rhs) -1]) i < len(lhs) ? lhs[i] : rhs[i-len(lhs)]];
    module cap_shape(width,depth,h) {
        // Lhs straight shape
        base_shape0=[[0,2],[0,depth-2]];
        // Add curve at far left
        base_shape1 = concatenate(base_shape0, lin_bezier([0,depth-2],[2,depth],[0,depth],400));
        // Add the back
        base_shape2 = concatenate(base_shape1, lin_bezier([2,depth], [width,depth-9],[width,depth-1],400));
        // Add the right straight shape
        base_shape3 = concatenate(base_shape2, [[width,1]]);
        // Ass the curve at the right front
        base_shape4 = concatenate(base_shape3, lin_bezier([width,-1],[width-1,-2],[width,-2],400));
        // Add the front
        base_shape5 = concatenate(base_shape4, lin_bezier([width-1,-2],[2,0],[width-8,-2.5],400));
        // Add the curve at the front left
        base_shape = concatenate(base_shape5, lin_bezier([2,0],[0,2],[0,0], 400));
        /*
         * Top of the cap
         */
        intersection() {
            linear_extrude(height=h,center=false, twist=0,slices=0) {
                polygon(points=base_shape);
            }
            translate([width*.25, depth*0.45,-h*0.75]){ 
                sphere(r=width, $fn=300);
            }
        }
        translate([0,0,-2]){
            // First tier
            difference() {
                linear_extrude(height=2,center=false, twist=0,slices=0) {
                    polygon(points=base_shape);
                }
                cube([3,depth+2,2]);
            }
            translate([0,0,-1]){
                difference() {
                    linear_extrude(height=1,center=false, twist=0,slices=0) {
                        polygon(points=base_shape);
                    }
                    translate([0,-2,0]){
                        union() {
                            cube([width-9,depth+4,1]);
                            translate([width-9,12,0]){
                                cube([9,depth-10,1]);
                            }
                        }
                    }
                }
            }
        }
    }
    difference(){
        cap_shape(width=24,depth=18,h=12);
        translate([1,1,-2]){
            cap_shape(width=22,depth=16,h=13);
        }
    }
}
cap();