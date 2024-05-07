% Example: multi-beam pattern with Taylor coefficients

clear;
N=11;
c = physconst('LightSpeed');
fc = 1e9;
lambda = c/fc;
d = lambda/2;
array = phased.ULA('NumElements',N,'ElementSpacing',d,'ArrayAxis','z');
elevation = -90:90;
azimuth = -180:180;
sldb = 20;

[sv0, dph] = taylor1p(d, 90, N, sldb); % Create Taylor coefficients
sv0=sv0'

steervec1 = phased.SteeringVector('SensorArray',array);

ang = [0;45];
svv = steervec1(fc,ang)
sv1 = sv0.*svv
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
svv = steervec1(fc,ang)
sv2 = sv0.*svv
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
svv = steervec1(fc,ang)
sv3 = sv0.*svv
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