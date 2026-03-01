%This is how I graphed the time plot for the gLV

[t,x]= ode45(@lv, [1 10], [1.9; 2.1])
figure
plot(t,x(:,1),'-o',t,x(:,2),'-o')
xlabel('Time (t)')
ylabel ('Prey (N) and Predator (P) populations')
legend ('N','P')
title('Lotka Volterra with initial conditions (1.9,2.1)')