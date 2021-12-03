---
title: Python的itertools包学习
mathjax: false
date: 2020-06-15 20:16:19
tags:
- Python
categories:
- 学习
- Python
- 基础功能
---

Python的itertools包学习，包括常用的函数和应用

<!--more-->

# 排列permutations

注意函数名是复数的

```python
from itertools import permutations
```

有两个参数，第二个可以不写：

* `permutations(iterable[, r])`
* 第一个参数是一个可迭代对象
* 第二个参数是排列长度（默认是全排列）

函数的效果是根据输入的可迭代对象，得到所有的排列情况（**以可迭代对象的方式**）

```python
for one in permutations(['a', 'b', 'c']):
	print(one)
('a', 'b', 'c')
('a', 'c', 'b')
('b', 'a', 'c')
('b', 'c', 'a')
('c', 'a', 'b')
('c', 'b', 'a')
for one in permutations(['a', 'b', 'c'],2):
	print(one)
('a', 'b')
('a', 'c')
('b', 'a')
('b', 'c')
('c', 'a')
('c', 'b')
```



# 组合数combinations

注意函数名还是复数的

```python
from itertools import combinations
```

有两个参数，第二个可以不写：

* `combinations(iterable,r)`
* 第一个参数是一个可迭代对象
* 第二个参数是组合的长度（**必须有**，因为完全组合就一种）

函数的效果是根据输入的可迭代对象，得到所有的**r长**组合情况，输出按照顺序（**以可迭代对象的方式**）

输出的组合无序，对应的元组顺序是**按照输入数据的顺序**。

```python
for one in combinations(['先', '中', '后'],2):
	print(one)
('先', '中')
('先', '后')
('中', '后')
for one in combinations([2, 1, 3],2):
	print(one)
(2, 1)
(2, 3)
(1, 3)
```

