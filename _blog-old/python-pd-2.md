---
title: pandas学习笔记（2）
mathjax: false
date: 2020-04-04 15:27:59
tags:
- Python
- Pandas
categories:
- 学习
- Python
---

pandas学习笔记第二节，如何添加行

<!--more-->

pandas有很多效果都是和SQL类似的，但是在手动新增数据这方面实在不太友好



# 第一个方式：逐个元组的添加

```python
row = [{'列名':值}]
df=df.append(row,ignore_index=True) 
```

这个方法的添加行是通过一个**字典的列表**来作为输入，字典是*列-属性*的结构，可以不包含全部字段

虽然这个和SQL的INSERT INTO最相似，但是并不是好方法，实际append方法是产生了一个副本并添加

` ignore_index=True`很重要，因为这样添加进去的index和原来df是顺序自增的



# 第二个方法：利用loc

```python
df.loc[len(df)]=[‘x’,’y’]
```

利用loc可以直接往里面插入数据，有点类似dict向不存在的key赋值时候发生的创建新内容



但是这个方法存在问题的，因为pandas可以有自定义的索引，或者重复的index，但是如果使用的loc索引存在，就变成了替换而非插入：

```python
import pandas as pd
df = pd.Series()
print(df)
df.loc[0] = 1
print(df)
df.loc[0] = 2
print(df)
```



# 第三个方法：更改索引reindex

通过reindex更改原有的index，不仅可以修改index，还可以通过多增加index来创建有索引的空行，再进行赋值

```python
import pandas as pd
df = pd.Series()
df.loc[0] = 1
df = df.reindex(index=list(df.index)+['add'])
df.loc['add'] = 2
```

