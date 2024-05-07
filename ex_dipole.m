f = 300e6;
lambda = 3e8/f;
l = 1.5*lambda;
azimuth = -180:5:180;
elevation = -180:5:180;  % NOTE: The elevation angle is equal to 90° - theta

d = dipole('Length',l,'Width',l/1e3);

figure
pattern(d, f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

Directivity = pattern(d, f, 'azimuth', 0, 'elevation', 0)

figure
patternAzimuth(d, f, 0, 'azimuth',azimuth)

figure
patternElevation(d, f, 0, 'elevation',elevation)

% Alternative way to plot the radiation pattern
% figure
% [efield,az,el] = pattern(d, f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);
% phi = az';
% theta = (90-el);
% MagE = efield';
% patternCustom(MagE,theta,phi); % patternCurstom work with the theta angles, not the levation ones
