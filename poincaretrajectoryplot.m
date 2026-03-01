clear; clc; close all;
a = 1; 
b = 1; 
d = 0.2;

[u,v] = meshgrid(linspace(0.02,1.4,25), ...
                 linspace(0.02,1.4,25));

du = u.*(1-u) - (a*u.*v)./(u + d);
dv = b*v.*(1 - v./u);

% arrows here
L = sqrt(du.^2 + dv.^2);
du = du./L;
dv = dv./L;

figure('Position',[100 100 650 650])
hold on

% direction field surrounding stationary point
quiver(u,v,du,dv,0.45,'k')

% g=0
u_line = linspace(0.02,1.4,400);
plot(u_line,u_line,'k','LineWidth',2)

% f=0
v_null = (u_line + d).*(1 - u_line)/a;
plot(u_line,v_null,'k','LineWidth',2)

% this is the steady state 
u_star = ((1 - a - d) + sqrt((1 - a - d)^2 + 4*d))/2;
plot(u_star,u_star,'ko','MarkerFaceColor','k')

% setting up axis here for the plot
axis([0 1.4 0 1.4])
axis square
xlabel('u','FontSize',13)
ylabel('v','FontSize',13)
title('Trajectories surrounding the critical point')
box on
set(gca,'FontSize',12)