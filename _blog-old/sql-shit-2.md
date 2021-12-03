---
title: 坑爹SQL(2) 从零开始用pythonODBC操作数据库并建立网页
mathjax: false
date: 2020-04-28 18:04:18
tags:
- SQL
categories:
- 学习
- 数据库
---

从零开始用pythonODBC操作数据库（配置在前面）

内容有点乱……请不要在意

<!--more-->

# 建表

使用Microsoft SQL server先创建需要用的表



# 连接

```python
import pyodbc

#配置要先设置好
server = 'localhost' #本机都是这个
database = 'mydatabase' #自己建的那个database的名字
username = 'learn'#用户名，一般用的是sa
password = 'sqlpassword'#自己的密码
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password +';CHARSET=GBK;Trusted_Connection=yes;')
#Trusted_Connection=yes;有人需要；是一个特殊的连接用字符串，关于这个在上个博客吐槽了
cursor = cnxn.cursor()
```

cursor是游标，可以用cursor执行一个简单的查询来看看效果：

```python
tsql = """select X from X;"""
with cursor.execute(tsql):# 游标执行SQL语句
    row = cursor.fetchone()# 从语句结果取一行
    while row:
        print(row[0].encode('gbk').decode('gbk'))#每行的各个内容可以用位置取出
        print(row[1].encode('gbk').decode('gbk'))#注意语言编码，python是UTF而Windows是GBK
        print(row[2])
        #print (str(row[0]) + " " + str(row[1]))
        row = cursor.fetchone()#取不出来就退出while了
```



# 简单应用构建

应用有两部分：

* 网页端的
* python与数据库端的

一开始的构建可以先从粗糙的基本操作开始，逐个部分完成，比如先写完网页之后，就python端只涉及一个print，确定网页没错再改写 python



## 在网页端建立input表单

首先建立一个带有input和post的网页，用来向服务器发送请求：

```html
<form action="http://127.0.0.1:5000/query" method="post">
	<input type="text" name="my_student_sno" value="默认值"></input>
	<br/>
	<input type="submit" value="begin query"></input>
</form>
```





## 根据表单设计对应的query

如果用flask：

从post方法得到学生学号用于查询

```python
@app.route('/query', methods = ['POST'])
def query():
    my_student_sno = request.form['my_student_sno']
	
    # 这里是服务器连接操作，得到cursor

    tsql = f"""select student.sname, course.cname, sc.grade
    from student, sc,course
    where student.sno=sc.sno and sc.cno =course.cno
    and student.sno = '{my_student_sno}';"""

    with cursor.execute(tsql):
        row = cursor.fetchone()
        #此处应该有个查询操作
        # 没有设置返回相应，先直接redirect回去
    return redirect('/')
```



# debug

使用flask的过程中，内容会越来越多，所以不能运行一次改一次--`app.run(debug=True)`自动更新

学会使用VScode或者pycharm来实现集成开发

大项目要学会用断点和调试，一个调试中的经典例子就是pyodbc查询中的字符串是定长（后面用空格补齐），所以要做个字符串处理



# 更多知识

## flask

https://www.w3cschool.cn/flask/

学会使用template实现便捷操作与变量替换的行为。

url也支持传递变量

## matplotlib

matplotlib可以及时生成网页上的图片



## echart

百度的一个js库，可以画图

在网页上渲染，有很好的交互效果

可以数据库查询到数据，嵌入到html中的js里面，从而实现可变的js



# 最终目标--CRUD

create（insert） read（query） update delete

https://www.roytuts.com/python-web-application-crud-example-using-flask-and-mysql/

要先架构好前端和背后的流程，才可以编写CURD对应的程序

要有整体的应用导航设计（HTML带参数页面）

