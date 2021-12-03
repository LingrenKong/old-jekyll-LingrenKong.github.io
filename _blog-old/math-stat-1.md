---
title: 数理统计（1）--EM算法
mathjax: true
date: 2020-05-02 13:47:10
tags:
- 数理统计
categories:
- 学习
- 数学
- 数理统计
---

EM算法与极大似然估计MLE

<!--more-->

# EM算法

E：expectation；M：maximizing

应用场景为：存在数据缺失/不完全数据；或者人为构建一个相对于当前数据的“完全数据”

## 示例：

一个离散的分布：四种情况的概率如下，参数为$\theta$

$$
\frac{1}{2}-\frac{\theta}{4}, \frac{1-\theta}{4}, \frac{1+ \theta}{4}, \frac{\theta}{4} \quad \theta \in [0,1]
$$


完全数据：



## 算法

首先设定一个初始值$\theta_0$

第一步（E步）：

在已知观察数据$y$和第i步估计值$\theta_i$的情况下，求基于完全数据对数似然函数的条件期望$Q[\theta|y,\theta_i] = E[\theta|y,z]$

第二步（M步）：

求$Q[\theta|y,\theta_i]$关于$\theta$的最大值，记录并对$\theta$进行更新
$$
\theta_{(i+1)} = argmax_\theta Q[\theta|y,\theta_i]
$$
两步骤反复操作进行迭代直到收敛

【有些情况下存在迭代公式，比如例题】



## 特性

由于EM每次都做最大化，所以似然函数是递增的$L(\theta_{i+1},y)\geq L(\theta_{i},y)$，这保证每次迭代都会更优化

缺陷是只能保证局部最优，有可能因为初始值而不能达到全局最优