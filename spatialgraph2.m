function spatialgraph2
m = 0;
x = linspace(-40,40,40000);
t = linspace(0,100,10);

target_t = 100;
[~, t_idx] = min(abs(t - target_t));


a_values = [0.1, 0.6, 5];

figure('Color','w', 'Name', 'Spatial Distribution at t=100');

for i = 1:length(a_values)
    a = a_values(i);
    
    % Solve PDE
    sol = pdepe(m, @(x,t,u,DuDx)pdepredpreyable(x,t,u,DuDx,a), @icon, @bcon, x, t);
    u = sol(t_idx, :, 1);
    v = sol(t_idx, :, 2);
    
    
    subplot(3, 1, i)
    
   
    xs = linspace(min(x), max(x), 2000);
    us = interp1(x, u, xs, 'spline');
    vs = interp1(x, v, xs, 'spline');
    
    plot(xs, us, 'b', 'LineWidth', 2); hold on;
    plot(xs, vs, 'r', 'LineWidth', 2);
    
    
    ylabel('Population');
    title(['a = ', num2str(a), ' at t = ', num2str(t(t_idx))]);
    legend('u', 'v', 'Location', 'best');
    grid on;
    xlim([-40 40]);
    set(gca, 'FontSize', 10)
    

    if i == 3
        xlabel('x');
    end
end
end