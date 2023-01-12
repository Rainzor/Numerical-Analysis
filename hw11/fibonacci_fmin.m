function [x,fval] = fibonacci_fmin(f,a,b,error_tol,relative_error_percent)
%斐波那契法求函数极小值
%输入
%f 待求函数
%[a,b] 函数区间
%error_tol 给定误差具体值
%relative_error_percent 区间相对误差
%输出
%x 极小值点
%fval 极小值
    if(nargin==3)
        e = 1e-5;
    elseif(nargin == 4)
        e = error_tol;       
    else
        e = min(error_tol,(b-a)*relative_error_percent);
    end
    
    r = (b-a)/e;
    n=1;
    while fibonacci(n)< r
        n = n+1;
    end
    fprintf("Fibonacci bound n = %d\n",n);
    ratio_list = fibonacci((1:n-1))./fibonacci((2:n));
    for k = 1:n-2
        r = ratio_list(n-k);
        ak = b - r*(b-a);
        bk = a + r*(b-a);
        ya = f(ak);
        yb = f(bk);
        fprintf("%d:[ak,bk] = [%f, %f], f(ak) = %f, f(bk) = %f\n",k,ak,bk,ya,yb);
        if ya <= yb
            b = bk;
        else
            a = ak;
        end
        fprintf("%d:[a,b] = [%f, %f], b-a = %f\n",k,a,b,b-a);      
    end
    x = a;
    fval = f(a);
    
    
    
    
    