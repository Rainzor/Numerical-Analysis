function arg = least_square_method(baseFunc,data)
%根据均方误差最小化为标准，计算最优拟合
%Input:baseFunc基函数,data数据集
%Output:最优化系数
x = data(:,1);
y = data(:,2);
A = baseFunc(x);
arg = (A'*A)\(A'*y);

    
end

