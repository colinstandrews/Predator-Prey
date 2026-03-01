%This is my adapted system that allows me to investigate the possibility
%of a Hopf Bifurcation, keeping a, b and d as variables that I can vary
%later. It is from the section 'Adapted models'
function dxdt = predprey(t,x,a,b,d)
u = x(1);
v = x(2);
du = u*(1 - u) - (a*u*v)/(u + d);
dv = b*v*(1 - v/u);
dxdt = [du; dv];
end 
