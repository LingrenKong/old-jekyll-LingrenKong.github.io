---
title: 坑爹SQL(1)
mathjax: false
date: 2020-04-21 19:43:31
tags:
- SQL
- 电脑配置
categories:
- 学习
- 配置
---

SQL的一个坑

数据库与python联合时候的配置

<!--more-->

# 如何使用SQL、ODBC、python写数据库



## 前置基础

首先我们有安装python、以及Microsoft Sqlserver19、Server配套的manage studio18



## ODBC安装

https://www.microsoft.com/en-us/sql-server/developer-get-started/python/windows/

安装最新的官方ODBCdriver(下载安装包ODBC Driver 17 for SQL Server，然后默认安装)

以及SQL command line（用来做快速的登录检验，可以没有）



## 配置

可以用Manage Studio来配置login用户：Security->login

用户要设置为Enable连接，账号密码可以在用Windows认证登录进去之后随便修改（也可以创建新的login账号）

注意一点，就是密码黑色长度是固定的，只是防止你猜密码位数，不要看长度以为没改。



配置完可以连接的话，可以在command用这测试：

```
sqlcmd -S localhost -U 用户名 -P 密码
```





## 建立连接

使用的库是pyodbc

根据登录的参数传入连接字符串

```python
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password +';CHARSET=GBK;Trusted_Connection=yes;')
```

Trusted_Connection=yes是一个重要的项，有些电脑可以不用，但是如果你发现在manage studio也无法用账号密码登录，必须在高级（options）添加一个Trusted_Connection=yes才登录成功，那么说明你的server一般只接受Windows认证，必须修改条件才能账号密码登录。

两个参考文档：

https://docs.microsoft.com/en-us/openspecs/sql_server_protocols/ms-odbcstr/864608a0-29e9-4766-9505-58c336bcd762

https://docs.microsoft.com/en-us/sql/relational-databases/errors-events/mssqlserver-18456-database-engine-error?view=sql-server-ver15