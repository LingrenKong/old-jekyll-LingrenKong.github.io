---
title: Django学习笔记（2）--创建入门APP
mathjax: false
date: 2020-04-24 15:01:10
tags:
- Python
categories:
- 学习
- Python
- Django
---

根据3.0官方文档建立一份APP

<!--more-->

# 第一部分

```
py -m django --version
```

首先查看一下版本（这里应该是3.0）

## 创建项目

安装好之后利用admin创建项目（在命令行里面）：

```
django-admin startproject mysite
```

mysite是一个比较保险的名字，如果名字和经典的组件重合可能导致问题。

Django一个重要特点是可以把代码放在任意的位置，不需要在根目录



创建目录如下

```
mysite/
    manage.py
    mysite/
        __init__.py
        settings.py
        urls.py
        asgi.py
        wsgi.py
```

这些文件是：

- 外部`mysite/`根目录是项目的容器，名字对Django无关紧要。
- `manage.py`：一个命令行程序，后面很多操作都是使用它执行命令。可以`manage.py`在[django-admin和manage.py中](https://docs.djangoproject.com/en/3.0/ref/django-admin/)阅读有关的所有详细信息 。
- 内部`mysite/`目录是项目的实际Python包。它的名称是Python包名称，您需要使用它来导入其中的任何内容（例如`mysite.urls`）。
- `mysite/__init__.py`：一个空文件，告诉Python该目录应视为Python软件包。
- `mysite/settings.py`：此Django项目的设置/配置。详情见 [Django设置](https://docs.djangoproject.com/en/3.0/topics/settings/)。
- `mysite/urls.py`：此Django项目的URL声明；Django支持的网站的“目录”。您可以在[URL调度](https://docs.djangoproject.com/en/3.0/topics/http/urls/)程序中阅读有关URL的更多信息。
- `mysite/asgi.py`：与ASGI兼容的Web服务器为您的项目提供服务的入口点。有关更多详细信息，请参见[如何使用ASGI](https://docs.djangoproject.com/en/3.0/howto/deployment/asgi/)进行[部署](https://docs.djangoproject.com/en/3.0/howto/deployment/asgi/)。
- `mysite/wsgi.py`：与WSGI兼容的Web服务器为您的项目提供服务的入口点。有关更多详细信息，请参见[如何使用WSGI](https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/)进行[部署](https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/)。



```
py manage.py runserver
```

利用这个指令试运行服务器，应该能看到hello Django【这个是debug模式，不是实际业务服务器】

文档讲了一下关于端口的事情，但是一开始不需要了解

## 创建应用

