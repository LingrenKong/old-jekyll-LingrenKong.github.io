---
title: pytorch学习笔记--总览
mathjax: false
date: 2020-08-25 10:14:06
tags:
categories:
- 学习
- Python
- Pytorch
---

pytorch学习的总览

<!--more-->

# 梳理

- {% post_link torch-1 对于autograd的理解%}



# 基本知识

torch的一些主要用到的包：

| 包                  | 内容                                           |
| ------------------- | ---------------------------------------------- |
| torch               | 顶层，以及Tensor                               |
| torch.nn            | 神经网络相关的Module和类                       |
| torch.autograd      | 支持求导的子包（其实不一定显式调用）           |
| torch.nn.functional | 常用损失函数、卷积等                           |
| torch.optim         | 优化方法如adam和SGD                            |
| torch.utils         | 数据集和数据加载函数                           |
| torchvision         | 几个常用视觉数据集，流行的模型，常用的图像操作 |

一些概念：

`tensor`是对于标量、向量、矩阵的泛化；类似的是`ndarray`对于`number、array、matrix`的泛化--这样就可以用维度统一起来了

`Rank`在张量这里指的是数据的维度数目。`axis`是轴,`shape`得到的是形状元组（虽然不是返回元组，但支持所有元组操作）,`reshape`是一个比较有用的函数（但是文档讲了的是`.view()`功能）