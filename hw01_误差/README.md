## 数学推导

**推导过程如下，考虑截断误差小于** $10^{-6}$
$$
\sum\limits_{k=n}^{\infty}\frac{1}{k(k+x)}<\sum\limits_{k=n}^{\infty}\frac{1}{k^2}<\int\limits_{k=n-1}^{\infty}\frac{1}{k^2}dk=\frac{1}{n-1}<10^{-6}
$$
**所以可见求和上界**$n \geq 10^6$



## 代码流程

1：可以选择直接查看样例或自行输入（y/n）

```shell
Do you want get some examples:(y/n)
```

2.选择y，得到：

```shell
y
input: x = 0.000, output:sum = 1.644933066848726
input: x = 0.500, output:sum = 1.227410877760339
input: x = 1.000, output:sum = 0.999999800000080
input: x = 1.414, output:sum = 0.588554731279895
input: x = 10.000, output:sum = 0.292896625397445
input: x = 100.000, output:sum = 0.051873575182416
input: x = 300.000, output:sum = 0.020942012944351
```

3.选择n,可得选择输入，得到相应的输出(输入q退出)：

```shell
n
input:1.5
output : sum =  0.553813059868711

input(or 'q' to quit) : q
```

=======
## 数学推导

**推导过程如下，考虑截断误差小于** $10^{-6}$ 

$$
\sum\limits_{k=n}^{\infty}\frac{1}{k(k+x)}<\sum\limits_{k=n}^{\infty}\frac{1}{k^2}<\int\limits_{k=n-1}^{\infty}\frac{1}{k^2}dk=\frac{1}{n-1}<10^{-6}
$$

**所以可见求和上界**$n \geq 10^6$



## 代码流程

1：可以选择直接查看样例或自行输入（y/n）

```shell
Do you want get some examples:(y/n)
```

2.选择y，得到：

```shell
y
input: x = 0.000, output:sum = 1.644933066848726
input: x = 0.500, output:sum = 1.227410877760339
input: x = 1.000, output:sum = 0.999999800000080
input: x = 1.414, output:sum = 0.588554731279895
input: x = 10.000, output:sum = 0.292896625397445
input: x = 100.000, output:sum = 0.051873575182416
input: x = 300.000, output:sum = 0.020942012944351
```

3.选择n,可得选择输入，得到相应的输出(输入q退出)：

```shell
n
input:1.5
output : sum =  0.553813059868711

input(or 'q' to quit) : q
```

>>>>>>> bf3db2baaab9eb4b8ca64812d09081e4db5c511c:hw1/README.md
