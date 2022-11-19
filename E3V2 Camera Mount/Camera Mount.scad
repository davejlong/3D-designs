Wheel_D = 18;

difference() {
    cylinder(h=18, d=20);
    translate([0, 0, -0.1])
        cylinder(h=10, d=Wheel_D);
}

Camera_W = 36;
Camera_D = 4.5;

points = [
    [-10, 0],
    [10, 0],
    [20, 30],
    [-20, 30]
];
translate([0, 0, 10])
difference() {
    linear_extrude(8) polygon(points);
    translate([-36/2, 10.1, (8-4.5)/2])
        cube([36, 20, 4.5]);
}