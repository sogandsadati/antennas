% Example: taylor array
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

sldb = 20;
[sv, dph] = taylor1p(d, 90, N, sldb)

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

b = 0.0133*sldb + 0.9761
d_theta_b = (0.866*b*lambda/(N*d))*180/pi

