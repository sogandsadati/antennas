clear;
c = physconst('LightSpeed');
fc = 1e9;
lambda = c/fc;
dx = lambda/2;
dy = lambda/2;
M = 11;
N = 15;

array = phased.URA('Size',[N M],'ElementSpacing',[dy dx],'ArrayNormal','z');
elevation = 0:90;
azimuth = -180:180;
figure
pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true);

