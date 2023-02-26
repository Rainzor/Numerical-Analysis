x = (0.25:0.25:2.5);
y = [1.284, 1.648, 2.117, 2.718, 3.427, 2.798, 3.534, 4.456, 5.465, 5.894];
data = [x',y'];
baseFunc =@(x)[sin(x),cos(x)];%定义基函数，如果是多项式，可以写成[1+x-x,x,x.^2,x.^3]
arg = least_square_method(baseFunc,data);%调用最小均方拟合，返回参数
error = baseFunc(x')*arg-y';
sq_error = norm(error)^2;
fprintf("a = %.15e, b = %.15e, 均方误差 = %.15e\n",arg(1),arg(2),sq_error);
