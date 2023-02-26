function [n,x] = SOR(A,b,tol,w,x0)
%SOR Iteration Algorithm
%Input: A:full or sparse matrix A,
%       b:a vector
%       tol:tolerance using Inf norm
%       w  : the weight value
%       x0 : the initial x, if not input x0=0
%Output: n:the number of interation
%      : x:the solution of Ax=b
    d = length(b);                          % dimension of b
    D = diag(A);                            % extract diagonal of A
    R = A-diag(D);                          % R is the remainder
    if nargin<5
        x = zeros(d,1);                         % initialize vector x
    else
        x = x0;
    end
    n = 0;
    M=100;                                 % the bound of interation
    while n<M                              % loop for iteration until tolerance
        u = x;    
        for i = 1:d
            u(i) =(1-w)*u(i) + w*(b(i)-R(i,:)*u)/D(i); 
        end
        n = n+1;

    %    fprintf('N of step = %d, \nx(k) = (', n);   % the step and output x(k)
    %    for k=1:d-1
    %        fprintf('%.16f, \n', u(k));
    %    end
    %    fprintf('%.16f), \n', u(d));
    %    fprintf('||x(k) - x(k-1)|| = %.16f. \n\n', norm(u-x, Inf));

        if norm(u-x, Inf) < tol
            x = u;
            return;
        else
            x = u;
        end
    end                                     % End of SOR iteration loop
    fprintf('w = %.4f Can not solve the linear equation Ax = b by SOR method.\n',w);
end

