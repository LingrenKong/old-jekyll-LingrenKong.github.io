---
title: 图神经网络学习笔记（1）--导论和数学基础
mathjax: true
date: 2020-05-02 13:53:19
tags:
- GNN
- 数学
categories:
- 学习
- 机器学习
- GNN
---

图神经网络学习笔记（参考书是Introduction to Graph Neuron Networks）

<!--more-->

# Introduction导论

图是一种非欧几里得结构数据（经典的非欧几里得结构是图和流形）

在机器学习中，有时候会用到对于图的机器学习，这种情况下需要特殊的方法。

GNN产生的一个激励来源是CNN（卷积神经网络），卷积神经网络的特点是处理邻接、等权重、多层数据，而图的问题也是关注邻接，简化计算可以等权重假设，有多层关系。然而CNN处理的是欧几里得结构的数据（比如2维的图片或者1维的文本），所以需要进行泛化。

另一个对于GNN的激励来自于Network Embedding，传统的方式是手动的特征工程，而后来产生了更多的方法，但是都有两个缺点：参数太多，不能泛化。



# Basics of Math and Graph

## 线性代数

### 基本概念

标量scalar：数值

向量vector：一列有序数据（一般默认是列向量）

范数norm：
$$
\| \mathbf{x} \| _{p}=\left(\sum_{i=1}^{n}\left|x_{i}\right|^{p}\right)^{\frac{1}{p}}
$$
其中p取1就是绝对偏差，取2是欧几里得空间的向量长

$$
\|\mathbf{x}\|_{\infty}=\max _{i}\left|x_{i}\right|
$$

$L_\infty$又叫做max norm

矩阵的行列式determinant：

$$
\operatorname{det}(\mathbf{A})=\sum_{k_{1} k_{2}-k_{m}}(-1)^{\tau\left(k_{1} k_{2}-k_{n}\right)} a_{1 k_{1}} a_{\nu k_{2}} \cdots a_{n k_{n}}
$$

逆序数：inversionnumber  ；逆序：inverted sequence 

Hadamard product  另一种矩阵乘法，对应位置相乘

$$
\mathbf{C}_{i j}=\mathbf{A}_{i j} \mathbf{B}_{i j}
$$

## 特征值分解

特征值eigen value与特征向量eigen vector：

$$
\mathbf{A} \mathbf{v}=\lambda \mathbf{v}
$$

### 特征值分解

利用特征值，可以有特征值分解（又称为对角化diagonalization）;V是一个可逆矩阵，因为他是原矩阵的n个线性无关特征向量按列组成的。

$$
\mathbf{A}\left[\begin{array}{llll}
v_{1} & v_{2} & \dots & v_{n}
\end{array}\right]=\left[\begin{array}{llll}
v_{1} & v_{2} & \dots & v_{n}
\end{array}\right]\left[\begin{array}{cccc}
\lambda_{1} & & & \\
& \lambda_{2} & & \\
& & \ddots & \\
& & & \lambda_{n}
\end{array}\right]
$$

$$
\mathbf{A}=\mathbf{V} \operatorname{diag}(\mathbf{\lambda}) \mathbf{V}^{-1}
$$

不是所有矩阵都可以对角化，但是实对称矩阵是都可以的。

### SVD奇异值分解

对角化不是对全部矩阵成立的，因此可以有更弱但是更加泛化的操作。

给定矩阵$\mathbf A$,如果$\mathbf {A^TA}$的rank（秩）是r，那么有：

$$
\mathbf{A}=U \Sigma V^{T}
$$

其中的UV都是正交阵，实际上U的每一列都是$\mathbf {AA^T}$的特征向量，V的每一列都是$\mathbf {A^TA}$的特征向量。

中间的是一个不一定是方阵的矩阵，对角元是特征值（如果有）的平方根

$$
\Sigma_{i j}=\left\{\begin{array}{ll}
\sigma_{i} & \text { if } i=j \leq r \\
0 & \text { otherwise }
\end{array}\right.
$$


## 图论

### 图的代数表示

Adjacency matrix邻接矩阵: 对于简单图$G=(V, E)$ （有$n$顶点）可以使用邻接矩阵$A \in \mathbb{R}^{n \times n}$,描述

$$
A_{i j}=\left\{\begin{array}{ll}
1 & \text { if }\left\{v_{i}, v_{j}\right\} \in E \text { and } i \neq j \\
0 & \text { otherwise }
\end{array}\right.
$$

无向图的邻接矩阵是对称的
Degree matrix度矩阵:对于图（可以不是简单图）$G=(V, E)$ （有$n$顶点）度矩阵是一个对角阵$D \in \mathbb{R}^{n \times n}$ 

$$
D_{ii}=d\left(v_{i}\right)
$$

Laplacian matrix拉普拉斯矩阵: 对于**简单**图$G=(V, E)$ （有$n$顶点），如果认为所有边都是**无向**的，则有拉普拉斯矩阵$L \in \mathbb{R}^{n \times n}$ 

$$
L=D-A
$$

元素如下：

$$
L_{i j}=\left\{\begin{array}{ll}
d\left(v_{i}\right) & \text { if } i=j \\
-1 & \text { if }\left\{v_{i}, v_{j}\right\} \in E \text { and } i \neq j \\
0 & \text { otherwice }
\end{array}\right.
$$

由于是简单图，所以邻接矩阵没有对角元素。

由于是无向图，所以有边的位置是-1

性质：

* 对称、半正定
* 特征值中0出现的次数就是图连通分支个数
* 最小特征值为0（因为每一行的和都是0）
* 最小非零特征值是图的代数连通度

Symmetric normalized Laplacian正则化之后的拉普拉斯矩阵:

$$
\begin{aligned}
L^{sym} &=D^{-1/2} L D^{-1/2} \\
&=I-D^{-\frac{1}{2}} A D^{-\frac{1}{2}}
\end{aligned}
$$

元素如下

$$
L_{i j}^{sym}=\left\{\begin{array}{ll}
1 & \text { if } i=j \text { and } d\left(v_{i}\right) \neq 0 \\
-\frac{1}{\sqrt{d\left(v_{i}\right) d\left(v_{j}\right)}} & \text { if }\left\{v_{i}, v_{j}\right\} \in E \text { and } i \neq j \\
0 & \text { otherwise. }
\end{array}\right.
$$

Random walk normalized Laplacian:

$$
L^{r w}=D^{-1} L=I-D^{-1} A
$$

元素如下

$$
L_{i j}^{rw}=\left\{\begin{array}{ll}
1 & \text { if } i=j \text { and } d\left(v_{i}\right) \neq 0 \\
-\frac{1}{d\left(r_{i}\right)} & \text { if }\left\{v_{i}, v_{j}\right\} \in E \text { and } i \neq j \\
0 & \text { otherwise }
\end{array}\right.
$$

Incidence matrix 关联矩阵：

设图G有n个顶点m条边，则矩阵是$\mathbb R^{m\times n}$的

对于有向图：

$$
M_{i j}=\left\{\begin{array}{ll}
1 & \text { if } \exists k \text { s.t. } e_{j}=\left\{v_{i}, v_{k}\right\} \\
-1 & \text { if } \exists k \text { s.t. } e_{j}=\left\{v_{k}, v_{i}\right\} \\
0 & \text { otherwise. }
\end{array}\right.
$$

对于无向图：

$$
M_{i j}=\left\{\begin{array}{ll}
1 & \text { if } \exists k \text { s.t. } e_{j}=\left\{v_{i}, v_{k}\right\} \\
0 & \text { otherwise }
\end{array}\right.
$$
