function [V, D] = Jacobi(A,tol)
% the Jacobi eigenvalue algorithm is an iterative method 
%for the calculation of the eigenvalues and eigenvectors of a real symmetric matrix
%input A: Matrix
%output D: diagonal matrix D of eigenvalues 
%output V: matrix V whose columns are the corresponding right eigenvectors
    n = length(A);
    V = eye(n);
    N = 1e6;
    if (A==transpose(A))
       k = 0;
       D = diag(A);
       while k < N
           [p,q] = find_U_max(A);
           if A(p,q) ~= 0
               s = (D(q)-D(p))/A(p,q);
               t = solve_t(s);
               c = 1/sqrt(1+t^2);
               d = t*c;
           else
               c = 1;
               d = 0;
           end
           Q = GivensQ(p,q,c,d,n);
           A = (Q')*A*Q;
           V = V*Q;
           D = diag(A);
           E = A - diag(D);
%            fprintf("k = %d, t = %f\n ", k+1, t);
%            fprintf("A = \n");
%            disp(A);
%            fprintf("Q = \n");
%            disp(Q);
%            fprintf("V = \n");
%            disp(V);
           if norm(E,"fro")<tol
               return
           end
           k = k+1;
       end
    else
        fprintf("A need to be a real symmetric matrix\n")
    end
    fprintf("k > %d\n",N)

end

function [p,q] = find_U_max(A)
    D = diag(A);
    E = A - diag(D);
    R = abs(triu(E));
    value = max(max(R));
    [p,q] = find(R==value);
end

function t = solve_t(s)
    if s ~= 0
       p = [1, 2*s, -1];
       r = roots(p);
       t = min(abs(r));
    else
        t = 1;
    end
end

function Q = GivensQ(p,q,c,d,n)
% p,q is the position
% c is cos(theta), d is sin(theta)
% n is the dimension
    Q = eye(n);
    if c==1 && d == 0
        return
    else
        Q(p,p) = c;
        Q(q,q) = c;
        Q(p,q) = d;
        Q(q,p) = -d;
    end
end