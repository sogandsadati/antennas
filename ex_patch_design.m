% Design of a rectangular patch antenna

clear;

c = 3e8;
f = 10e9;
er = 2.2;
h = 0.1588e-2;
lambda = 3e8/f;

W = (0.5*c/f)*sqrt(2/(er+1))
W_cm = W/1e-2

er_eff = 0.5*(er+1)+0.5*(er-1)/sqrt(1+12*h/W)

L_eff = 0.5*(c/(f*sqrt(er_eff)))
delta_L = 0.412*h*((er_eff+0.3)*(W/h+0.264))/((er_eff-0.258)*(W/h+0.8))
L = L_eff-2*delta_L
L_cm = L/1e-2

d = dielectric('Name','diel','EpsilonR',er,'LossTangent',0,'Thickness',h);
pm = patchMicrostrip('Length',L,'Width',W,'Height',h,'GroundPlaneLength',1.5*L, 'GroundPlaneWidth',1.5*W,'FeedOffset',[-0.85*L/2,0],'Substrate',d)
show (pm)
azimuth=-180:1:180;
elevation=0:1:180;
[D,az,el] = pattern(pm,f,'Type','power','Normalize',true,'azimuth',azimuth,'elevation',elevation);

phi = az';
theta = el-90;

for ii =1:length(phi)
    for jj=1:length(theta)
        vx = (L_eff/lambda)*sin(theta(jj)*pi/180)*cos(phi(ii)*pi/180);
        vy = (W/lambda)*sin(theta(jj)*pi/180)*sin(phi(ii)*pi/180);
        Dan(jj,ii) = ((cos(phi(ii)*pi/180)^2)+(cos(theta(jj)*pi/180)^2)*(sin(phi(ii)*pi/180)^2))*(sinc(vy)^2)*(cos(pi*vx)^2);
    end
end

figure;
patternCustom(D',theta,phi);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',0);
hold on
patternCustom(Dan',theta,phi,'Slice','phi','SliceValue',0);
figure
patternCustom(D',theta,phi,'Slice','phi','SliceValue',90);
hold on
patternCustom(Dan',theta,phi,'Slice','phi','SliceValue',90);

fun = @(theta,phi) ((sin(pi.*(W./lambda).*cos(theta)).^2)./(cos(theta).^2)).*(cos((pi.*L_eff./lambda).*sin(theta).*sin(phi)).^2).*(sin(theta).^3);
I2 = integral2(fun,0,pi,0,pi);
D_max = ((2*pi*W/lambda)^2)*pi/I2
R_rad = 30*(pi^3)/I2

