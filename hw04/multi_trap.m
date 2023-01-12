% Program 4.1 Muiltiple-trapezoid Integration
% Computes approximation to definite integral
% Inputs: inline function f, interval a0,b0, and the k_th power of 2    
% Output: s approximate definite integral
function s = multi_trap(f, a0, b0, k)
    if(k<1)
        fprintf("Error! k needs to be at least 0");
        return
    end
    n = 2^k+1;
    h = (b0-a0)/(n-1);
    x_n = linspace(a0,b0,n); %[a0,b0] contains n = 2^k+1 points 
    if k==0
        s = h*(f(a0)+f(b0))/2;
    else
        s = h*(f(a0)/2+f(b0)/2+sum(f(x_n(2:end-1))));
    end
end

