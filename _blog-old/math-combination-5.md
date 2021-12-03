---
title: 组合数学知识（5）--差分表
mathjax: true
date: 2020-05-19 08:06:02
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

差分表

（组合数学课堂笔记等）

<!--more-->

# 差分表概念

表有点类似杨辉三角，但是做的减法；有点类似函数的导数离散情况

假定$P(x)$是非负整数集$N_0$上的函数（其实x一般是用n表示）。用下列方式得到一个数表称为$P(x)$的差分表  

第一行：$P(x),x=0,1,\cdots$

第二行：$\Delta \mathbf{P}(x)=\mathbf{P}(x+1)-P(x), x=0,1,2, \ldots$

第k行：$\begin{array}{l}
\Delta^{k} \mathbf{P}(x)=\Delta^{k-1} \mathbf{P}(x+1)-\Delta^{k-1} \mathbf{P}(x) ,
\mathbf{x}=\mathbf{0}, \mathbf{1}, \mathbf{2}, \ldots
\end{array}$



# 差分表的特点：

每一行的元素是它上一行的右肩-左肩

 如果$P(x)=a_nx_n+a_{n-1}x_{n-1}+…+a_1x+a_0$, 其中$a_n≠0$, 则$P(x)$的$n+1$阶差分恒为0  

每取一次差分, **非**常数多项式次数就降低一次, 而常数差分恒为0  

【最大特点】：差分表左侧第一个斜列可以决定整个表

实际作用：可以用斜列来表示多项式（因为从$b_{n-1}$开始，多项式的差分表就为0了）。

$\mathbf{P}(x)=\mathbf{b}_{0} \mathbf{C}(x, 0)+\mathbf{b}_{1} \mathbf{C}(x, 1)+\ldots+\mathbf{b}_{n} \mathbf{C}(x, \mathbf{n})$



这个公式可以用来求$1^n+\cdots+m^n$的数值

* 先求差分表，写左侧斜列直到0
* 带入公式（公式见下，利用组合数加法求出）

$$
\begin{aligned}
\sum_{t=0}^{m} \boldsymbol{P}(\boldsymbol{t}) &=\boldsymbol{b}_{0}\left(\begin{array}{c}
\boldsymbol{m}+\mathbf{1} \\
\mathbf{1}
\end{array}\right)+\boldsymbol{b}_{1}\left(\begin{array}{c}
\boldsymbol{m}+\mathbf{1} \\
\mathbf{2}
\end{array}\right) 
+\boldsymbol{b}_{2}\left(\begin{array}{c}
\boldsymbol{m}+\mathbf{1} \\
\mathbf{3}
\end{array}\right)+\cdots+\boldsymbol{b}_{n}\left(\begin{array}{c}
\boldsymbol{m}+\mathbf{1} \\
\boldsymbol{n}+\mathbf{1}
\end{array}\right)
\end{aligned}
$$



比如平方和公式：$f(n)=\frac{n(n+1)(2 n+1)}{6}$

