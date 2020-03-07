module cap() {
    function lerp(start, end, alpha) = [for (i = [0: len(start)-1]) start[i] + (alpha * (end[i] - start[i]))];
    function lin_bezier(start, end, control, steps) = [ 
        //start,
        for (i = [1: steps]) lerp(lerp(start, control, i/steps),lerp(control,end,i/steps),i/steps)
        //end,
    ];
    module cap_shape(width,depth,h) {
        echo(lerp([0,0], [2,2],0.5));
        intersection() {
            linear_extrude(height=h,center=false, twisth=0,slices=0) {
                polygon(points=[
                    [0,0],
[0,14.65],
[0.12,14.95],
[0.19,15.14],
[0.34,15.33],
[0.56,15.52],
[0.74,15.64],
[1.18,15.73],
[1.49,15.83],
[1.73,15.85],
[1.92,15.88],
[1.92,15.88],
[2.37,15.91],
[2.71,15.94],
[3.25,16.04],
[4.06,16.07],
[4.49,16.12],
[6.50,16.07],
[7.53,16],
[9.46,15.87],
[11.43,15.67],
[13.95,15.41],
[14.45,15.02],
[15.05,14.93],
[15.90,14.66],
[16.51,14.43],
[17.19,14.18],
[17.73,13.95],
[18.33,13.60],
[18.83,13.29],
[19.26,12.93],
[19.57,12.64],
[19.90,12.23],
[20.16,11.86],
[20.49,11.40],
[20.76,10.92],
[21.00,10.47],
[21.11,10.10],
[21.24,9.76],
[21.49,8.76],
[21.83,8.00],
[21.83,-0.34],


                ]
                );
            }
            translate([width*.25, depth*0.35,-h*0.35]){ 
                sphere(r=width, $fn=300);
            }
        }
    }
    difference(){
        cap_shape(width=23,depth=17,h=16);
        translate([1,1,-2]){
            //cap_shape(width=21,depth=15,h=17);
        }
    }
}
cap();