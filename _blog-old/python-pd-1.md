---
title: pandas学习笔记（1）
mathjax: false
date: 2020-04-04 11:10:32
tags:
- Python
- Pandas
categories:
- 学习
- Python
---

pandas学习笔记第一节，pandas输入输出

<!--more-->

# 总览

pandas入门第一步是导入导出文件来建立dataframe

虽然看似很简单，但是过程中涉及到的一些函数参数有时候是容易搞不清的



# read_html

对于普通的HTML表格内容，可以不使用复杂爬虫，直接用pandas，调用lxml包抓取（但是对于花里胡哨的JavaScript动态表无效）

注意：返回的结果是**DataFrame**组成的**list**。



下面这个是一个示例，抓取QS的排名

网页内有4个table（这个是个小问题，就是HTML会在一些并不是表单的地方使用table来进行排版），第四个是排名表

```python
import pandas as pd
dfs = pd.read_html('http://rankings.betteredu.net/qs/world-university-rankings/latest/2019-2020.html')
df = dfs[3]
```



函数参数

```
pandas.read_html(io, match='.+', flavor=None, header=None, index_col=None, skiprows=None, attrs=None, parse_dates=False, thousands=', ', encoding=None, decimal='.', converters=None, na_values=None, keep_default_na=True, displayed_only=True)
```

常用的参数（https://pandas.pydata.org/docs/reference/api/pandas.read_html.html）：

- io:可以是url、html文本、本地文件等；【注意lxml不能接受https对象，请删除s】

- attrs：识别标志，如果会html可以用于找到具体的表



# read_csv

`import pandas as pd`

`df = pd.read_csv(path)`

最基础的就是直接给一个csv文件路径，即可导入一个文件生成df



## 利用已有index

`index_col=0`指定第一列为df的index，这个往往适用于pandas导出的csv，因为这种csv的第一列就是index。



## 其他分隔符

`sep=','`

除了csv逗号分隔，也有其他格式分隔的数据，比如常见的tsv（TAB分隔），或者自己输出的自定义分隔符分隔的txt文件，这些都是用同一个函数实现的。如果数据中有字符串，就容易出现逗号被错误解释的情况。



# df.to_csv

`df.to_csv(path)`

最基础就是给定文件导出路径即可



## 不输出index

`index=None`

利用这个关键词参数，可以避免导出pd给定的index，这样输出的内容和导入内容的默认形式是相同的。

