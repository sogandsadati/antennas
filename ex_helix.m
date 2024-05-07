% Example: helical antenna

clear

f=3e8; % lambda = 1 m
r = 1/(2*pi);
w = 0.01;
s = 0.25;
t = 15;
rg = 0.4;

azimuth=-180:1:180;
elevation=-180:1:180;

h=helix('Radius',r,'Width',w,'Spacing',s,'Turns',t,'GroundPlaneRadius',rg);
mesh(h)
[D,az,el] = pattern(h,f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

phi = az';
theta = el-90;
figure;
patternCustom(D',theta,phi);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);

