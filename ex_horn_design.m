% Horn antenna design example (requires EWA package: https://www.ece.rutgers.edu/~orfanidi/ewa/)

clear;

f = 10e9;
a = 2.282e-2;
b = 1.016e-2;
lambda = 3e8/f;
Gdb = 20;

% Fixed side ratio
r = b/a;
sa = 1.4982;
sb = r*sa;
ea = heff(sa,sb)
G = 10^(Gdb/10)
A = lambda*sqrt(G/(4*pi*r*ea))
R_A = A*(A-a)/(2*lambda*(sa^2))

% Arbitrary side ratio
[A,B,R,err] = hopt(Gdb,a/lambda,b/lambda);
A = A*lambda
B = B*lambda
R = R*lambda

