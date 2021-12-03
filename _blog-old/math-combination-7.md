---
title: 组合数学（7）--Stirling数
mathjax: true
date: 2020-05-26 07:59:13
tags:
- 组合数学
categories:
- 学习
- 数学
- 组合数学
---

Stirling数

<!--more-->



## 组合问题利用容斥原理解

第二类Stirling数：把n个**有区别的球**放到k个**有区别的盒**子中, 要求**无空盒**  
$$
f(n, k)=k ! \mathrm{S}(n, k)
$$
利用容斥原理可以求$f(n,k)$：

以X记所有无约束条件的放球方法，记$A_i$为第i盒空的放法全体
$$
f(m, n)=\left|\bigcap_{i=1}^{m} \bar{A}_{i}\right|=|X|-\sum_{i=1}^{m}\left|A_{i}\right|+\sum\left|A_{i_{1}} \cap A_{i_{2}}\right| 
-\sum\left|A_{i_{1}} \cap A_{i_{2}} \cap A_{i_{3}}\right|+\cdots+(-1)^{m}\left|A_{1} \cap \cdots \cap A_{m}\right|
$$
