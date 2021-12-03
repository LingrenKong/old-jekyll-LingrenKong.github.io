---
title: seaborn学习笔记（2）--加载数据
mathjax: false
date: 2020-05-16 13:07:09
tags:
- Python
- Seaborn
- 电脑配置
categories:
- 学习
- Python
- 可视化
- seaborn
---

seaborn也具有内置数据集

<!--more-->

在seaborn文档中，会使用一些对于数据集的加载。

如

```python
import seaborn as sns
sns.load_dataset('iris')
```

如果本地没有这个数据，就需要到网上加载，而可能会因为电脑的安全原因而无法访问



这个时候有两个方案：

* 更改安全设置：每个电脑不太一样，而且不好弄
* 下载到本地：本地会存在一个`seaborn-data`文件夹（一般是用户根目录/系统根目录）



下载地址：https://github.com/mwaskom/seaborn-data