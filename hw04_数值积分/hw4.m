a = 1;
b = 5;
N = 12;
f =@sin;
k=2;
s_trap = zeros(N+1);
s_simp = s_trap(N+1);

real_int = integral(f,a,b);%cos(1)-cos(5)

%numerial intergation
for l = 1:N+1
    s_trap(l) = multi_trap(f,a,b,l);
    s_simp(l) = multi_simp(f,a,b,l);
end

%error
e_trap = abs(real_int - s_trap);
e_simp = abs(real_int - s_simp);

%log(error)
log_trap = log(e_trap);
log_simp = log(e_simp);

fprintf("Multiple Trapezoid\n");
for i = 1:N
    o = (log_trap(i)-log_trap(i+1))/log(k); %order of error
    fprintf("%d: %.15e, %.15e, %.15e\n",i, s_trap(i), e_trap(i), o);
end
fprintf("\nMultiple Simpson\n");
for i = 1:N
    o = (log_simp(i)-log_simp(i+1))/log(k);%order of error
    fprintf("%d: %.15e, %.15e, %.15e\n",i, s_simp(i), e_simp(i), o);
end





