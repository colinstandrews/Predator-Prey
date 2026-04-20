%I used the second figure as a demonstration of what happens to the stable
%system from time t=0 to time t=30. The other generated here I did not use.
%This is for a figure in 'Adapted Models'
clear; clc;
a = 1;
d = 0.2;
b_values = [0.03 1];
u_star = (-0.2 + sqrt(0.84))/2;   
v_star = u_star;
IC = [0.355; 0.355];
for i = 1:length(b_values)

    b = b_values(i);

    [t,x] = ode45(@(t,x) predprey(t,x,a,b,d), ...
                  [0 30], IC);

    idx = floor(length(0)):length(t);
    u = x(idx,1);
    v = x(idx,2);

    figure
    plot(u, v, 'k', 'LineWidth', 2)
    hold on


    step = 10;                     
    u_arrow = u(1:step:end-1);
    v_arrow = v(1:step:end-1);

    du_arrow = u(2:step:end) - u(1:step:end-1);
    dv_arrow = v(2:step:end) - v(1:step:end-1);

    quiver(u_arrow, v_arrow, ...
           du_arrow, dv_arrow, ...
           0, 'r', 'LineWidth', 1)
    plot(u_star, v_star, 'bo', ...
         'MarkerSize', 8, 'LineWidth', 2)

    xlabel('Prey Population (u)')
    ylabel('Predator Population (v)')
    title(['Phase Plane (a = 1, d = 0.2, b = ', num2str(b), ')'])
    axis equal
    grid on
    hold off

end