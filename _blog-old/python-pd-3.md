---
title: pandas学习笔记（3）
mathjax: false
date: 2020-12-06 11:47:30
tags:
- Python
- Pandas
categories:
- 学习
- Python
---

pandas学习笔记第三节，如果不使用`[]`我们要如何操作数据表。

pandas有些操作会反复使用`[]`来进行操作，但是写起来复杂而且容易让初学者看不懂/写错，但是除了这种经典的方法其实还有其他解决办法。

<!--more-->

内容先记下来，具体文档细节有待细化

# 取一列

如果取出一列，直接用`df['colname']`就行，但是实际上pandas还有另外一种方式，就是直接取df对象的属性，`df.colname`如果本身不是属性那么就可以等效于`[]`的取法。

这个的实现我还没搞懂理论依据



# 赋值

经典操作是

```python
df['newcol'] = value
```

但是也可以使用`assign`函数


```python
df.assign(newcol = value)
```

而且这里不仅支持外部变量，也可以调用df本身的列

https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.assign.html

# 通用计算

如果计算一个内容涉及df多列会有点麻烦，但是利用`eval`函数可以比较简洁的进行求值。

```python
df.eval('y=2*x1+3*x2')
```

https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.eval.html

# 执行轻微复杂的查询



如果执行复杂的查询，用apply自己编写一个函数就可以，但是如果是多条件筛选这种，其实可以用SQL式的思路来实现。



```python 
df.query('A==1 and B==2')
```



https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.query.html