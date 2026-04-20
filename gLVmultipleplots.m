%I used this plot to demonstrate how the gLV phase plan fails to keep a
%consistent shape with differing initial conditions

figure
hold on

ICs = [1.9 2.1;
       2.5 1.5;
       3   1;
       3.5 0.5];

tspan = [1,10];


options = odeset('RelTol',1e-8,'AbsTol',1e-10);

for i = 1:size(ICs,1)
    [t,x] = ode45(@lv, tspan, ICs(i,:)', options);
    
    
    t_dense = linspace(t(1), t(end), 1000);
    x_dense = interp1(t, x, t_dense, 'spline');
    
    
    plot(x_dense(:,1), x_dense(:,2), 'k-', 'LineWidth', 2.5)
    
    
    mid = round(length(x_dense)/2);  
    
    dN = x_dense(mid+1,1) - x_dense(mid,1);
    dP = x_dense(mid+1,2) - x_dense(mid,2);
    
    scale = 2;  
    
    quiver(x_dense(mid,1), x_dense(mid,2), ...
           scale*dN, scale*dP, ...
           0, 'r', 'LineWidth', 2, 'MaxHeadSize', 2)
end

plot(2, 2, 'bo', 'MarkerSize', 8, 'LineWidth', 2)

xlabel('Prey N')
ylabel('Predator P')
title('Phase Diagram with Multiple Initial Conditions')
grid on
hold off