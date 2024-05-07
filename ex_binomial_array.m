% Example: binomial array
% Requires the "Electromagnetic Waves and Antennas" (https://www.ece.rutgers.edu/~orfanidi/ewa/) 
% package to be added to the Matlab path: addpath path_to\ewa '-end';
% Please note that '-end' is necessary, to avoid masking antenna toolbox
% functions and obtaining wrong results

clear;
N=11;
c = physconst('LightSpeed');
fc = 1e9;
lambda = c/fc;
d = lambda/2;
array = phased.ULA('NumElements',N,'ElementSpacing',d,'ArrayAxis','z');

[sv, dph] = binomial(d, 90, N)
dph1 = (dph/(2*pi*d/lambda))

elevation = -90:90;
azimuth = -180:180;
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv');
phi = az';
theta = 90-el;
figure
hplot=patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hplot.LegendVisible=0;
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop='|A|^2';
hplot.FontSize = 14;

