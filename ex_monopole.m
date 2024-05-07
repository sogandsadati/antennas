clear;

f = 300e6;
l = 0.25;
g = Inf % Inf: infinite ground plane; finite value: finite ground plane
azimuth = -180:1:180;
elevation = -180:1:180;

d = monopole('Height',l,'Width',0.01,'GroundPlaneLength',g,'GroundPlaneWidth',g);

figure;
pattern(d, f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

figure;
pattern(d, f,'Type','power','Normalize',true,'azimuth',0,'elevation',elevation);

figure;
pattern(d, f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',0);
