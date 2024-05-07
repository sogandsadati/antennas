clear;
N=11;
c = physconst('LightSpeed');
fc = 1e9;
lambda = c/fc;
d = lambda/2;
array = phased.ULA('NumElements',N,'ElementSpacing',d,'ArrayAxis','z');
elevation = -90:90;
azimuth = -180:180;
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true);
phi = az';
theta = 90-el;
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0,'CoordinateSystem','rectangular');
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);

% Some array parameters
d_theta_b = 0.886*lambda/(N*d)*180/pi
theta_null_1 = acos(lambda/(N*d))*180/pi
theta_null_2 = acos(2*lambda/(N*d))*180/pi
theta_null_3 = acos(3*lambda/(N*d))*180/pi
