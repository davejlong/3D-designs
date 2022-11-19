$fn = 60;

legs = 1; // [1:1:10]
leg_holes = true;

module leg(holes) {
  difference() {
    translate([1, 0, 0]) hull() {
      cylinder(h=2.25, r=4.5);
      translate([15, 0, 0]) cylinder(h=2.25, r=2.5);
    }
    if(holes) {
      for(h=[7:3:18]) {
        translate([h, 0, -.1]) cylinder(r=0.5, h=20);
      }
    }
  }
}

difference() {
  union() {
    cylinder(h=5.5, r=4.5);
    cylinder(h=2.25, r=6);
    for(i=[0:360/legs:360]) {
        rotate([0, 0, i]) leg(leg_holes);
    }
  }
  translate([0, 0, 2]) cylinder(h=5.6, r=3);
  translate([0, 0, -.1]) cylinder(h=6, r=1.6);
}
