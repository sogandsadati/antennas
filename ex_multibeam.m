% Example: multi-beam pattern

clear;
N=11;
c = physconst('LightSpeed');
fc = 1e9;
lambda = c/fc;
d = lambda/2;
array = phased.ULA('NumElements',N,'ElementSpacing',d,'ArrayAxis','z');
elevation = -90:90;
azimuth = -180:180;

steervec1 = phased.SteeringVector('SensorArray',array);

ang = [0;45];
sv1 = steervec1(fc,ang)
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv1);
phi = az';
theta = 90-el;
figure
hplot = patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hplot.LegendVisible=0;
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop='|A_1|^2';
hplot.FontSize = 14;

ang = [0;0];
sv2 = steervec1(fc,ang)
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv2);
phi = az';
theta = 90-el;
figure
hplot = patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hplot.LegendVisible=0;
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop='|A_2|^2';
hplot.FontSize = 14;

ang = [0;-30];
sv3 = steervec1(fc,ang)
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv3);
phi = az';
theta = 90-el;
figure
hplot = patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hplot.LegendVisible=0;
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop='|A_3|^2';
hplot.FontSize = 14;

sv=sv1+sv2+sv3;
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv);
phi = az';
theta = 90-el;
figure
hplot = patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hplot.LegendVisible=0;
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop='|A|^2';
hplot.FontSize = 14;