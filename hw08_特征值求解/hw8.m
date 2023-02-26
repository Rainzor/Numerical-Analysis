A = [3, 2, 5, 4, 6 ;...
    2, 1, 3, -7, 8;...
    5, 3, 2, 5, -4;...
    4, -7, 5, 1, 3; ...
    6, 8,-4, 3, 8];
[V,D] = Jacobi(A,1e-4);
n = length(A);
for k = 1:n
   fprintf("r%d = %.15f, ", k, D(k));
   fprintf("v%d = (%.15f",k, V(1,k));
   for j = 2:n
       fprintf(", %.15f",V(j,k));
   end
   fprintf(")\n");
end