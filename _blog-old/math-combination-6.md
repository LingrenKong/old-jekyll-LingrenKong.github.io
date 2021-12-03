---
title: 组合数学知识（6）--容斥原理
mathjax: true
date: 2020-05-19 09:04:15
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

容斥原理（课堂笔记等）

<!--more-->

# 引入与概念

P.S.名称的解释

* 公理：默认成立的结论（数学要建立公理化体系），不同的公理带来不同的体系（欧氏几何VS非欧）
* 定理：根据公理推导出的
* 定律：对现实状态的一种刻画（万有引力定律、大数定律的观察法）
* 原理：大家都认为正确的，必须遵循的基本法则（如果改变这些，会违背常识）

原理和公理类似，但是一般没有人更改原理的设定，因为这样得到的内容反常识（比如加法原理）



两个集合的容斥原理 ：
$$
|\boldsymbol{A} \cup \boldsymbol{B}|=|\boldsymbol{A}|+|\boldsymbol{B}|-|\boldsymbol{A} \cap \boldsymbol{B}|
$$
多个集合
$$
\begin{array}{l}
\left|A_{1} \cup A_{2} \cup \cdots \cup A_{n}\right|&=\sum_{i=1}^{n}\left|A_{i}\right|-\sum_{i=1}^{n} \sum_{j>i}\left|A_{i} \cap A_{j}\right| \\
&+\sum_{i=1}^{n} \sum_{j=i} \sum_{k>j}\left|A_{i} \cap A_{j} \cap A_{k}\right|-\cdots \\
&+(-1)^{n-1}\left|A_{1} \cap A_{2} \cap \cdots \cap A_{n}\right|
\end{array}
$$
也可以通过变形得到余集形式：
$$
\left|A_{1} \cup A_{2} \cup \cdots \cup A_{n}\right|=N-\overline{| A_{1}} \cap \overline{A_{2}} \cap \cdots \cap \overline{A_{n}} |
$$

# 应用



### 整除问题

整数的整除问题是比较经典的情景，求1~n中可以被$i$整除的数：

* $A_i$表示可以被i整除的--$\left| A_i\right| = \lfloor \frac{n}{i}\rfloor$
* $A_{i,j}$表示可以被i和j同时整除的--$\left| A_{i,j}\right| = \lfloor \frac{n}{[i,j]}\rfloor$ 注意不是$ij$直接乘，而是$ij$的最小公倍数



### 无空盒情况



### 夫妻围坐问题2

n对夫妻围坐在一圆桌边，圆桌边有2n个座位， 则满足**男女相间**， **夫妻不相邻**的入座方法数为 
$$
T(n)=(n-1) ! \sum_{k=0}^{n}(-1)^{k} \frac{2 n}{2 n-k} C(2 n-k, k)(n-k) ! 
$$
【如果座位有编号，就乘$2n$，因为无序对应$2n$个不同起点的情况】

证明：

* 首先女士间隔入座：$(n-1)!$个方法（环形排列数）
* 按照顺序称这些女士为1-n号，按照夫妻关系对男生进行相同标号
* 然后设男宾有效入座方法为$U_{n}$
* 用$A_{2k-1}$表示k男士在夫人左侧，$A_{2k}$表示k男在夫人右侧--这都是无效做法，
* 那么$U_{n}=\left|\bigcap_{i=1}^{2 n} \overline{A_{i}}\right|$，且$A_{2k-1}\cap A_{2k}=\phi$，一个人不能分身，$A_{2k+1}\cap A_{2k}=\phi$两个人不能在同一位置 ，综合即$A_{i1}∩A_{i2}∩ \cdots ∩A_{ik}=\phi$，如果有角标相邻；否则$\left|A_{i_{1}} \cap A_{i_{2}} \cap \cdots \cap A_{i_{k}}\right|=(n-k) !$
* 有效的交事件可以表示为--从(1,2,…,2n,1)中取k个， 两两不相邻 ，并且不能取两个1
  * n中取k不相邻：$C(n-k,k)$
  * 现在是2n+1取k个，减掉从2~2n中选取k-2个（两个1情况）
  * $\frac{2 n}{2 n-k} C(2 n-k, k)$



### 完全错排&相对错排问题

完全错排问题可以用递推关系+指数型母函数：$D_{n}=n !\left(1-\frac{1}{1 !}+\frac{1}{2 !}-\frac{1}{3 !}+\cdots+(-1)^{n} \frac{1}{n !}\right)$

但是用容斥原理比较容易证明：

* $A_j$表示排列12…n中使j位置上的元素恰好是j 



相对错排条件更为复杂，但是仍然可以用容斥原理：

【例】每个同学要求第二天自己面前的不是昨天的人--不存在$i,i+1$在序列里面

将**上面的限制条件出现作为事件**，那么相对错排数就是事件补集的交（所以容斥原理更加灵活，可以设不同的$A_i$）



### 欧拉函数

$\phi(n)$表示小于n且与n互质的正整数的个数
$$
\boldsymbol{n}=\boldsymbol{p}_{1}^{a_{1}} \boldsymbol{p}_{2}^{a_{2}} \cdots \boldsymbol{p}_{k}^{a_{k}}
$$
令$A_i$表示N={1,2, …,n}中能被$p_i$整除的数的集合，这个有比较好的性质：

* $\left|A_{i}\right|=n / p_{i}$
* $\left|A_{i} \cap A_{j}\right|=\frac{n}{p_{i} p_{j}}$
* 因为互质所以集合的元素数比较好算

最终得到
$$
\phi(n)=n\left(1-\frac{1}{p_{1}}\right)\left(1-\frac{1}{p_{2}}\right) \cdots\left(1-\frac{1}{p_{k}}\right)
$$

