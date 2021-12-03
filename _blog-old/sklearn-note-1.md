---
title: sklearn翻译学习笔记(1) 梯度下降回归
mathjax: true
date: 2020-04-21 18:03:04
tags:
- Python
- Sklearn
categories:
- 学习
- Python
- Sklearn
---

翻译并学习sklearn梯度下降回归

原文文档https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.SGDRegressor.html

<!--more-->

# 梯度下降概念介绍

对于机器学习的线性模型，有两种解法，一种是最小二乘法（矩阵乘法计算），另一种是对代价函数进行梯度下降求最小值点。



# 随机梯度下降

## 函数定义

```python
class sklearn.linear_model.SGDRegressor(loss='squared_loss', penalty='l2', alpha=0.0001, l1_ratio=0.15, fit_intercept=True, max_iter=1000, tol=0.001, shuffle=True, verbose=0, epsilon=0.1, random_state=None, learning_rate='invscaling', eta0=0.01, power_t=0.25, early_stopping=False, validation_fraction=0.1, n_iter_no_change=5, warm_start=False, average=False)
```

## 简介

Linear model fitted by minimizing a regularized empirical loss with SGD

通过使用SGD最小化正则经验损失来拟合线性模型

SGD stands for **Stochastic Gradient Descent**: the gradient of the loss is estimated each sample at a time and the model is updated along the way with a decreasing strength schedule (aka learning rate).

SGD代表随机梯度下降：一次估计每个样本的损失梯度，更新模型的过程伴随“强度进度表”（即学习率）的降低。

【注：学习率逐步降低有助于SGD收敛】

The **regularizer** is a penalty added to the loss function that shrinks model parameters towards the zero vector using either the squared euclidean norm L2 or the absolute norm L1 or a combination of both (Elastic Net). *If the parameter update crosses the 0.0 value because of the regularizer, the update is truncated to 0.0 to allow for learning sparse models and achieve online feature selection.*

**正则化**是对损失函数的一种惩罚，它使用平方的欧几里德范数$L_2$，或绝对范数$L_1$，或两者的组合（弹性网），将模型参数向$\vec 0$收缩。

斜体那句比较复杂……

【正则化的思路在于认为参数比较小可以避免过拟合】

This implementation works with data represented as dense numpy arrays of floating point values for the features.

此实现适用于稠密的、元素为浮点值的numpy数组。

## 示例

```python
import numpy as np
from sklearn import linear_model
n_samples, n_features = 10, 5
rng = np.random.RandomState(0)# 设置随机数种子
y = rng.randn(n_samples)
X = rng.randn(n_samples, n_features) #随机生成的数据（也可以换成实际数据）
clf = linear_model.SGDRegressor(max_iter=1000, tol=1e-3)#类的实例
clf.fit(X, y)#拟合模型
---
print('系数：',clf.coef_,'截距：',clf.intercept_)
y_pred = clf.predict(X)#给定x预测y
print('数据的R2 score（不是损失，是R2）：',clf.score(X, y))
```

## 回归器的参数(常用部分)

### 损失

**loss损失函数：str, default=’squared_loss’**

可行的有：‘squared_loss’, ‘huber’, ‘epsilon_insensitive’, or ‘squared_epsilon_insensitive’

The ‘squared_loss’ refers to the ordinary least squares fit. 就是标准平方损失

‘huber’ modifies ‘squared_loss’ to focus less on getting outliers correct by switching from squared to linear loss past a distance of epsilon.超过某一距离$\epsilon $改为线性损失，从而减少outlier的干扰

 ‘epsilon_insensitive’ ignores errors less than epsilon and is linear past that; this is the loss function used in SVR（支持向量回归算法）.低于$\epsilon $的忽略，超过的是线性损失，应用于SVR算法

 ‘squared_epsilon_insensitive’ is the same but becomes squared loss past a tolerance of epsilon.

**epsilon损失函数配套的$\epsilon$：float, default=0.1**

### 惩罚（正则化）

**penalty惩罚函数:{‘l2’, ‘l1’, ‘elasticnet’}, default=’l2’**

The penalty (aka regularization term) to be used. Defaults to ‘l2’ which is the standard regularizer for linear SVM models. ‘l1’ and ‘elasticnet’ might bring sparsity to the model (feature selection) not achievable with ‘l2’.

默认惩罚是$L_2$，如果用弹性网或者$L_1 $，会使得参数具有稀疏性--比较多的参数为0

**l1_ratio弹性网配套：float, default=0.15**

The Elastic Net mixing parameter, with 0 <= l1_ratio <= 1. l1_ratio=0 corresponds to L2 penalty, l1_ratio=1 to L1.

**alpha正则化系数：float, default=0.0001**

Constant that multiplies the regularization term. Also used to compute learning_rate when set to ‘optimal’.

### 学习率

**learning_rate学习率变动方法：string, default=’invscaling’**

The learning rate schedule:

- ‘constant’:恒定

  $\eta = \eta_0$

- ‘optimal’:

  $\eta = \frac{1}{\alpha * (t + t_0)} $where t0 is chosen by a heuristic proposed by Leon Bottou.

- ‘invscaling’: [default]

  $\eta = \frac{\eta_0}{ t^ {power~t}}$

- ‘adaptive’:

  $\eta = \eta_0$ as long as the training keeps decreasing. Each time n_iter_no_change consecutive epochs fail to decrease the training loss by tol or fail to increase validation score by tol if early_stopping is True, the current learning rate is divided by 5.每次达到上述条件后学习率除5

**eta0：double, default=0.01**

The initial learning rate for the ‘constant’, ‘invscaling’ or ‘adaptive’ schedules. The default value is 0.01.

**power_t是optimal方法的参数：double, default=0.25**

### 计算

**max_iter最大迭代数：int, default=1000**

The maximum number of passes over the training data (aka epochs). It only impacts the behavior in the `fit` method, and not the [`partial_fit`](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.SGDRegressor.html#sklearn.linear_model.SGDRegressor.partial_fit) method.

只对fit方法生效

**tol阈值：loat, default=1e-3**

The stopping criterion. If it is not None, the iterations will stop when (loss > best_loss - tol) for `n_iter_no_change` consecutive epochs.

停止迭代的阈值

**random_state随机种子：nt, RandomState instance, default=None**

The seed of the pseudo random number generator to use when shuffling the data. If int, random_state is the seed used by the random number generator; If RandomState instance, random_state is the random number generator; If None, the random number generator is the RandomState instance used by `np.random`.

可以是int--数值种子；或者一个RandomState对象，用它产随机数；None则默认的numpy随机数