---
title: 组合数学知识（2）--常系数递推关系
mathjax: true
date: 2020-05-09 08:34:46
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

常系数递推关系（组合数学笔记等）

<!--more-->

常系数递推关系：

* 常系数齐次线性递推
  * 互不相同的实特征根
  * 存在相同的实特征根
  * 有复数根（以仅有两个讨论）
* 常系数非齐次线性递推



# 齐次递推关系

$$
H_{n}-a_{1} H_{n-1}-a_{2} H_{n-2}-\cdots-a_{r} H_{n-r}=0
$$

其中最后的$a_r \neq 0$，这就是r阶的齐次递推关系。（系数为负是因为通常递推式是左侧给出$H_n$其余在右端）

对于这样的递推关系，有相应的特征方程：
$$
x^{r}-a_{1} x^{r-1}-a_{2} x^{r-2}-\dots-a_{r-1} x-a_{r}=0
$$
特征方程的根称为**原递推关系的特征根**

【整数的递推关系，可以有共轭无理数特征根，比如斐波那契数列】

**齐次的计算难度在于高阶多项式的求根方法。**

## 互不相同特征根

如果有互不相同的r个特征根$\boldsymbol{q}_{1}, \boldsymbol{q}_{2}, \dots, \boldsymbol{q}_{r}$
$$
\boldsymbol{H}_{n}=c_{1} \boldsymbol{q}_{1}^{n}+c_{2} \boldsymbol{q}_{2}^{n}+\cdots+\boldsymbol{c}_{r} \boldsymbol{q}_{r}^{n}
$$
其中的待定系数可以用带入求出



## 有实重根情况

如果有t个特征根$\boldsymbol{q}_{1}, \boldsymbol{q}_{2}, \dots, \boldsymbol{q}_{t}$，每个根的重数为$r_i$

那么通式为：
$$
H_n = \sum_{i=1}^t (c_{i1} +c_{i2} n+\cdots+c_{ir_{i}} n^{r_{i}-1} )q_{i}^{n}
$$
同样可以用初值条件解出待定系数



## 复数根（以一对为例）

实系数方程复数根成对
$$
\begin{array}{l}
\alpha_{1}=\delta+i \omega=\rho e^{i \theta}=\rho(\cos \theta+i \sin \theta) \\
\alpha_{2}=\delta-i \omega=\rho e^{-i \theta}=\rho(\cos \theta-i \sin \theta)
\end{array}
$$
套用上面的待定系数（那么这里的系数是复数），进行调整，得到实数的两个待定系数AB：
$$
\begin{array}{l}
l_{1} \alpha_{1}^{n}+l_{2} \alpha_{2}^{n} \\
=l_{1} \rho^{n}(\cos n \theta+i \sin n \theta)+l_{2} \rho^{n}(\cos n \theta-i \sin n \theta) \\
=\left(l_{1}+l_{2}\right) \rho^{n} \cos n \theta+i\left(l_{1}-l_{2}\right) \rho^{n} \sin n \theta \\
= A \rho^{n} \cos n \theta+B \rho^{n} \sin n \theta 
\end{array}
$$
通过这个方法可以避免复数的出现，简化待定系数法求解的难度



# 非齐次

$$
H_{n}-a_{1} H_{n-1}-a_{2} H_{n-2}-\cdots-a_{r} H_{n-r}=f(n)
$$

一般的非齐次问题不容易求解，仅对特殊情况有好的方法



## 观察特解法

类似于线性代数的齐次方程与非齐次方程的关系，递推关系也有这个特点

可以通过观察法找到一个特解，与对应齐次的递推关系相加。

【一般不容易观察到】



## 升阶法

**非齐次项是多项式**的情况下，可以增加递推关系的阶，降低非齐次项的幂次, 从而化成齐次求解

【例】汉诺塔

$a_n = 2a_{n-1}+1$与$a_{n-1}=2 a_{n-2}+1$相减，那么就可以得到$a_{n}-3 a_{n-1}+2 a_{n-2}=0$



## 1阶多项式非齐次的特色情况

$$
\boldsymbol{H}_{n+1}+\boldsymbol{a} \boldsymbol{H}_{n}=\boldsymbol{f}(\boldsymbol{n})
$$

如果对于一阶非齐次，$f(n)$为m次的多项式，那么：

* 如果a是-1，有一个m+1次的多项式特解
* 其他情况，有一个m次多项式特解

注意：

* 这个一般很少用
* 特解是设定待定系数，然后套方程求解