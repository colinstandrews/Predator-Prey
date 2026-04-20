% p lambda polynomial for my PDE
a_star = 40/81; 
a_vals = [0.1, a_star, 0.6]; 
colors = {'blue', 'red', 'green'}; 
labels = {'a = 0.1 < a*', ['a = a^* \approx ', num2str(a_star, 3)], 'a = 0.6 > a*'};

L = linspace(-0.8, 1.4, 1000);
figure('Color', 'w', 'Name', 'Figure (c=1, b=0.6)'); 
hold on; box on;
set(gca, 'XTick', [], 'YTick', [], 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1.2); 

line([min(L) max(L)], [0 0], 'Color', 'k', 'LineWidth', 1.5, 'HandleVisibility', 'off'); 
line([0 0], [-0.8 0.75], 'Color', 'k', 'LineWidth', 1.5, 'HandleVisibility', 'off');    

h = zeros(1, length(a_vals));
for i = 1:length(a_vals)
    p_coeffs = [1, -0.4, -0.6, -0.24*a_vals(i)];
    
    if i == 2  
        h(i) = plot(L, polyval(p_coeffs, L), ...
            'Color', colors{i}, 'LineWidth', 4, ... 
            'DisplayName', labels{i});
    else
        h(i) = plot(L, polyval(p_coeffs, L), ...
            'Color', colors{i}, 'LineWidth', 2.5, ...
            'DisplayName', labels{i});
    end
end


crit_pts = roots([3, -0.8, -0.6]); 
L_minus = min(crit_pts);
L_plus  = max(crit_pts);

plot([L_minus, L_plus], [0, 0], 'k+', 'MarkerSize', 12, ...
    'LineWidth', 1.5, 'HandleVisibility', 'off');

text(L_minus, 0.08, '\lambda_-', 'FontSize', 16, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Interpreter', 'tex');
text(L_plus, 0.08, '\lambda_+', 'FontSize', 16, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Interpreter', 'tex');


text(max(L)-0.05, -0.1, '\lambda', ...
    'FontSize', 18, 'FontAngle', 'italic', 'FontWeight', 'bold');
text(-0.25, 0.7, 'p(\lambda)', ...
    'FontSize', 18, 'FontAngle', 'italic', 'FontWeight', 'bold');


lgd = legend(h, 'Location', 'northeast', ...
    'FontSize', 12, 'FontWeight', 'bold');
title(lgd, 'a values');
set(lgd, 'EdgeColor', 'k', 'BackgroundColor', 'w');

xlim([-0.8, 1.55]); 
ylim([-0.8, 0.85]);
hold off;