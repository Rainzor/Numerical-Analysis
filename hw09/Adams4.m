function [t,y]=Adams4(odefun,tspan,y0)
%The 4-order Adams Method to solve the ODE 
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
    f_xy = zeros(size(t));
%初始启动的点由4阶Runge-Kutta方法得到
    [~,y(1:4)] = RungeKutta4(odefun,t(1:4),y0);
%f_xy存储着数值点对应的函数值，减少下列循环的重复计算
    f_xy(1:4) = odefun(t(1:4),y(1:4));
    
    for j = 4:n-1
        y(j+1) = y(j) + h*(55*f_xy(j)- 59*f_xy(j-1)+ 37*f_xy(j-2)- 9*f_xy(j-3))/24;
        y(j+1) = y(j) + h*(9*odefun(t(j+1), y(j+1))+ 19*f_xy(j)-5*f_xy(j-1)+f_xy(j-2))/24;
        f_xy(j+1) = odefun(t(j+1), y(j+1));
    end
    
end