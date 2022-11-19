$fn = 60;

Width = 15;
Height = 100;
Thickness = 3;

union() {
  linear_extrude(Thickness) union() {
    rotate(0) circle(r=Width / 2, $fn=4);
    translate([-Width / 2, 0, 0]) square([Width, Height]);
  }

  // color("green") linear_extrude(10) translate([-Thickness / 2, 0, 0]) square([Thickness, Height]);

  translate([0, Height, Width / 2]) rotate([0, 90, 0]) 
    union() {
      difference() {
        cylinder(r=Width / 2, h=Width, center=true);
        scale([0.6, 0.6, 1.1]) cylinder(r=Width / 2, h=Width, center=true);
        translate([0, -Width / 4, 0]) cube([Width, Width / 2, Width + 1], center=true);
      }
      translate([-Width/2 + Thickness/2, -Width / 4, 0])cube([Thickness, Width/2, Width], center=true);
    }
}