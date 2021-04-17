feetDiameter=1.5;
feetDistance=5;
feetHeight=4;
feetWidthOffset=3.5;

holderLength=10+0.8;
holderWidth=8;
holderHeight=10;
baseThickness=2;
wallThickness=2;

holeHeight=holderHeight+feetHeight+1;
cubeLength=holderLength+2*wallThickness;
cubeHeight=baseThickness+holeHeight+feetHeight;

screwDiameter=4;
screwHolderDiameter=10;
screwHolderRadius=screwHolderDiameter/2;
screwHolderThickness=4;

translate([0,0,screwHolderDiameter])
rotate([-90,0,0])
difference()
{
	union()
	{
		cube([cubeLength,screwHolderDiameter,cubeHeight]);
		
		translate([-screwHolderRadius,0,0])
		cube([screwHolderRadius,screwHolderDiameter,screwHolderThickness]);
		
		translate([-screwHolderRadius,screwHolderRadius,0])
		cylinder(d=screwHolderDiameter,h=screwHolderThickness,$fn=32);
		
		translate([cubeLength,0,0])
		cube([screwHolderRadius,screwHolderDiameter,screwHolderThickness]);
		
		translate([cubeLength+screwHolderRadius,screwHolderRadius,0])
		cylinder(d=screwHolderDiameter,h=screwHolderThickness,$fn=32);
	}
	
	// Screw holes
	translate([-screwHolderRadius,screwHolderRadius,-1])
	cylinder(d=screwDiameter,h=screwHolderThickness+2,$fn=16);
	
	translate([cubeLength+screwHolderRadius,screwHolderRadius,-1])
	cylinder(d=screwDiameter,h=screwHolderThickness+2,$fn=16);
	
	// Hole
	translate([wallThickness,-1,baseThickness])
	cube([holderLength,holderWidth+1,holeHeight]);
	
	// Feet
	translate([cubeLength/2-feetDistance/2,feetWidthOffset,baseThickness+holeHeight-1])
	cylinder(d=feetDiameter,h=feetHeight+2,$fn=8);
	
	translate([cubeLength/2+feetDistance/2,feetWidthOffset,baseThickness+holeHeight-1])
	cylinder(d=feetDiameter,h=feetHeight+2,$fn=8);
}
