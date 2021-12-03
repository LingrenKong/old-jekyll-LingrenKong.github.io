---
title: sklearn翻译学习笔记(2) 数据集-分类数据
mathjax: true
date: 2020-04-25 10:38:22
tags:
- Python
- Sklearn
categories:
- 学习
- Python
- Sklearn
- sklearn.datasets
---

翻译并学习sklearn的数据生成功能（blob和classification），另外自己搓了一个根据协方差生成高斯分布的函数

<!--more-->

# 简介

[sklearn.datasets](https://scikit-learn.org/stable/modules/classes.html#module-sklearn.datasets)是sklearn的一个重要部分，具有数据加载功能（loader）和随机数据生成功能（Samples generator）两个部分。

本文翻译探究的是[7.4.1.1. Single label](https://scikit-learn.org/stable/datasets/index.html#sample-generators)单标签随机数据的两个常用功能--[`make_blobs`](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_blobs.html#sklearn.datasets.make_blobs) 和[`make_classification`](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.html#sklearn.datasets.make_classification)



# 特点简介

Both **make_blobs** and **make_classification** create multiclass datasets by allocating each class one or more normally-distributed clusters of points. **make_blobs** provides greater control regarding the centers and standard deviations of each cluster, and is used to demonstrate clustering. **make_classification** specialises in introducing noise by way of: correlated, redundant and uninformative features; multiple Gaussian clusters per class; and linear transformations of the feature space.

两者都通过为每个类别分配一个或多个点的正态分布簇来创建多类别数据集。make_blobs提供有关每个聚类的中心和标准差的更好控制，并用于演示聚类。 make_classification注重通过以下方式引入噪声：相关，冗余和非信息性特征；每个类别有多个高斯簇；以及特征空间的线性变换。

概括来说就是blob的数据比较干净，没有太多参数，生成的数据能很明显的用聚类算法分开，而classification生成的数据重点在于制造各种噪声来进行测试分类能力。



## blobs

```python
sklearn.datasets.make_blobs(
    n_samples=100, #int or array-like：
    #如果整数就是总数据量给出，各类均分；如果数组，就是各类分别制定数据量
    n_features=2, #样本特征数
    centers=None, 
    #int or array of shape[n_centers, n_features]
    #整数就是有几个cluster的中心；数组则是制定各个中心点
    cluster_std=1.0, #标准差
    center_box=(-10.0, 10.0),#(min, max)随机数生成范围的上下界
    shuffle=True, #是否将数据打乱顺序
    random_state=None# 整数seed或者np的随机数生成器
)
```

一个应用实例：

```python
from sklearn.datasets import make_blobs
import matplotlib.pyplot as plt
X, y = make_blobs(n_samples=200, centers=3, n_features=2,
                  random_state=2333)
plt.scatter(X[:,0],X[:,1],c=y)
plt.show()
```

{% asset_img blobs.png %}



# classification

```python
sklearn.datasets.make_classification(
    n_samples=100, #样本量
    n_features=20, #数据特征数
    n_informative=2, #有效特征数
    n_redundant=2, #冗余特征数
    n_repeated=0, #重复特征数
    n_classes=2, #标签类别
    n_clusters_per_class=2, #每类有几簇
    weights=None, # (n_classes,)/(n_classes - 1,)每个类别数据的比例，none就等分
    flip_y=0.01, #被随机分类的样本比例，越大噪声越严重
    class_sep=1.0, #各类顶点中心的距离倍数，越大超立方越大，分类方便
    hypercube=True, #簇的中心安排在超立方/随机多面体顶点
    shift=0.0, #数据生成后进行平移
    scale=1.0, #数据生成后进行比例放缩
    shuffle=True, #同blob
    random_state=None)
```

比较重要的是四个参数：`n_features,n_informative,n_redundant,n_repeated`

总特征数=有信息特征+冗余特征+重复特征+随机特征（由减法得到）

informative：在这些维度的子空间上面，各类都是服从多维高斯分布的（先从标准正态抽独立样本，然后随机线性组合）

redundant：这些数据是有效数据的随机线性组合

repeated：有效和冗余数据的复制

剩下的特征是完全随机的。



注：这个算法被用来生成MADELON，是一个人造的数据集用于特征选择比赛。

所以这个生成的数据会比较复杂，不能简单分开，可视化也不好弄。



# 手动生成高斯分布

注意到blob的数据只能指定标准差，数据各个维度独立同分布，所以我们有时候可能需要一些有协方差的多元正态数据，那么就需要手动操作。



基于np的内置随机生成，我写了一个这样的函数：

```python
def blob_plus(mean, cov, n_samples_foreach=100, label=None):
    """

    Parameters
    ----------
    mean:k*d数组，k为类别数，d为数据维数
    cov:k*d*d数组，k个协方差矩阵
    label:各个类别的标签，默认0~k-1

    Returns
    -------

    """
    import numpy as np
    k = mean.shape[0]
    d = mean.shape[1]
    if not label:
        label = list(range(k))
    X = np.empty((0,d))
    y = np.empty(0)
    for i in range(k):
        X = np.append(X,np.random.multivariate_normal(mean[i,:],cov[i,:,:],n_samples_foreach),axis=0)
        y = np.append(y,i*np.ones(n_samples_foreach),axis=0)
    return X,y
```

测试效果：

```python
mean = np.array([[0, 0],[10, 5],[-5, -10]])
cov = np.array([[[1, 0], [0, 1]],[[1, 0.5], [0.5, 1]],[[3, 2], [2, 4]]])
X,y = blob_plus(mean,cov)

import matplotlib.pyplot as plt
plt.scatter(X[:,0],X[:,1],c=y)
plt.show()
```

{% asset_img myblob.png %}