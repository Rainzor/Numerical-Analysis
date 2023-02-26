function output = Tangent(f ,x0, x1)
    %弦截法迭代
    y0 = f(x0);
    y1 = f(x1);
    dy1 = (y1-y0)/(x1-x0);
    output = double(x1 - y1/dy1);
end

