---
title: 如何为jupyter实现版本控制
tags: 
- 技术
- jupyter
---

jupyter notebook/lab 是很好的代码工具，然而由于每次运行都会产生临时文件和图片等输出，因此jupyter的文件体系自成一体，而且单一的`.ipynb`文件也经常会很大，不适合git的管理，甚至由于文件过大，GitHub Desktop无法将diff显示出来，这就为管理加了很大的难题。

<!--more-->

# 解决操作



## 第一部分：省去缓存

如果是通过jupyter指令打开notebook窗口，那么会产生`.ipynb_checkpoints`的文件存储中间内容，这增加了版本控制的数据量，而且由于这个是中间缓存，实际上和git作用重叠，因此没必要进行版本控制。

为此可以添加`.gitignore`文件，在其中添加一行`.ipynb_checkpoints/`

## 第二部分：优化存储

在这方面，有一些成熟的工具可以处理jupyter，这里选择使用的是kynan的python包 [nbstripout](https://github.com/kynan/nbstripout) ，这一工具可以用于清理掉notebook里面的图片等输出，也可以单纯的用于为git添加一个过滤器，使得版本控制内容限定在文本而不含变化的输出部分。

要过滤git，只需：
* 安装包：`pip install --upgrade nbstripout`,`conda install -c conda-forge nbstripout`
* 在目标文件夹下，在命令行输入：`nbstripout --install`

这个包还有更多操作，不过简单使用以上就可以日常用了