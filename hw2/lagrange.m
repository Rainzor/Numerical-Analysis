function l = lagrange(dataset)
%Get lagrange polynomial as symbolic form
%input: dataset = [train_x; train_y]
%output: lagrange polynomial function
    datax = dataset(1,:);
    datay = dataset(2,:);
    syms x
    
    sub_x = x - datax;
    omega(x) = prod(sub_x);%w(x) = (x-x0)(x-x1)(x-x2)....
    omega_d(x) = diff(omega,x);   
    temp = omega_d(datax).*sub_x;% w'(xi)(x-xi)
    l(x) = simplify(sum(omega.*datay./temp));% l(x) =sigma( yi* w(x)/(w'(xi)(x-xi)) )
end

