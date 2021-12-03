---
title: Django学习笔记（1）--基本介绍
mathjax: false
date: 2020-04-24 14:44:10
tags:
- Python
categories:
- 学习
- Python
- Django
---

经典Python前端框架Django简介

<!--more-->

# 简介



## 基本思路

Django常被用来制作database-driven Web app，网页服务的思路被抽象为框架中的一个个APP来实现，有很好的第三方APP支持，操作数据库也比较友好（不需要手写SQL语句，而是在Python中定义）



## 特色

- url十分干净，便捷管理，而且支持正则表达式等匹配
- 数据库模型写在Python中，不需要再管理SQL（如果使用sqlite默认）
- 很多第三方作者实现了通用功能
- 有一个admin在调试的过程中管理数据
- 提供一个shell交互式操作，可以执行Python和Django操作
- 利用模板批量生产网页（还可以继承）

