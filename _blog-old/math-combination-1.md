---
title: 组合数学知识（1）--格路模型与卡塔兰数
mathjax: true
date: 2020-04-28 08:13:32
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

格路模型&卡塔兰数

（组合数学课堂笔记等）

<!--more-->



# 基本格路模型：

从初始点$(0,0)$走到点$(m,n)$，过程只能向上或者向右（走最短路径不绕路）

对应的方法数：$\binom{n}{m+n}$



# 不碰对角线情况

从初始点$(0,0)$走到点$(m,n)$，过程中一直在对角线上方,$m<n$

因为不碰对角线，所以实际上是从$(0,1)$开始走到点$(m,n)$。

不考虑对角线，总数是$\binom{m}{m+n-1}$

而上述过程中，碰触对角线的部分可以作一个一一对应，将最后一次触碰对角线前的部分关于对角线作对称变化，转化为从$(1,0)$开始走到点$(m,n)$的路径总数是$\binom{m-1}{m+n-1}$

所以不碰对角线的部分可以表示为

$$\binom{m}{m+n-1}-\binom{m-1}{m+n-1} = \frac{(m+n-1)!}{m!n!} \cdot (n-m)$$



# 不越过对角线情况

从初始点$(0,0)$走到点$(m,n)$，过程中一直不低于对角线,$m\leq n$

方法1：作平移变化，使用不碰对角线方法、

方法2：构造一一对应



## 一个特殊情况--卡塔兰数

从$(0,0)$到$(n,n)$不越过对角线

可以用来

* 评估栈的可行操作数
* 买票找零
* 等等

$$h(n)=C(2n,n)-C(2n,n-1)=\frac{1}{(n+1)} \cdot C(2n,n)(n=0,1,2,...)$$



# 卡塔兰数

## 递推序列定义

给出一个初值$C(2)=1$，下面的序列有唯一情况
$$
C(n)=\sum_{k=2}^{n-1} C(k) C(n-k+1) \quad(n \geq 3)
$$
这是一个非线性的递推关系



## 应用实例



### 对于凸多边形的三角形拆分

对于一个凸n边图形，可以用不相交的对角线将多边形拆解为三角形，拆解的方法即为$C(n)$

思路：

* 三角形拆分可以有递推的表达式：$\mathbf{h}_{n+1}=\mathbf{h}_{2} \mathbf{h}_{n}+\mathbf{h}_{3} \mathbf{h}_{n-1}+\ldots+\mathbf{h}_{n} \mathbf{h}_{2}$
* 上述递推式来源于，给定一个起始边$P_1P_n$，从中间选一个点$P_k$，那么这三点形成三角形，并且剩下两个多边形。
* 这个方式是一一对应的，因为划定三角形之后，因为对角线不相交的原则所以不会出现其他情况







