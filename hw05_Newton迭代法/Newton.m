function output = Newton(f,x0)
    %牛顿迭代法
    df = diff(f);
    output = double(x0-f(x0)./df(x0));
end

