clear

f = 300e6;
l = 3;
tt0 = acos(1-0.371/l)*180/pi; 
t0 = 90-acos(1-0.371/l)*180/pi;
azimuth = -180:1:180;
elevation = -180:1:180;

dv = dipoleVee('Width',0.01,'ArmLength',[l l],'ArmElevation',[t0 t0]);
figure;
show(dv);

figure;
pattern(dv, f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

figure;
pattern(dv, f,'Type','power','Normalize',true,'azimuth',0,'elevation',elevation);

figure;
pattern(dv, f,'Type','power','Normalize',true,'azimuth',90,'elevation',elevation);
