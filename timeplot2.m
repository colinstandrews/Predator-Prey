%This is an alteration of timeplots.m that I used for the stable system to 
%demonstrate how it collapses to the steady state point, by widening the
%y axis and shrinking the x axis
clear; clc;

a = 1;
d = 0.2;

b_values = [0.03 1];

IC = [0.355; 0.355];

opts = odeset('RelTol',1e-10,'AbsTol',1e-12);

for i = 1:length(b_values)

    b = b_values(i);

    [t,x] = ode45(@(t,x) predprey(t,x,a,b,d), ...
                  [0 50], IC, opts);

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