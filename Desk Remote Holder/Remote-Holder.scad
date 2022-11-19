$fn=60;

DeskHeight = 20;
ClipWall = 10;

Width = 75;

module DeskClip() {
    translate([35, 30, (DeskHeight + ClipWall * 2)/2])
        difference() {
            cube([70, 60, DeskHeight + ClipWall * 2], center=true);
            translate([0, ClipWall, 0])
            cube([75, 60, DeskHeight], center=true);
        }
}

translate([0, 89.9, 75]) DeskClip();


points = [
    [0, 0],
    [0, 90],
    [40, 0]
];

difference() {
    union() {
        translate([0, 90, 75])
            rotate([0, -90, 180])
                linear_extrude(70)
                    polygon(points);
        cube([70, 90, 75]);
    }

    translate([10, 3, 10])
        #cube([50, 15, 100]);
    translate([10, 3*2+15, 10])
        #cube([50, 30, 100]);
    translate([10, 3*3+30 + 15, 10])
        #cube([50, 30, 150]);
}