function [x,fval] = golden_section_fmin(f,a,b,error_tol,relative_error_percent)
%黄金分割法求函数极小值
%输入
%f 待求函数
%[a,b] 函数区间
%error_tol 相邻两次迭代的误差
%relative_error_percent 区间误差
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
    
    t = (sqrt(5)-1)/2;
    N=100000;
    ak = b-t*(b-a);
    bk = a+t*(b-a);
    ya = f(ak);
    yb = f(bk);
    for k = 1:N
         fprintf("%d:[ak,bk] = [%f, %f], f(ak) = %f, f(bk) = %f\n",k,ak,bk,ya,yb);
        if(ya <= yb)
            if(b-a<e)
                x = ak;
                fval = ya;
                break;
            end
            %a = a;
            b = bk;
            bk = ak;
            ak = b-t*(b-a);
            yb = ya;
            ya = f(ak);
        else
            if(b-a<e)
                x = bk;
                fval = yb;
                break;
            end
            %b = b;
            a = ak;
            ak = bk;     
            bk = a+t*(b-a);
            ya = yb;
            yb = f(bk);            
        end
        fprintf("%d:[a,b] = [%f, %f], b-a = %f\n",k,a,b,b-a);
    end
    fprintf("x = %f, fval = %f",x,fval);
end