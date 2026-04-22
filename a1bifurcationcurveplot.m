%This is the plot I used to define where the Bifurcation line lies for a=1
%and the stability of systems with varying b and d in such a system. Note I
%moved the legend before including it in my work. This is for a figure in 'Adapted Models'
clear; clc;
dm = sqrt(5) - (2);

d = linspace(0, dm, 600);

root = sqrt((- d).^2 + 4*d);
bcrit = ((1 - root) .* ...
        (2 + d - root)) ./ (2);

bmax = 1.2;

figure; hold on;
fill([d fliplr(d)], ...
     [bcrit bmax*ones(size(bcrit))], ...
     [0.75 0.85 1], ...
     'EdgeColor','none','FaceAlpha',0.6);
fill([d fliplr(d)], ...
     [zeros(size(bcrit)) fliplr(bcrit)], ...
     [1 0.7 0.7], ...
     'EdgeColor','none','FaceAlpha',0.6);
plot(d, bcrit, 'k', 'LineWidth', 2);
xline(0.2, '--k', 'LineWidth', 1.5);

plot(0.2, 0.03, 'ko', 'MarkerFaceColor','k', 'MarkerSize',8);

plot(0.2, 1, 'ko', 'MarkerFaceColor','k', 'MarkerSize',8);

xlabel('d','FontSize',14)
ylabel('b','FontSize',14)
title(['Stability Regions (a = 1)'],'FontSize',15)

xlim([0 dm])
ylim([0 bmax])

set(gca,'FontSize',13,'LineWidth',1.2)
box on

legend('Stable Region','Unstable Region','Bifurcation Curve', ...
       'Location','northeast')

hold off;