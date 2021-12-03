---
title: pycharm入门笔记-2
mathjax: false
date: 2020-02-26 14:30:34
tags:
categories:
---

使用pycharm来学python的记录--基本操作整理

<!--more-->

# 项目

emm单纯创建一个项目是很简单的（以项目为整体是pycharm的特色）

项目三种打开：

* 创建（如果是专业版创建版面如下，可以选取python或其他项目模板）
* 打开本地已有
* 从版本控制那里找（暂时没弄懂）Check out an existing project from Version Control

![官网的图片](https://resources.jetbrains.com/help/img/idea/2019.3/py_create_project.png)

## 创建项目

创建项目的重点在于python解释器配置，因为pycharm不是直接使用默认python，而是默认希望你为项目创建虚拟环境。

如果构建虚拟环境，虚拟环境文件夹一般放在项目里面，有三种虚拟环境方式：`Virtualenv, Pipenv, or Conda`，然后可以选一下要装的包和高级选项

如果不创建虚拟环境也可以使用已有的解释器：`Existing interpreter`列表

完整的解释器选项列表（后面是专业版特权）：

* System Interpreter
* Virtualenv Environments: Virtualenv, Pipenv, and Conda.
* Remote Python interpreters ( SSH, Vagrant, WSL).
* Docker-based interpreters (Docker, Docker Compose).

## 打开本地已有

直接打开就好，可以选择当前窗口/新窗口

## 版本控制（还没搞定）

# 界面一览

![官网的图片+1](https://resources.jetbrains.com/help/img/idea/2019.3/py_mainWindow.png)

# 风格设置

## 界面外貌

路径：File | Settings | Appearance and Behavior | Appearance 

内容：

* 颜色主题（我觉得黑色最护眼）
* 字体字号
* 还有很多细节设置

## Editor

路径：File | Settings | Editor

细节太多了，大概就是code style比较重要，可以调一下空格/TAB

# 代码智能（重要）

## 代码补全

写代码时候会冒出来

## 小灯泡修复

点击灯泡或者<button>Alt+Enter</button>选择一项修复

https://www.jetbrains.com/help/pycharm/quick-start-guide.html?keymap=primary_default_for_windows未完待续