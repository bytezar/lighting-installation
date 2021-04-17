include<SwitchHolderVars.scad>;

module switchHolder()
{
	translate([batteryHolderTotalLength,batteryHolderWidth/2-outerWidth/2,0])
	difference()
	{
		cube([outerLength,outerWidth,totalHeight]);
		
		translate([thickness,thickness,thickness])
		cube([switchLength,switchWidth,height+1]);
		
		translate([thickness,2*thickness+switchWidth,thickness])
		cube([switchLength,switchWidth,height+1]);
		
		translate([thickness+switchLength-1,thickness+switchWidth/2-wireWidth/2,thickness])
		cube([thickness+2,wireWidth,wireHeight]);
		
		translate([thickness+switchLength-1,2*thickness+3*switchWidth/2-wireWidth/2,thickness])
		cube([thickness+2,wireWidth,wireHeight]);
		
		translate([-1,outerWidth/2-batteryHolderWidth/2-wireWidth,thickness])
		cube([thickness+2,wireWidth,wireHeight]);
		
		translate([-1,outerWidth/2+batteryHolderWidth/2,thickness])
		cube([thickness+2,wireWidth,wireHeight]);
	}
}

module screwM3Holder(bottom)
{
	yTranslate=batteryHolderWidth/2+(bottom?-1:1)*(outerWidth/2+nutM3HolderRadius);
	translate([batteryHolderTotalLength+outerLength/2,yTranslate,0])
	rotate([0,0,bottom?0:180])
	difference()
	{
		union()
		{
			translate([-nutM3HolderRadius,0,0])
			cube([nutM3HolderDiameter,nutM3HolderRadius,nutM3HolderHeight]);
			
			cylinder(d=nutM3HolderDiameter,h=nutM3HolderHeight,$fn=16);
		}
		
		translate([0,0,-1])
		cylinder(d=screwM3Diameter,h=nutM3HolderHeight+2,$fn=16);
		
		translate([0,0,-1])
		cylinder(d=nutM3Diameter,h=nutM3Height+1,$fn=6);
	}
}

module batteryHolder()
{
	difference()
	{
		union()
		{
			cube([batteryHolderTotalLength,batteryHolderWidth,batteryHolderThickness]);
			
			translate([firstScrewOffset,0,0])
			cube([batteryHolderWidth,batteryHolderWidth,batteryHolderHeight]);
			
			translate([firstScrewOffset+spaceBetweenScrews,0,0])
			cube([batteryHolderWidth,batteryHolderWidth,batteryHolderHeight]);
		}
		
		for(t=[0,spaceBetweenScrews])
		{
			x=screwHolderLength+offsetFromScrews+t;
			y=batteryHolderWidth/2;
			
			translate([x,y,-1])
			cylinder(d=screwM25Diameter,h=batteryHolderHeight+2,$fn=16);
			
			translate([x,y,-1])
			cylinder(d=nutM25Diameter,h=nutM25Height+1,$fn=6);
		}
		
		for(x=[screwHolderLength/2,batteryHolderTotalLength-screwHolderLength/2-spaceBetweenSwitch])
		{
			translate([x,batteryHolderWidth/2,-1])
			cylinder(d=screwM4Diameter,h=batteryHolderThickness+2,$fn=16);
		}
	}
}

union()
{
	batteryHolder();
	
	switchHolder();
	
	screwM3Holder(0);
	screwM3Holder(1);
}
