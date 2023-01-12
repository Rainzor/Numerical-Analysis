A = [0.8,1,0;1, 1.8, 1; 0, 1, 2.8];
tol = 1e-3;
x0 = [1;1;1];
k=0;
while 1
    y0 = x0/max(x0);
    x1 = A\y0;
    fprintf("k = %d;\ny%d = \n",k, k);
    disp(y0);
    fprintf("x%d = \n",k+1);
    disp(x1);
    if abs(max(x0)-max(x1))<tol || k>100
        break
    end
    k =k+1;
    x0 = x1;
end
