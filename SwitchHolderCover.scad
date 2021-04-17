include<SwitchHolderVars.scad>;

module screwHolder(y,r)
{
	translate([coverOutsideLength/2,y,0])
	rotate([0,0,r])
	union()
	{
		translate([-nutM3HolderDiameter/2,0,0])
		cube([nutM3HolderDiameter,nutM3HolderRadius,coverOutsideScrewHolderHeight]);
		
		cylinder(d=nutM3HolderDiameter,h=coverOutsideScrewHolderHeight,$fn=32);
	}
}

module screwHolderHoles(y)
{
	translate([coverOutsideLength/2,y,-1])
	union()
	{
		cylinder(d=screwM3Diameter,h=coverOutsideScrewHolderHeight+2,$fn=8);
		
		cylinder(d=screwM3HeadDiameter,h=screwM3HeadHeight+1,$fn=16);
	}
}

module switchHoles()
{
	widthOffset=(thickness+switchWidth-switchHoleWidth)/2;
	diffWidth=switchWidth-switchHoleWidth;
	translate([coverOutsideLength/2-switchHoleLength/2,coverOutsideWidth/2,-1])
	union()
	{
		translate([0,-widthOffset-switchHoleWidth,0])
		cube([switchHoleLength,switchHoleWidth,thickness+2]);
		
		translate([0,widthOffset,0])
		cube([switchHoleLength,switchHoleWidth,thickness+2]);
	}
}

difference()
{
	union()
	{
		cube([coverOutsideLength,coverOutsideWidth,coverTotalHeight]);
		
		screwHolder(coverBorder-nutM3HolderRadius,0);
		
		screwHolder(coverOutsideWidth-coverBorder+nutM3HolderRadius,180);
	}
	
	translate([thickness,thickness,thickness])
	cube([coverInnerLength,coverInnerWidth,coverOutsideScrewHolderHeight]);
	
	screwHolderHoles(coverBorder-nutM3HolderRadius);
		
	screwHolderHoles(coverOutsideWidth-coverBorder+nutM3HolderRadius);
	
	switchHoles();
}