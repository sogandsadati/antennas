% Horn example (requires Matlab Antenna toolbox)

clear

f = 10e9;
lambda = 3e8/f;
a = 2.282e-2;
b = 1.016e-2;
R_A = 4*lambda
sigma_a = 1.22;
sigma_b = 1;
A = 0.5 * (a + sqrt(a^2 + 8*lambda*R_A*(sigma_a^2)))
B = 0.5 * (b + sqrt(b^2 + 8*lambda*R_A*(sigma_b^2)))

dt_x = 77.9*lambda/A
dt_y = 53.88*lambda/B
G_max = 0.51*4*pi*A*B/(lambda^2)
G_max_db = 10*log10(G_max)

azimuth=-180:1:180;
elevation=-180:1:180;

ha = horn('Width',a,'Height',b,'FlareWidth',A,'FlareHeight',B,'FlareLength',R_A)
ha.TiltAxis =[0 -1 0; 0 0 1]; 
ha.Tilt = [90 -90];
figure;
show(ha)
[D,az,el] = pattern(ha,f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

phi = az';
theta = el-90;
figure;
patternCustom(D',theta,phi);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',90);


