f = @(x) 1./(1+x.^2);

%make testing dataset
test_x = linspace(-5,5,501);
test_y = f(test_x); 

for n = [5,10,20,40]
    %make training dataset
    x_i = (0:n);
    train_x1 = linspace(-5,5,n+1);
    train_x2 = -5*cos((2*x_i+1)*pi/(2*n+2));
    train_y1 = f(train_x1);
    train_y2 = f(train_x2);
    train_set1 = [train_x1; train_y1];
    train_set2 = [train_x2; train_y2];
    
    
    lag1 = lagrange(train_set1);D%get lagrange polynomial 
    train_y1 = double(lag1(test_x));%transform syms to double
    max1 = max(abs(test_y - train_y1));%get max
  
    %similar as follow
    lag2 = lagrange(train_set2);
    train_y2 = double(lag2(test_x));
    max2 = max(abs(test_y - train_y2));
    
    %print result
    fprintf(' n = %d\n max1 = %.15e, max2 = %.15e\n\n',n,max1,max2);
    
end