function g_list = FFT_beta(f_list,inv)
%FFT的迭代版本
%inv=1则计算逆变换，inv=0则是正常计算

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
    %为了迭代方便，要对原来的数组按一定方式重新排列
    g_list = bitrevorder(f_list);
    
    sign = -1;
    if nargin == 2
        if inv==1
            sign = 1;
        end
    end
    
    for j = 1:ceil(k)%O(logn)
        m = 2^j;
        wm = exp(sign*1i*2*pi/m);
        for p = 1:m:n%O(n/m)
            w = 1;
            for q = 1:m/2%O(m/2)
                %递推公式
                t = (w)*g_list(p+q+m/2-1);
                u = g_list(p+q-1);
                g_list(p+q-1) = u + t;
                g_list(p+q+m/2-1) = u - t;
                w = w * wm;
            end
        end
    end
    
    %正变换
    if sign == -1
        g_list = g_list./n;
    end
    
end
