G=[3,-2,1;-2,2,1;1,1,6];
g = [2;-1;3];
x0 = [0;0;0];
g0 = g + G*x0;
p0 = -g;
for k = 1:3
    lamb = (g0'*g0)/(p0'*G*p0);
    x1 = x0 + lamb*p0;
    g1 = g + G*x1;
    beta = g1'*g1/(g0'*g0);
    p1 = -g1 + beta*p0;
    fprintf("p%d:\n",k);
    disp(p1);
    fprintf("g%d:\n",k);
    disp(g1);
    fprintf("x%d:\n",k);
    disp(x1);
    
    p0 = p1;
    g0 = g1;
end