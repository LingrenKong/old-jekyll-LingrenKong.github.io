---
title: pycharm入门笔记-3
mathjax: false
date: 2020-02-27 15:48:22
tags:
categories:
---

使用pycharm来学python的记录–配置ipython与jupyter

<!--more-->

# jupyter notebook

pycharm可以创建`.ipynb`的文件，并且文件可以直接打开，然而打开之后是

需要安装jupyter，这并不复杂，只需要在安装包的选项里找到jupyter安装即可（如果用pycharm虚拟环境就需要检查一下有没有安装）

我电脑有点奇怪，安装jupyter也不行，最后是用anaconda的jupyter作为处理器（因为jupyter和python解释器可以分开）

# 使用IPython

设置位置：Settings | Build, Execution, Deployment | Console

默认设置就是如果有ipython则使用，因此给自己的解释器下面安装ipython即可

第四个选项是使用已经存在的console来runfile，选上之后就会Spyder的run类似了，会在console出现runfile然后运行

