clear;

a = 0.25;
phi = -180:1:180;
theta = -180:1:180;

phi = phi';

for ii=1:length(phi)
    for jj=1:length(theta)
        E(ii,jj) = besselj(1,2*pi*a*sin(theta(jj)*pi/180));
    end
end
MagE=abs(E).^2;
cn=max(max(MagE));
MagE=MagE./cn;
% MagE=10*log10(MagE);

figure
patternCustom(MagE,theta,phi);

figure
patternCustom(MagE,theta,phi,'Slice','phi','SliceValue',0);

