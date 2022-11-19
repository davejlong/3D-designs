$oscad = "C:\Program Files\OpenSCAD\openscad.exe"

@(1, 2, 4, 6) | ForEach-Object {
  & $oscad -o "$_-leg.stl" -D legs=$_ rotor.scad
  & $oscad -o "$_-leg.png" -D legs=$_ rotor.scad
  
  & $oscad -o "$_-leg-noholes.stl" -D legs=$_ -D leg_holes=false rotor.scad
  & $oscad -o "$_-leg-noholes.png" -D legs=$_ -D leg_holes=false rotor.scad
}