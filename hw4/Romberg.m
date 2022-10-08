format long;

a=1;
b=2;
h=b-a;
M =5;
e = 1e-4;
f =@(x) 1./x;
R= zeros(M,M);
R(1,1)=(f(a)+f(b))*h/2;
for k = 2:M
    n = 2^(k-2);
    x = 1:n;
    h = h/2;
    x = a+(2.*x-1)*h;
    y = f(x);
    R(k,1)= R(k-1,1)./2+h.*sum(y);
    for j=2:k
        R(k,j)= R(k,j-1)+(R(k,j-1)-R(k-1,j-1))/(4^(j-1)-1);
    end
end
R


