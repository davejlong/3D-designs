$fn = 60;

HoleRad = 51/2;
Wall = 1;
LipRad = HoleRad + 5;

module BaseShape() {
  union() {
    linear_extrude(20) circle(r=HoleRad);
    linear_extrude(3) circle(r=LipRad);
  }
}

module CutOuts() {
  translate([0, 0, -1]) cylinder(r=HoleRad - Wall, h=22);
  translate([0, 0, -1]) cylinder(r=HoleRad + Wall, h=2.5);
}

difference() {
  BaseShape();
  CutOuts();
}

translate([0, LipRad*2+10, 0])
difference() {
  color("red") cylinder(r=HoleRad + Wall - 0.5, h=2.25);
  translate([0, 0, -1]) linear_extrude(5) hull() {
    translate([0, 0, 0]) circle(r=HoleRad*0.33);
    translate([0, 100, 0]) circle(r=HoleRad*0.33);
  }
}