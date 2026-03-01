%I used this plot to demonstrate how the gLV phase plan fails to keep a
%consistent shape with differing initial conditions

figure
hold on
ICs = [1.9 2.1;
       2.5 1.5;
       3   1;
       3.5 0.5];
for i = 1:size(ICs,1)
    [t,x] = ode45(@lv, tspan, ICs(i,:)');
    
    plot(x(:,1), x(:,2), 'k', 'LineWidth', 2)
 
    mid = round(length(x)/2);  
    
    dN = x(mid+1,1) - x(mid,1);
    dP = x(mid+1,2) - x(mid,2);
    
    scale = 2;  
    
    quiver(x(mid,1), x(mid,2), ...
           scale*dN, scale*dP, ...
           0, 'r', 'LineWidth', 2, 'MaxHeadSize', 2)
end

plot(2, 2, 'bo', 'MarkerSize', 8, 'LineWidth', 2)

xlabel('Prey N')
ylabel('Predator P')
title('Phase Diagram with Multiple Initial Conditions')
grid on
hold off