function [t,y] = RungeKutta4(odefun,tspan,y0)
%The 4-order Runge Kutta Method to solve the ODE 
%Input:
%odefun is the function of f(x,y) for ODE
%tspan = [t0,tf] is the interval of ODE or the form is like t0: step: tf
%y0 is the initial condition 
%Output:
%t the calculated points
%y the results
    n = length(tspan);
    if n < 2
        fprintf("tspan need to be a interval like [a,b]\n");
        return
    elseif n==2
        t = linspace(tspan(1),tspan(2),11);
        n = 11;
        h = (tspan(2)-tspan(1))/10;
    else
        t = tspan;
        h = tspan(2)-tspan(1);
    end
    y = zeros(size(t));
    y(1) = y0;
    for j = 1:n-1
        k1 = odefun(t(j), y(j));
        k2 = odefun(t(j)+h/2, y(j)+h*k1/2);
        k3 = odefun(t(j)+h/2, y(j)+h*k2/2);
        k4 = odefun(t(j)+h, y(j)+h*k3);
        y(j+1) = y(j) + h*(k1+ 2*k2 + 2*k3+ k4)/6;
    end
    

end

