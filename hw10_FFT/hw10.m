f =@(x) (0.7).*sin(4*pi.*t)+sin(10*pi.*t);
for n=[128,256]
    t = linspace(0,1,n+1);
    t = t(1:n);
    y = f(t);
    %FFT是用递归调用的方法计算的 
    g = fft(y')/n;
    %beta版本是用迭代的方法计算的
    %g = FFT_beta(y',0)
    fprintf("\n%d个采样点\n",n);
    for k = 1:n
        fprintf("向量g的第%d个分量, x%d = %+.20f, y%d = %+.20f\n", k-1 , k-1, real(g(k)),k-1, imag(g(k)));
    end
end




