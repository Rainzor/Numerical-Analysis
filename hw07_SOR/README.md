# README

> Rainzor

**主程序在"hw7.m"中，分别调用了 ”Gauss_Seidel.m“ 和 ”SOR.m“，进行计算**

#### Gauss_Seidel

Gauss_Seidel迭代步数是22次，结果为
`x(k) = (-0.2892337551029794, 0.3454357631085859, -0.7128117054250090, -0.2206084917720635, -0.4304004137150014, 0.1543087743636601, -0.0578228480265902, 0.2010538992340034, 0.2902286680179116）`

#### SOR

SOR最佳迭代步数为 13次，在w = 1.1800处取得
`x(k) = (-0.2892338161500276, 0.3454357155035079, -0.7128117311165767, -0.2206085103819872, -0.4304004327539567, 0.1543087396965672, -0.0578228733687417, 0.2010538951436372, 0.2902286619983028)`

其中程序内部有对不收敛迭代的处理，所以会有冗余输出

#### 输出结果为：

```matlab
Gauss_Seidel
GS step = 22 
x(k) = (-0.2892337551029794, 0.3454357631085859, -0.7128117054250090, -0.2206084917720635, -0.4304004137150014, 0.1543087743636601, -0.0578228480265902, 0.2010538992340034, 0.2902286680179116), 

SOR
w = 0.0200 Can not solve the linear equation Ax = b by SOR method.
w = 0.0400 Can not solve the linear equation Ax = b by SOR method.
w = 0.0600 Can not solve the linear equation Ax = b by SOR method.
w = 0.0800 Can not solve the linear equation Ax = b by SOR method.
w = 0.1000 Can not solve the linear equation Ax = b by SOR method.
w = 0.1200 Can not solve the linear equation Ax = b by SOR method.
w = 0.1400 Can not solve the linear equation Ax = b by SOR method.
w = 0.1600 Can not solve the linear equation Ax = b by SOR method.
w = 0.1800 Can not solve the linear equation Ax = b by SOR method.
w = 0.2000 Can not solve the linear equation Ax = b by SOR method.
w = 0.2200 Can not solve the linear equation Ax = b by SOR method.
w = 0.2400 Can not solve the linear equation Ax = b by SOR method.
w = 0.2600 Can not solve the linear equation Ax = b by SOR method.
w = 0.2800 Can not solve the linear equation Ax = b by SOR method.
w = 0.3000 Can not solve the linear equation Ax = b by SOR method.
w = 0.3200 Can not solve the linear equation Ax = b by SOR method.
w = 1.8000 Can not solve the linear equation Ax = b by SOR method.
w = 1.8200 Can not solve the linear equation Ax = b by SOR method.
w = 1.8400 Can not solve the linear equation Ax = b by SOR method.
w = 1.8600 Can not solve the linear equation Ax = b by SOR method.
w = 1.8800 Can not solve the linear equation Ax = b by SOR method.
w = 1.9000 Can not solve the linear equation Ax = b by SOR method.
w = 1.9200 Can not solve the linear equation Ax = b by SOR method.
w = 1.9400 Can not solve the linear equation Ax = b by SOR method.
w = 1.9600 Can not solve the linear equation Ax = b by SOR method.
w = 1.9800 Can not solve the linear equation Ax = b by SOR method.
SOR min step = 13  and w = 1.1800
x(k) = (-0.2892338161500276, 0.3454357155035079, -0.7128117311165767, -0.2206085103819872, -0.4304004327539567, 0.1543087396965672, -0.0578228733687417, 0.2010538951436372, 0.2902286619983028), >> 
```

