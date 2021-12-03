---
title: python重要操作速查表
tags: 
- Python
- 学习
---

这是一些Python的重要操作

<!--more-->

数据表批处理操作：

```python
import numpy as np
import pandas as pd

# data is a dataFrame/ndarray
data[data==0] = 1 #change all the 0 into 1
# note: data==0 is a boolen array,which canbe used as index
data[data<0] = -1 #这个知识点在于np支持批量运算+数组索引
```