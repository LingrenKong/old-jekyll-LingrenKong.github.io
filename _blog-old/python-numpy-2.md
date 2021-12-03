---
title: Python numpy学习笔记（2）--数据变形
mathjax: false
date: 2020-08-06 09:44:05
tags:
- Python
- Numpy
categories:
- 学习
- Python
- Numpy
---

numpy数据变形相关功能整理

<!--more-->

# np.squeeze

https://numpy.org/doc/stable/reference/generated/numpy.squeeze.html

不指定axis会自动删除所有1shape，而指定axis则只删除对应的轴（如果不是1会报错）

```python
x = np.array([[[0], [1], [2]]])
>>> x.shape
(1, 3, 1)
>>> np.squeeze(x).shape
(3,)
>>> np.squeeze(x, axis=0).shape
(3, 1)
>>> np.squeeze(x, axis=1).shape
Traceback (most recent call last):
...
ValueError: cannot select an axis to squeeze out which has size not equal to one
>>> np.squeeze(x, axis=2).shape
(1, 3)
>>> x = np.array([[1234]])
>>> x.shape
(1, 1)
>>> np.squeeze(x)
array(1234)  # 0d array
>>> np.squeeze(x).shape
()
>>> np.squeeze(x)[()]
1234
```



【应用】对于数组内的数据，即使运用索引得到的也可能不是标量，这个函数可以删除shape为1的维度来转化数据的维度，因为如果用向量可能无法显示输出，或者维度不对

```python
import numpy as np
X=np.array([[1]])
print(X)
print(np.squeeze(X))
#----
[[1]]
1
```

