---
title: matplotlib学习（1）--常用速查表
mathjax: false
date: 2020-06-06 14:29:05
tags:
- 可视化
categories:
- 学习
- Python
- 可视化
- matplotlib
---

matplotlib常用速查表

<!--more-->

# 设定

```python
import matplotlib.pyplot as plt
```



## 中文支持

字符是UTF8的，不会出现不能理解中文的现象，但是字体不能显示汉字，所以调整字体为雅黑即可：

```python
plt.rcParams['font.sans-serif']=['SimHei'] 
```



## 三维对象

```python
from mpl_toolkits.mplot3d import Axes3D
```

有了这句才可以创建三维的图



# 创建对象



## 子图

```python
plt.subplot(nrows, ncols, index, **kwargs)
```

三个数字是行、列、索引**（从1开始）**



# 图例相关

legend：图例

xlabel：轴标签

xlim：轴的数值限制