---
title: 机器学习的数学知识（1）--信息熵
mathjax: true
date: 2020-05-08 08:58:36
tags:
- 数学
- 机器学习
categories:
- 学习
- 数学
- 机器学习数学知识
---

信息熵相关知识

<!--more-->

# 概念

信息熵有很多用途，其中之一是对于样本数据纯度的一个度量方式。

其离散表达式为：
分类Y一共有$|Y|$个取值，各类样本的比例（概率）是$p_k$
$$
\operatorname{Ent}(D)=-\sum_{k=1}^{|\mathcal{Y}|} p_{k} \log _{2} p_{k}
$$

连续的表示则是：
$$
H(X) = -E[log(p(X))] = \int \cdots \int log(p(x_1,\cdots,x_k))p(x_1,\cdots,x_k)dx_1\cdots dx_k
$$

# 数学理论

如果$H(\alpha)$，是对离散型随机实验$\alpha$的一个度量，满足以下三条性质，则有确定的形式：

1. 连续性：$H(\alpha)=H\left(p_{1}, p_{2}, \cdots, p_{n}\right)$是对于$p_i$连续的
2. 对于等概率试验，H是关于n上升的函数
3. 一个试验分成相继的两个试验时，未分之前的H是分后的H的加权和（权为该试验涉及到的结果对应的概率值和）  

那么形态是确定的：
$$
H=-C \sum_{i=1}^{n} p_{i} \log p_{i}
$$
其中的C是一个正的常数（一般为1），对数可以以不同的数为底。

C=1，以二为底的情况下，称为比特【bit是信息量单位（但是bit不是香农发明的）】；C=1，以e为底，单位为奈特(Nat)



## 数学性质

* 非负性：信息熵是非负的，取得0值当前仅当有一个$p_i=1$【这意味着完全确定性】
* 等概率最大：在有n个结果的试验中，等概试验具有最大熵，其值为$log n $ 
* 对于独立的两个试验：$H(\alpha \beta)=H(\alpha)+H(\beta)$
* 不同信息熵可以换底：$H_{b}(P)=\left(\log _{b} a\right) H_{a}(P)$



# 联合熵与条件熵

信息熵可以用概率论的期望表达，因此也有相应的联合信息熵与条件信息熵

## 联合熵

对于多个随机变量，有：
$$
H(X, Y)=\sum_{x} \sum_{y} P(x, y)[-\log P(x, y)]
$$

$$
H\left(X_{1}, \ldots, X_{n}\right)=\sum_{x_{1}, \ldots, x_{n}}P\left(x_{1}, \ldots, x_{n}\right)\left[-\log P\left(x_{1}, \ldots, x_{n}\right)\right]
$$

如果有独立性，上述的联合熵可以转换为各自信息熵**相加**的形式；如果独立同分布，可以有$H\left(X_{1}, \ldots, X_{n}\right)=n H\left(X_{1}\right)$



##  条件熵

给定一个具体的Y取值，其信息熵如下：
$$
H(X | Y=y)=-\int p(x | y) \log p(x | y) \mathrm{d} x
$$
那么条件熵实际上是对于上述给定y的信息熵求一个期望：
$$
\begin{aligned}
H(X | Y) &= E[H(X | Y=y)] \\
&=-\int p(y) \int p(x | y) \log p(x | y) \mathrm{d} x \mathrm{d} y \\
&=-\iint p(x, y) \log p(x | y) \mathrm{d} x \mathrm{d} y
\end{aligned}
$$
最终所得的公式较为出乎意料：
$$
H(X|Y)=E[-logp(x|y)]
$$


## 条件和联合熵的关系（交互熵）

不等式关系：
$$
H(X | Y) \leq H(X)
$$
当且仅当XY独立时等号成立

由此引出交互熵的概念：
$$
I(X | Y) = I(X , Y)=H(X)-H(X | Y)
$$

注意到很重要的一点是交互熵是**对称的，且非负**

$$
H(X)-H(X | Y)=E[-\log {P(X)}+\log {P(X|Y)}] = E\log  \frac{P(X, Y)}{P(X) P(Y)}  \geq 0
$$

实际上经常用的一个概念--信息增益，就是可以认为是一种交互熵：

a是一种划分的方法，信息增益可以转换为交互熵的形式
$$
Gain(D,a)=Ent(D)- \sum_{v=1}^V \frac{|D^v|}{|D|}Ent(D^v)
$$

$$
Gain(D,a) = H(D) - E[H(D|a=a^v)] = H(D) - H(D|a)
$$

