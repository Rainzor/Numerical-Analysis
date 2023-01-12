function g_list = FFT(f_list)
% FFT: Fast Fourier Transform  
%      is an algorithm that computes the discrete Fourier transform (DFT) 
%      of a sequence, or its inverse (IDFT)
% Input: the the discrete sequnece to be transform (size = n*1) 
% Output: the fourier coefficient for Input sequence (size = n*1)
% e.g.
% Y = FFT(X)
% X = \sum_n{Y*exp(i*n*w*x_n)}

    N = length(f_list);
    %如果输入只有一个 或 输入数组的都是0,那么直接返回0数组
    if N == 1 || ~any(f_list,'all')
        g_list = f_list;
        return;
    end
    k = log2(N);
    %处理一下，输入的长度不满足2的幂次条件，在高位处用0补齐，时间复杂度不会有太大变化。
    if ceil(k)~=k
        n = 2^ceil(k);
        tmp = zeros(n-N,1);
        f_list = [f_list;tmp];
    else
        n = N;
    end
    
    %递归调用
    f1 = f_list(1:2:end);
    f2 = f_list(2:2:end);
    g1 = FFT(f1);
    g2 = FFT(f2);
    
    w_n = exp(-1i*2*pi/n);
    w = 1;
    g_list = zeros(size(f_list));
    for k = 1:n/2
        %递推公式
        g_list(k) = (g1(k)+w*g2(k))/2;
        g_list(k+n/2) = (g1(k)-w*g2(k))/2;
        w = w*w_n;
    end
    if n~=N
        g_list = g_list(1:N);
    end
end

