%this gives me the graphs for both cases a>a*, a>>a* and a<=a* for my PDE system
function spatialgraph

m = 0;
x = linspace(-40,40,40000);
t = linspace(0,10,4);
times = [0 20];
a = 0.1;

sol1 = pdepe(m,@(x,t,u,DuDx)pdepredpreyable(x,t,u,DuDx,a),@icon,@bcon,x,t);

u1 = sol1(:,:,1);
v1 = sol1(:,:,2);

idx1 = zeros(size(times));
for k = 1:length(times)
    [~,idx1(k)] = min(abs(t-times(k)));
end

figure('Color','w');

for k = 1:length(times)

    subplot(2,1,k)

    % Smooth curves using spline interpolation
    xs = linspace(min(x),max(x),2000);
    us = interp1(x,u1(idx1(k),:),xs,'spline');
    vs = interp1(x,v1(idx1(k),:),xs,'spline');

    plot(xs,us,'b','LineWidth',2); hold on;
    plot(xs,vs,'r','LineWidth',2);

    xlabel('x');
    ylabel('Population');
    title(['a = 0.1 at t = ',num2str(t(idx1(k)),3)]);
    legend('u','v','Location','best');

    grid on;
    xlim([-40 40]);
    set(gca,'FontSize',12)

end

a = 0.6;

sol2 = pdepe(m,@(x,t,u,DuDx)pdepredpreyable(x,t,u,DuDx,a),@icon,@bcon,x,t);

u2 = sol2(:,:,1);
v2 = sol2(:,:,2);

idx2 = zeros(size(times));
for k = 1:length(times)
    [~,idx2(k)] = min(abs(t-times(k)));
end

figure('Color','w');

for k = 1:length(times)

    subplot(2,1,k)
    xs = linspace(min(x),max(x),2000);
    us = interp1(x,u2(idx2(k),:),xs,'spline');
    vs = interp1(x,v2(idx2(k),:),xs,'spline');

    plot(xs,us,'b','LineWidth',2); hold on;
    plot(xs,vs,'r','LineWidth',2);

    xlabel('x');
    ylabel('Population');
    title(['a = 0.6 at t = ',num2str(t(idx2(k)),3)]);
    legend('u','v','Location','best');

    grid on;
    xlim([-40 40]);
    set(gca,'FontSize',12)

end

a = 5;

sol3 = pdepe(m,@(x,t,u,DuDx)pdepredpreyable(x,t,u,DuDx,a),@icon,@bcon,x,t);

u3 = sol3(:,:,1);
v3 = sol3(:,:,2);

idx3 = zeros(size(times));
for k = 1:length(times)
    [~,idx3(k)] = min(abs(t-times(k)));
end

figure('Color','w');

for k = 1:length(times)

    subplot(2,1,k)
    xs = linspace(min(x),max(x),2000);
    us = interp1(x,u3(idx3(k),:),xs,'spline');
    vs = interp1(x,v3(idx3(k),:),xs,'spline');

    plot(xs,us,'b','LineWidth',2); hold on;
    plot(xs,vs,'r','LineWidth',2);

    xlabel('x');
    ylabel('Population');
    title(['a = 5 at t = ',num2str(t(idx3(k)),3)]);
    legend('u','v','Location','best');

    grid on;
    xlim([-40 40]);
    set(gca,'FontSize',12)

end
end