---
title: 组合数学知识（3）--整数拆分
mathjax: true
date: 2020-05-12 08:06:06
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

整数拆分问题(以及Ferrers图) 

（组合数学笔记等）

<!--more-->

# 定义

给定一个整数$n$，可以拆分成$n=n_1+n_2+ \cdots +n_k$，每一个都是**正**整数

拆分可以是有序的拆分，也可以是无序的拆分，一般都采用**无序**的，即可以调换顺序为同一种，那么每个拆分可以从大到小拆：$n_1 \geq n_2 \geq \cdots n_k \geq 1$，而有序拆分的问题比较容易求解。



# 有序拆分

如果拆分是有序的，可以转换为**投球入盒**问题(n相同球放入m盒子，不允许空)

记把自然数$n$拆分成$m$个正整数的和，如果有序：
$$
P'(n,m) = C(n-1,m-1)
$$
总方法数为：
$$
P'(n)  = \sum_{m=1}^n P'(n,m) = \sum_{m=1}^n C(n-1,m-1)  =2^{n-1}
$$

# 无序拆分

无序拆分的球-盒模型：$n$个无区别的球放入$n$个**无标志盒子**，可以放0个或者多个。

这是很有用的组合数，但是精确表达式难以得到

对于这一问题，可以用母函数求确定的拆分数，以及对拆分数上界进行估计$p(n)<e^{\sqrt{\frac{20}{3} n}}$



## 整数拆分的相关问题--砝码称重

### 无重复情况

如果有1-4克砝码**各一个**，问可以称那些重量，每个重量有多少方法

普通母函数：$(1+x)(1+x^2)(1+x^3)(1+x^4)$

也可以用整数拆分来解释，问哪些数字可以进行整数拆分表示为1~4的情况

### 有限可重复

如果有1克3枚，2克4枚，4克2枚
$$
G(x) = (1+x+x^2+x^3)(1+x^2+x^4+x^6+x^8)(1+x^4+x^8)
$$
也可以用整数拆分来解释，问那些数字可以进行整数拆分表示为上述有限个和的情况



### 无限可重复

无限情况和一般的有限情况不同

用1-3角邮票贴出数值，问每个数值的不同方案数（**因为任何面值都能贴出来**）
$$
G(x) = (1+x+x^2+\cdots) (1+x^2+x^4\cdots) (1+x^3+x^6+\cdots)
$$

## 回到整数拆分

### 有限制整数拆分

如果限制整数n可以拆分成$1,2 \cdots m$的和，可以重复，求其母函数$G_1(x)$
$$
G_{1}(x)= \frac{1}{(1-x)\left(1-x^{2}\right) \cdots\left(1-x^{m}\right)}
$$
注意到这种形式的母函数，虽然还是可以表示幂级数成分式，但是**分式十分复杂**（而且和m是有关系的）

在此基础上可以进行拓展添加一些限制条件，比如如果**要求m至少出现一次**，那么对应m使用情况的项就转化为$(x^m+x^{2m}+ \cdots)$，这是限制最大数m必须存在情况下的母函数$G_2(x)$。
$$
G_{2}(x)=\left(1+x+x^{2}+\cdots\right) 
\left(1+x^{2}+x^{4}+\cdots\right) \cdots 
\left(x^{m}+x^{2 m}+\cdots\right)  
= \frac{x^m}{(1-x)\left(1-x^{2}\right) \cdots\left(1-x^{m}\right)} 
$$
还可以做个变形：
$$
G_{2}(x)= \frac{1}{(1-x)\left(1-x^{2}\right) \cdots\left(1-x^{m}\right)} 
-\frac{1}{(1-x)\left(1-x^{2}\right) \cdots\left(1-x^{m-1}\right)}
$$




### 无限制整数拆分

母函数可以写出来，但是这个式子得不出精确表达式来（即把有限制中的m换成$\cdots$）

我们要处理的问题：

* 给定n求拆分数--利用母函数求解$\frac{1}{(1-x)\left(1-x^{2}\right)\left(1-x^{3}\right) \cdots}$
* 得到上界的估计（$p(n)<e^{\sqrt{\frac{20}{3} n}}$利用分析方法）



## Ferrrers图像与整数拆分

### 定义

对于无序的拆分方案，可以表示为$n=n_1+n_2+ \cdots +n_k，n_1 \geq n_2 \geq \cdots n_k \geq 1$

可以画出一个图像，第一行有$n_1$个格子，第二行有$n_2$个格子，一次类推，得到每行格子数非严格递减的方格图。

Ferrers图像有个很好的性质：

* 给定一个ferrers图像
* 沿对角线翻转，得到的是仍为一个ferrers图形
* 记为它的共轭（但是有可能是相同的）



共轭是自身的情况(自共轭图像）：

17=5+5+3+2+2

{% asset_img image-20200512085511246.png%}



### 整数分拆性质

把整数$n$拆分为最大数为k的拆分方法数，和把数$n$拆分为k个数的拆分方法数相同

把整数n拆分为最多为m个数的拆分方法数，和把数n拆分为数字最大为m的拆分方法数相同

【利用ferrers共轭可以构建一一对应】

把整数拆分成互不相同的若干个**奇数**的和的拆分数，和把n拆分成由**自共轭**的Ferrers图的拆分数相同

{% asset_img image-20200512085928972.png%}

正整数n拆分成**不超过k个数**的和的拆分数，等于将n+k拆分成**正好k个数**的拆分

【给原Ferrers图最上添加长为k的一行，得到变换】
