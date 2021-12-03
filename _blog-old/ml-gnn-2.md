---
title: 图神经网络学习笔记（2）--第四章Vanilla Graph Neural Networks
mathjax: true
date: 2020-05-16 15:17:34
tags:
- GNN
- 数学
categories:
- 学习
- 机器学习
- GNN
---

第四章Vanilla Graph Neural Networks

<!--more-->

# Introduction引入

vanilla是“香草”的意思，这里似乎是个魔改术语，好像指的是最初的/没有扩展的版本。

GNN的目的在于找到一种embedding--$h_v \in \mathbb{R}^s$，来编码每个顶点所邻接的数据性质，而后就可以基于$h_v$来得到一些输出$o_v$比如预测顶点的分类

最基本的情况下，每个顶点有自己的特征（feature），边可能有信息也可能没有，图是同质的无向图（undirected homogeneous graph ）

每个顶点的边集合和邻接点集合记为$co[v],ne[v]$

# Model模型

## 概念与理论

模型有一个参数方程（parametric function）$f$叫做**local** transition function看，对所有顶点应用，还有一个方程$g$用来得到输出，叫做**local** output function。

公式：
$$
\begin{array}{c}
\mathbf{h}_{v}=f\left(\mathbf{x}_{v}, \mathbf{x}_{c o[v]}, \mathbf{h}_{n e[v]}, \mathbf{x}_{n e[v]}\right) \\
\mathbf{o}_{v}=g\left(\mathbf{h}_{v}, \mathbf{x}_{v}\right)
\end{array}
$$
之所以是参数方程，是因为右侧有隐藏的信息（$h$），x是显式的输入特征，但是h不是。

 

累加得到相应的全局：
$$
\begin{array}{l}
\mathbf{H}=F(\mathbf{H}, \mathbf{X}) \\
\mathbf{O}=G\left(\mathbf{H}, \mathbf{X}_{N}\right)
\end{array}
$$
$H$是所有的state（隐藏状态），$O$是所有的输出，$X$是所有输入顶点特征，$X_N$是所有邻点的特征。

基于$F$是一个**压缩映射**（contraction map ）的假设下，H的解作为方程的不动点（fixed point ），是唯一的。【**完备度量空间上的压缩映射具有唯一的不动点**】

于是有相应的迭代求解法：
$$
\mathbf{H}^{t+1}=F\left(\mathbf{H}^{t}, \mathbf{X}\right)
$$

## 应用

确定了式子之后，下一步是确定如何去学习$f,g$的参数

在有监督学习（可以半监督）情况下，定义预测目标target为$t_i$，可以定义损失函数：
$$
\text { loss }=\sum_{i=1}^{p}\left(\mathbf{t}_{i}-\mathbf{o}_{i}\right)
$$
其中p是有标记的顶点个数（所以可以是半监督学习）

对于参数，采用梯度下降的方法来更新【下面是一次参数更新】：

* 运行迭代$T$，使得方程近似达到不动点
* 计算参数$W$的各个梯度
* 按照最后一次的梯度更新$W$



# Limitations局限

有4个局限性：

1. 计算不便，每次要$T$个迭代才能找到近似不动点
2. 每一波T层迭代的参数是一样的，而一般的神经网络都是多层有不同参数
3. 忽略了边的信息
4. T如果比较大，不动点情况下顶点的值会比较平滑，不具有区分度，而我们所需要的是顶点的表征而不是图的整体表征

Gated Graph Neural Network (GGNN)  可以解决第一个问题

Relational GCN (R-GCN)  可以解决有向图的处理

总之这个是最简单的GNN模型