---
title: python时间功能学习笔记
mathjax: false
date: 2020-04-04 08:58:50
tags:
- Python
categories:
- 学习
- Python
---

关于time和datetime两个包的学习笔记

<!--more-->

# 概述

python中有几个时间相关的重要包：`datetime`,`calendar`和`time`。

datetime重点在于对于日期&时间的表示和运算，不涉及时间程序，主要是便捷处理时间。

calendar是内置的日历包

而time则是更侧重于python的时间操控



https://www.runoob.com/python3/python3-date-time.html

# datetime

类的结构（官方文档）：

```
object
    timedelta 两个时间类的差
    tzinfo 抽象类，关于时区
        timezone 时区的实现（会被下面的类调用）
    time 时间（一天之内）
    date 日期
        datetime 日期和时间（功能基本在date和time实现了）
```

datetime包主要用的是是time、date和datetime（没错，和包重名了！），此外还有一些不必须涉及的内容如timezone

date, datetime, time, timezone都是不可变对象，可以哈希，可以pickle，便于python进行处理。

官方文档：https://docs.python.org/3/library/datetime.html



## date

date类初始化参数是三个：年月日，这个是比较显然的。

创建对象的方式：

* `date(year, month, day)`
* `date.today()`直接得到今天，这是个类的方法
* `date.fromtimestamp(timestamp)`类的方法，基于时间戳创建，如果时间是`time.time()`其实就是上面的today函数



运算操作：

* `date2 = date1 + timedelta`
* `date2 = date1 - timedelta`
* `timedelta = date1 - date2`
* `date1 < date2`

示例：

```python
from datetime import date
d1 = date.today() #2020-4-4
d2 = date(2020,4,1)
delta = d2- d1 # datetime.timedelta(days=-3)
d2<d1 #True
print(d1+delta) # d2 2020-04-01
```

注意delta的数值，日期越早越小



## datetime

建议`from datetime import datetime`，同时如果用到time或者date也用相同方式导入。

如果使用datetime类一定要注意这个类和包同名造成的误会（有些新手以为datetime包就是类，所以操作报错）







