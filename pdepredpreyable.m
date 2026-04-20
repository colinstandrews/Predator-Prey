% its the spatial system
function [c,f,s] = pdepredpreyable(x,t,u,DuDx,a)


b = 0.6;

c = [1; 1];


D = 1;   
f = [0;
     D*DuDx(2)];

s = [u(1)*(1 - u(1) - u(2));
     a*u(2)*(u(1) - b)];

end