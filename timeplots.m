%I used this to generate two time plots for the unstable syste , to indicate 
%how the system at b=0.03 converges to a consistent set of oscillations 
%This is in the chapter entitled 'Adapted systems'.
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
                  [0 500], IC);

    figure
    plot(t,x(:,1),'LineWidth',2)
    hold on
    plot(t,x(:,2),'LineWidth',2)

    xlabel('Time')
    ylabel('Population')
    title(['Time Series (a = 1, d = 0.2, b = ', num2str(b), ')'])
    legend('Prey (u)','Predator (v)','Location','best')
    grid on
    hold off

end