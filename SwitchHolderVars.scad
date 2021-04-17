switchLength=22;
switchWidth=14;

height=24;
thickness=2;

innerLength=switchLength;
innerWidth=2*switchWidth+thickness;

outerLength=innerLength+2*thickness;
outerWidth=innerWidth+2*thickness;
totalHeight=height+thickness;

batteryHolderWidth=12;
batteryHolderThickness=4;
batteryHolderHeight=8;

screwHolderLength=12;
spaceBetweenScrews=60.5;
offsetFromScrews=10;
spaceBetweenSwitch=4;
firstScrewOffset=screwHolderLength+offsetFromScrews-batteryHolderWidth/2;
batteryHolderTotalLength=spaceBetweenScrews+2*offsetFromScrews+2*screwHolderLength+spaceBetweenSwitch;

nutM3HolderDiameter=10;
nutM3HolderRadius=nutM3HolderDiameter/2;
nutM3HolderDifferenceHeight=6;
nutM3HolderHeight=totalHeight-nutM3HolderDifferenceHeight;

wireWidth=6;
wireHeight=3;

//http://g02.a.alicdn.com/kf/UT82xCDXo8XXXagOFbXu/111613040/UT82xCDXo8XXXagOFbXu.jpg
nutM25Diameter=5.45+1.05;
nutM25Height=2+1.0;
screwM25Diameter=3;

nutM3Diameter=6+1;
nutM3Height=2.4+1.1;
screwM3Diameter=3.6;
screwM3HeadDiameter=5+1;
screwM3HeadHeight=3;

screwM4Diameter=4;

// Cover
switchHoleWidth=12.9+0.6;
switchHoleLength=19.2+0.8;

space=0.4;
coverInnerLength=outerLength+2*space;
coverInnerWidth=outerWidth+2*space;
coverOutsideLength=coverInnerLength+2*thickness;
coverOutsideWidth=coverInnerWidth+2*thickness;
coverHeight=2;
coverTotalHeight=thickness+coverHeight;
coverBorder=space+thickness;
coverOutsideScrewHolderHeight=nutM3HolderDifferenceHeight+thickness;
