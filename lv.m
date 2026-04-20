%This is the Lotka Volterra system that I use ODE45 on
function dydt = lv(t,x)
dydt = [x(1)*(2-x(2));x(2)*(x(1)-2)];
end
