---
title: networkx学习笔记（1）
mathjax: false
date: 2020-04-07 16:51:38
tags:
categories:
---

networkx是python的图处理包，首先记录一下基本操作

<!--more-->

参考：https://networkx.github.io/documentation/stable/tutorial.htm官方文档

# 创建图，添加结点和边



## 创建图（无向图）

```python
import networkx as nx
G = nx.Graph()
```

Graph是包的无向图类，先建立图，然后逐步向内添加顶点和边



## 添加结点

顶点可以是整数或者字符串，实际上可以哈希的对象都可以。

```python
G.add_node(1) #加一个
------
G.add_nodes_from([2, 3]) #加一个列表
------
H = nx.path_graph(10) #另一个图
G.add_nodes_from(H) #把其他图的顶点加进去
```

最基本的添加顶点方法是逐个添加，或者根据一个可以迭代的顶点集添加。可迭代对象可以是一个列表，也可以是另一个图的顶点集

注意事项1：顶点也可以是另一个图，或者文件（但是要是可哈希的）：

```python
G.add_node(H) #将图H作为G的一个节点
```

注意事项2：字符串是可迭代对象

```python
G.add_nodes_from('node') #加入四个结点 n o d e
```



## 添加边

和添加顶点类似，可以添加单个或者批量添加

区别在于每个边关系都是二元组或者三元组如`(2, 3, {'weight': 3.1415})`，边的权是参数字典可以同时有多种权值

单个加边

```python
G.add_edge(1, 2)
e = (2, 3)
G.add_edge(*e)  # 元组解包*
```

批量添加：

```python
G.add_edges_from([(1, 2), (1, 3)])
G.add_edges_from(H.edges)
```

可以用列表、其他图的边集合、或者其他可迭代对象



