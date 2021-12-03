---
title: Python语法妙处（4）
mathjax: false
date: 2020-07-17 21:00:05
tags:
- Python
categories:
- 学习
- Python
- 基础功能
---

关于字符串和列表之间的相互转换操作

<!--more-->

# 从字符串到列表

最为朴素的是直接`list()`进行转换，其实际意义在于python字符串也是可迭代对象，因此按照迭代方式转换成列表就是逐个单字符元素的列表：

```python
>>> mystr = "Hellow!"
>>> list(mystr)
['H', 'e', 'l', 'l', 'o', 'w', '!']

>>> for i in mystr:
...     print(i)
...
H
e
l
l
o
w
!
```

而Python还有一个比较简洁又好用的功能，就是字符串类的`split()`方法：

* 默认分隔是使用空格
* 也可以指定其他分隔符号
* 效果是按照分隔符来得到原字符串切分后元素构成的列表

```python
>>> space = "a b c"
>>> space.split()
['a', 'b', 'c']

>>> csv = "split,by,comma"
>>> csv.split(",")
['split', 'by', 'comma']
```



# 从列表到字符串

从列表能得到字符串是很合情合理的，但是会稍微复杂一些

虽然`str`函数可以把其他数据转换为字符串，但是这个字符串是和print效果一样的那个字符串，所以不能把列表拼回去

```python
>>> mylist = ['H', 'e', 'l', 'l', 'o', 'w', '!']
>>> str(mylist)
"['H', 'e', 'l', 'l', 'o', 'w', '!']"
```

与`split`相对的是另一个方法`join`，比较奇怪的地方是他的语法还是属于字符串的：

`str.join(sequence)`

* 给一个字符串`str`作为分隔符，如果是空串就是紧密连接
* `sequence`是序列类的数据，最典型的是列表，元组等也可以

```python
>>> "".join(mylist)
'Hellow!'
>>> "~".join(mylist)
'H~e~l~l~o~w~!'
```

