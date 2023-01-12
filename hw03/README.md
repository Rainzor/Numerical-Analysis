# README

> 学号：PB20020480
>
> 姓名：王润泽
>
> 编号：28
>
> 环境：Windows11 MATLAB R2021a

## 代码说明

`hw3.m`为主函数，创建基函数，调用least_square_methoed.m，得到基函数参数，输出以下内容

```matlab
a = 4.391222709060114e+00, b = -1.463107560136264e+00, 均方误差 = 1.240749774136143e+01
```

`least_square_methoed.m`

根据均方误差最小化为标准，计算最优拟合
Input:baseFunc基函数,data数据集
Output:最优化系数