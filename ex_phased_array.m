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
d_theta_b = 0.886*lambda/(N*d)*180/pi
theta_null_1 = acos(lambda/(N*d))*180/pi
theta_null_2 = acos(2*lambda/(N*d))*180/pi
theta_null_3 = acos(3*lambda/(N*d))*180/pi


theta0 = 75;
steervec = phased.SteeringVector('SensorArray',array);
ang = [0;theta0-90];
sv = steervec(fc,ang)
[D,az,el] = pattern(array,fc,azimuth,elevation,'Type','powerdb','Normalize',true,'Weights',sv);
phi = az';
theta = 90-el;
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0,'CoordinateSystem','rectangular');
figure
hplot = patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
psi0 = (2*pi*d/lambda)*cos(theta0*pi/180)
psi0_deg = psi0*180/pi
sv_d = exp(-j*psi0)
hplot.LegendVisible=0;
hplot.TitleTopTextInterpreter='tex';
hplot.TitleTop=strcat('\theta_0=',num2str(theta0),'°, \psi_0=',num2str(psi0_deg,'%.1f'),'°');
hplot.TitleBottomTextInterpreter='tex';
hplot.TitleBottomFontSizeMultiplier=1.1;
hplot.TitleBottom='\theta';
hplot.AngleDirection = 'cw';
hplot.AngleAtTop = 0;
hplot.MagnitudeLim = [-60,0];
hplot.FontSize = 14;