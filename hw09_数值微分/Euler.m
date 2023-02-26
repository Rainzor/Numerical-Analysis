h = 0.2;
start = 1;
stop = 2; 
f = @(x,y) x.^2+y; 
g = @(x,y) y+h/2*(f(x,y)+f(x+h,y+h*f(x,y)));
y = 1;
for x = start:h:stop
    y = g(x,y);
    fprintf("x = %f, y = %f\n",x+h,y);
end