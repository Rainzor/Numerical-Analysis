syms x;
f(x)= x^3/3-x;
x_tang = [-.1,.1; -.2, .2; -2, .9,; .9, 9]';
epsilon = 1e-8;
fprintf("\n弦截法\n")
for x = x_tang
    x0 = x(1);
    x1 = x(2);
    k = 0;
    while 1
        x2 = Tangent(f,x0,x1);%迭代
        error = abs(x2 - x1);
        x0 = x1;
        x1 = x2;
        k = k+1;
        if (error < epsilon || abs(f(x1))<eps(0))
            break;
        end
    end
    fprintf("初值: x0=%f, x1=%f, 根: %.15f, 迭代次数: %d\n",x(1),x(2),x2, k);
end

fprintf("\n这里取最后一次迭代，验证弦截法迭代收敛阶是否为(1+sqrt(5))/2\n")
root = x2;
x0 = x(1);
x1 = x(2);
k = 0;
error = 0;
a = (1+sqrt(5))/2;
while 1
        x2 = Tangent(f,x0,x1);
        e = error;
        error = abs(root-x2);
        x0 = x1;
        x1 = x2;
        k = k+1;
        if k==1
            fprintf("k = %d, xk = %.15f, ek = %.15f, C = NULL\n",k, x2, error );
        else
            fprintf("k = %d, xk = %.15f, ek = %.15f, C = %.15f\n",k, x2, error, error/e^(a));%C是渐近误差常数
        end
        if (error < epsilon || abs(f(x1))<eps(0))
            break;
        end
end







