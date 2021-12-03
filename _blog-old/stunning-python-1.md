---
title: Python语法妙处(1)
mathjax: false
date: 2019-06-27 14:38:59
tags:
- Python
categories:
- 学习
- Python
- 基础功能
---

每一门语言都有着自己的魔法，而Python也不例外，今天我们就来看看Python的这个符号吧——点的妙用。

<!--more-->



众所周知的是Python使用`.`来连接对象和方法（C++也是如此）

如`myClass.function()`



然而……这个是什么情况呢？

```python
import turtle
myPen = turtle.Pen()#打开画布
myPen.circle(5)#效果是笔画一个半径5px的圆
```

通过`import`声明的内容引入的是整个包

第二行实际是`turtle.py`文件中的类`Pen`的初始化，第三行的`myPen`才是调用对象的某个方法。



类似的问题更进一步就是一个关于包和类同名的糟糕情况

```python
import datetime
print(datetime.datetime.now())
#2019-06-27 15:01:09.853174
from datetime import datetime
print(datetime.now())
#2019-06-27 15:01:09.854122第二次会晚一点，但是等效
```

`datetime`包里面有个`datetime`类，于是就有了这个奇妙的情况

