---
title: 数学建模笔记（1）--随机模拟
mathjax: true
date: 2020-07-16 10:59:30
tags:
- 数学建模
- Python
- MATLAB
categories:
- 学习
- 数学建模
---

数学建模常用的随机模拟知识笔记

<!--more-->

# 理论

蒙特卡洛：

对于独立同分布的随机变量列$X_1,\cdots,X_n$，若随机变量期望方差有限，由中心极限定理，有
$$
P(\frac{\sum_{i=1}^n X_i-n\mu}{\sigma \sqrt n}\leq x)\rightarrow \frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{x} e^{-\frac{t^{2}}{2}} d t
$$
由此，在数据量足够的情况下误差充分小且误差近似正态



# 函数

随机模拟主要依赖于计算机的伪随机生成函数：

| 分布                    | MATLAB                                 | Python                                         |
| ----------------------- | -------------------------------------- | ---------------------------------------------- |
| 均匀分布$U(a,b)$        | `rand(m,n)`0-1均匀，`unifrnd(a,b,m,n)` | `numpy.random.rand(m,n)`0-1                    |
| 指数分布$exp(\lambda)$  | `exprnd`                               | statsmodel                                     |
| 正态分布$N(\mu,\sigma)$ | `normrnd`                              | `np.random.randn(d0, d1, ..., dn)`标准多维正态 |
| 二项分布$B(n,p)$        | `binornd`                              | statsmodel                                     |
| 泊松分布$P(\lambda)$    |   `poissrnd`                                       | statsmodel                                     |
| 随机整数                | `randi(imax,sz1,...,szN)`从1到max      | `np.random.randint(low,high,size,dtype)`       |



# 应用

## 函数模拟

对于某个函数的积分，可以通过蒙特卡洛模拟来解决，不用具体求解而是近似



## 离散的随机问题模拟

排队论问题可以用数学方法求解，但是实际上也很适合用随机模拟



## 连续的模拟

对于一些轨迹问题，如微分方程，取一小段时间来近似轨迹是可以的（前提是有连续依赖性）