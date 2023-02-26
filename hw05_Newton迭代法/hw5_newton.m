syms x;
f(x)= x^3/3-x;
x_newton = [0.1, 0.2, 0.9, 9.0];
epsilon = 1e-8;
fprintf("\n牛顿迭代法\n")
for x = x_newton
    x0 = x;
    ii = 0;
    while 1
        x1 = Newton(f,x0);%迭代
        error = abs(x1-x0);
        x0 = x1;
        ii = ii+1;
        if (error < epsilon || abs(f(x1))<eps(0))
            break;
        end
    end
    fprintf("初值:%f, 根: %.15f, 迭代次数: %d\n",x, x1, ii);
end

fprintf("\n取最后一次的迭代结果来验证是否为2阶收敛的\n")
x0 = x_newton(end);
ii = 0;
root = sqrt(3);%取精确的收敛结果
error = 0;
while 1
        x1 = Newton(f,x0);
        e = error;
        error = abs(x1-x0);
        x0 = x1;
        if (error < epsilon || abs(f(x1))<eps(0))
            break;
        end
        ii = ii+1;
        if ii==1
            fprintf("k = %d, xk = %.15f, ek = %.15f, C = NULL\n",ii, x1, error );
        else
            fprintf("k = %d, xk = %.15f, ek = %.15f, C = %.15f\n",ii, x1, error, error/e^2);%C是渐近误差常数
        end
end




