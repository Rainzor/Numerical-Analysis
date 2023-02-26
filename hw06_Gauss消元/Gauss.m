function x = Gauss(n, A, b)
    A = [A,b];%将矩阵合并
    for k = 1:n-1
        %fprintf("第%d次:\n",k);
        %disp(full(A));
        [~,p] = max(abs(A(k:end,k)));%寻找模最大的列主元
        p = p + k -1;
        if p ~= k
            A([k,p],:) = A([p,k],:);
        end
        ak = A(k,k);
        ck = A(k+1:end,k)./ak;
        A(k+1:end, k:end) = A(k+1:end, k:end)-ck*A(k,k:end);%Gauss消元法
    end
    %disp(full(A));
    b = A(:,end);
    x = zeros(n,1);
    x(n) = b(n)/A(n,n);
    for k = n-1:-1:1
        x(k) = (b(k)-A(k,k+1:end-1)*x(k+1:end))/A(k,k);%求解根
    end
end