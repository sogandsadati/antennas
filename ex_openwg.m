clear

f = 10e9;
lambda = 3e8/f;

a = 2.282e-2; % WR90 waveguide
b = 1.016e-2; % WR90 waveguide

% Estimated beamwidths
% dt_x = 68.12*lambda/a
% dt_y = 50.76*lambda/b


azimuth=-180:1:180;
elevation=-180:1:180;

wg = waveguide;
wg.TiltAxis =[0 -1 0; 0 0 1]; 
wg.Tilt = [90 -90];
figure;
show(wg);
[D,az,el] = pattern(wg,f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);
mesh(wg);

phi = az';
theta = el-90;
figure;
patternCustom(D',theta,phi);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',90);

