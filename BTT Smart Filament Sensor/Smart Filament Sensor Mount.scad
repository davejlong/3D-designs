ClipOffset_X = -10;
ClipOffset_Y = 0;
ClipOffset_Z = 8;

CutOut_Width = 26;
CutOut_Depth = 20;
CutOut_Height = 3.2;

Wall = 2.5;

module Clip(Inner_Width, Inner_Depth, Inner_Height, Outer_Width, Outer_Depth, Outer_Height, Wall) {
  difference() {
    cube([Outer_Width, Outer_Depth, Outer_Height], center=true);
    translate([0, -Wall, 0])
      cube([Inner_Width, Inner_Depth, Inner_Height], center=true);
    hull() {
      translate([0, -Outer_Width*0.20, 0]) cylinder(r=4, h=Outer_Height*2, center=true);
      translate([0, -20, 0]) cylinder(r=4, h=Outer_Height*2, center=true);
    }
  }
}


module MakeMount() {
  Outer_Width = CutOut_Width + Wall;
  Outer_Depth = CutOut_Depth + Wall*0.5;
  Outer_Height = CutOut_Height + Wall;
  
  translate([0, 0, ClipOffset_Z]) Clip(CutOut_Width, CutOut_Depth, CutOut_Height, Outer_Width, Outer_Depth, Outer_Height, Wall);

  Slide = 3;
  points = [
    [-Outer_Width*0.5+Slide, 0],
    [Outer_Width*0.5+Slide, 0],
    [(Outer_Width*0.5), ClipOffset_Z-Outer_Height/2],
    [(-Outer_Width*0.5), ClipOffset_Z-Outer_Height/2]
  ];

  translate([0, Outer_Depth/2, 0]) rotate([90, 0, 0])linear_extrude(10) polygon(points);

}

// Dimensions of sensor back plate: 70x30x4.55
union() {
translate([37.5, 15, 4.55])
    rotate([180, 90, 0])
        import("Smart Filament Sensor Back.stl");
translate([ClipOffset_X, ClipOffset_Y, 3.5]) MakeMount();
}