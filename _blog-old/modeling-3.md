---
title:数学建模笔记（3）--仿真模拟
mathjax: false
date: 2020-08-24 17:46:31
tags:
- 数学建模
- Python
- MATLAB
categories:
- 学习
- 数学建模
---

仿真模拟

<!--more-->

# Python-Simpy

这是一个仿真用的包https://simpy.readthedocs.io/en/latest/



## PS查词

resume重新开始、继续

## Overview的理解

这个包用于离散事件的模拟

特性在于Process使用Python的生成器来定义（所以是yield），此外还提供了一个概念叫Resource，类似于队列的性质，可以共享和排队。

有两种运行方式：

* 基于一个clock的运行
* 人工stepping步进

On the other hand, SimPy is overkill for simulations with a fixed step size where your processes don’t interact with each other or with shared resources.如果没有用到Resource就有点浪费这个包了。

PS虽然可以，但是不要用来做连续模拟

## Basic Concepts

三个基本概念：

* process
* environment
* event

每个进程是自己定义的函数（生成器），参数会包含环境作为参数，比如需要依据环境的时间。

环境：`simpy.Environment()`，利用这个来建立环境，所有东西都基于环境

event就是发生的事情，也就是process的那个yield输出

基本流程：

* `env = simpy.Environment()`创建环境
* `env.process(你的那个函数(env))`加入到环境内
* `env.run(until=15)`运行模拟时间的15

## Process Interaction进程交互

有两种基本情况：

* 等待
* 打断

如果出现进程交互，那么我们就要把原有的函数改成一个类（class），这个类有两个必要因素--初始化（用到env）还有运行（命名为run）

### 等待

比如由司机停车过程中要充电，充电不是车的process，但是和车的行进有关系。

对于等待模式，将涉及到的等待交互另建一个函数，这个函数属于用到等待的类成员，由此等待过程可以通过调用类内函数来进行（**区别在于`yield`抛出的返回值是一个Process**），其实相当于把**多个流程细化拆分**到不同函数，仍可以不用到进程来完成。

### 打断

用到打断的时候，执行打断操作的Process需要单独定义一个函数/类（如driver），接受要打断的Process（充电操作）作为参数之一

每个process有一个内置方法`.interrupt`，所以打断就是调用这个。

被打断会导致Exception，要用错误处理来设置对于打断的处理逻辑：

```python
try:
	yield self.env.process(要做的进程)
except simpy.Interrupt:
	print("这里是被打断后的响应")
```

## Shared Resources公共资源

资源是作为一个类来实现的，`simpy.Resource(env, capacity=2)`，操作机理是FIFO和队列一样先进先出

在对于资源进行操作时，资源有`request`和`release`两个内置方法进行获取和释放，如果利用Python特有的`with`语句，就可以省去显示释放操作，和文件操作类似。
