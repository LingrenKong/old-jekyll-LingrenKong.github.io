---
title: 在有C语言基础的情况下理解Python
tags: 
- Python
- 学习
---

如何在有C语言基础的情况下理解Python

假设C语言基础是采用《C程序设计（第四版）》 谭浩强

<!--more-->



# 概念比较

学完C一年之后再去翻C语言的基础书，才发现似乎书上真的没有讲什么……

目录：

- 程序设计和C语言
- 算法——程序的灵魂
- 简单的C程序设计——顺序程序设计
- 选择结构程序设计
- 循环结构程序设计
- 利用数组处理批量数据
- 用函数实现模块化程序设计
- 善于利用指针
- 用户自己建立数据类型
- 对文件的输入输出

对应的内容：

- [脚本语言、面向对象](https://lingrenkong.github.io/2019/11/10/from-c-to-python/#语言特性)
- [算法](https://lingrenkong.github.io/2019/11/10/from-c-to-python/#算法)
- [Python的选择与循环](https://lingrenkong.github.io/2019/11/10/from-c-to-python/#选择与循环)
- Python的内置数据类型【可以看菜鸟教程或者官方文档等】
- Python函数【可以看菜鸟教程或者官方文档等】
- [没有指针，但是有类似的逻辑](https://lingrenkong.github.io/2019/11/10/from-c-to-python/#C的指针与Python变量)
- Python的类【可以看菜鸟教程或者官方文档等】
- [文件、输入输出、路径](https://lingrenkong.github.io/2019/11/10/from-c-to-python/#文件、输入输出、路径)

## 语言特性

对于Python最深刻的理解莫过于这个了：

```python
import this
"""
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.可读性很重要！
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
"""
```

Python的语言特性很多，如果说和C对比的话，最大的区别是三点：

- 脚本语言
- 动态类型
- 面向对象

### 脚本语言

脚本语言不需要编译，可以直接用，由解释器来负责解释

所以说相比于C，你不需要进行编译，也不因为编译失败而心态爆炸

使用解释器，意味着你可以运行你代码的部分，即使后面还没有写完（但是这不代表你可以跳过使用某个变量的语句直接运行后面的语句）

```python
var = "变量赋值"
var = 1
print(var)
```

如果你上来就`run cell(Spyder的一个按钮，可以运行选定部分)`，那就会`NameError: name 'var' is not defined`，提示你没有定义变量`var`。

如果你运行整个程序，那么就会输出1（动态类型后面再说）

如果你先运行第一句，然后跳过第二个，单独运行第三句，那么就会输出`变量赋值`

脚本语言使得写代码时，能够人机即时交互，但是代价是解释器会存下太多东西，速度和内存管理不太行（但是我们暂时不必在意这点）

### 动态变量

相比于C，动态变量这件事可以说是喜忧参半。

- 忧在没有人管你的变量操作了，没有严格定义的变量有时候会出问题
- 喜在你不需要具体的一个个定义变量，只需要写出变量名赋值即可

严格来讲，动态变量类型不代表你就可以随便更改变量的类型。因为变量的数据类型不定，所以你可能会搞出一些迷惑操作，尤其Python特别擅长重载各种操作，所以你并不会因为错误的数据类型而得到Error：

```python
a = input("请输入一个数字a:")
b = input("请输入一个数字b:")
print('a+b的结果是：',a+b)

#请输入一个数字a:1
#请输入一个数字b:2
#a+b的结果是： 12
```

`a+b`看起来很正常，然而input输进去的是字符串，所以`+`是字符串的连接方法，你得到的是两个字符直接相连，而不是数字加法。

因此最好不要用`i`这种看起来就像循环变量的东西来存字符串，会让其他人懵的

### 面向对象

【致某些同学（包含我自己）：面向对象编程不要求你先找个对象】

面向对象是相对于面向过程来讲的，面向对象方法，把相关的数据和方法组织为一个整体来看待，从更高的层次来进行系统建模，更贴近事物的自然运行模式。

简而言之：之前写个`main()`函数，现在要写`class xxx`，函数还是要写，但是一般组织在一个类里面

如果你对面向对象暂时不太了解，也可以继续使用C的面向过程编程，继续写函数。

下面是个简单的例子，看不懂也不要太担心（因为`self`这种东西就是个符号而已）

```python
def function(name):
    print(name)
    
class People():
    def __init__(self,name):
        self.n = name
    def function1(self,name):
        print(name)
    def function2(self):
        print(self.n)

if __name__ == "__main__":
	function("学Python")
	klr = People("klr")
	klr.function2()
	klr.function1("好好学习")
```

## 算法

算法在每种语言都是相同的，但是在Python做程序练习的时候，你可以总找到捷径

比如说处理重复数据的时候，可以用`set`直接搞定：

```python
listRaw = [1,1,1,2,3,5]
print(list(set(listRaw)))
# [1, 2, 3, 5]
```

【这就是为啥Python相关广告都有“X行代码搞定”的标题】

## 选择与循环

参考[菜鸟教程](https://www.runoob.com/python3/python3-conditional-statements.html)可以了解基本的Python分支和循环语句

相比于C语言，可能更需要注意的是，Python对于循环的彻底认知是比较有难度的（这要感谢Python基本数据的特性）

最明显的一点是，当我们使用`for`循环，会发现这个句子并不是简单的`i++`逻辑（当然你可以用while来做，那么就是`i++`的方式了）

```python
for i in range(10):
	print(i)
```

我们发现Python的for语句和C最根本的不同在于，C语言的while和for本质上差不多，可以互相改写，但是Python的for使用了`in`这个符号。

深入讲解这个问题需要涉及到迭代器、生成器，我们暂时不讲那么深，只是提出来：

- range可以当做C语言循环的模式来理解，但是实质不同
- in还可以用在其他东西上，逐个遍历，比如字符串、列表、元组（他们统称可迭代对象）

## C的指针与Python变量

相信大家在学习C的时候老师都会强调C的重要性，其中比较常被强调的一点就是指针可以锻炼思维和节省空间。

相信大家都知道Python是没有指针的，有的同学也为此松了一口气，但是……不幸的是，如果你在学C的时候没学明白指针，那么接下来的部分还是会让你感到迷惑。

```python
a = [3*x+1 for x in range(5)]#列表生成式可以先不必理解
b = a
print("a:",a,"b:",b)
a[2] = "为什么会这样"
print("a:",a,"b:",b)
# a: [1, 4, 7, 10, 13] b: [1, 4, 7, 10, 13]
# a: [1, 4, '为什么会这样', 10, 13] b: [1, 4, '为什么会这样', 10, 13]
```

对比一下C语言什么时候会发生类似情况：

```python
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int *a=NULL,*b=NULL;
	a = (int*)malloc(sizeof(int)*2);b = a;
	a[0] = 1;a[1] = 2;
	printf("a:%d,%d\n",a[0],a[1]);
	b[0] = 0;
	printf("a:%d,%d\n",a[0],a[1]);
	return 0;
}
//输出：
//a:1,2
//a:0,2
```

也就是说，如果你的变量是数、元组这种不可以更改的对象，那么万事大吉，可以直接用赋值。但是如果使用的是可变对象，比如列表，那么其实当你把一个变量赋值给另一个变量的时候，你其实是在类似于复制一个指针，并没有复制数据。

如果从一个比较Python的方式来理解，一般是说，变量名是“一个贴纸”，而数据是格子，格子可以任意贴贴纸。仅仅是为了方便你理解和称呼某个数据，而解释器会根据你的变量对应的位置去找数据，这个过程任何语言都一样。

因此Python的变量可以贴来贴去，也可以一堆标签贴在同一个格子（赋值时候发生的事情就是这个）。

那么怎么处理这个问题呢？我们就需要引入两个函数`copy()和deepcopy()`

`copy()`是内置功能（其实是类的方法`__copy__(self)`），不需要调用包

```python
a = [3*x+1 for x in range(5)]
b = a.copy()#这是一个基本的内置方法，不需要调包
print("a:",a,"b:",b)
a[2] = "为什么会这样"
print("a:",a,"b:",b)
#a: [1, 4, 7, 10, 13] b: [1, 4, 7, 10, 13]
#a: [1, 4, '为什么会这样', 10, 13] b: [1, 4, 7, 10, 13]
```

但是有时候仅仅是copy还不够用：

```python
a = [1,2,[1]]
b = a.copy()
a[2][0] = "啊！"#在列表里面的列表被复制的时候简单的把列表的位置复制了，所以a和b虽然不同，但是他们含有同一个列表
print("a:",a,"b:",b)
a[1] = "为什么会这样"
print("a:",a,"b:",b)
#a: [1, 2, ['啊！']] b: [1, 2, ['啊！']]
#a: [1, '为什么会这样', ['啊！']] b: [1, 2, ['啊！']]

#处理方式：
import copy
a = [1,2,[1]]
b = copy.deepcopy(a)
a[2][0] = "啊！"
print("a:",a,"b:",b)
a[1] = "为什么会这样"
print("a:",a,"b:",b)
#a: [1, 2, ['啊！']] b: [1, 2, [1]]
#a: [1, '为什么会这样', ['啊！']] b: [1, 2, [1]]
```

## 文件、输入输出、路径

参考：

- [菜鸟教程](https://www.runoob.com/python3/python3-inputoutput.html)

- 官方文档（建议英语水平要够）

  - 仅仅使用open函数：https://docs.python.org/3/library/functions.html#open
  - 路径操作：https://docs.python.org/3/library/os.path.html#module-os.path

- pathlib：

   

  https://docs.python.org/3/library/pathlib.html

  - [PEP428](https://www.python.org/dev/peps/pep-0428/#abstract)提出了建议，将pathlib这个对象式的第三方库加入到标准库之中
  - 从Python 3.6开始，pathlib模块在整个标准库中得到支持

- pickle模块

### input函数：

```python
from numpy.random import randint

def guess(start,end):
    a = randint(start,end)
    guess = -1
    iterCount = 0
    while iterCount<end-start+1 and guess != a:
        guess = int(input("猜数游戏，这个数字a可以取从{0}到{1}:".format(start,end)))
        iterCount += 1
    print('恭喜猜对啦！')
    
if __name__ == "__main__":
    guess(1,5)
```

### 字符串格式化输出：

Python尽管有着十分友好的输出语法`print`，但是有些时候还是需要格式化输出字符串的功能。

在Python中主要有四种格式化字符串的方法：

第一种是类似于C的方法，在旧Python2中常用

注意和C的区别在于`%`后面只接受单一参数，多个输入要用元组打包。如果担心参数太多容易乱，可以使用关键字和字典

```python
name = '李狗蛋'
age = 18
print("我的名字是%s"%name)#在字符后面接上%，这个整体是一个格式化字符串，不一定要print出来
t = "我的名字是%s"%name
print('格式化作用于字符串而不是print:',t)

print("我的名字是%s，我的年龄是%d"%(name,age))#元组打包格式化

print("我的名字是%(na)s，我的年龄是%(ag)d"%{'ag':age,'na':name})#注意前面是（）括号，后面字典才是{}
```

第二种是Python3字符串方法

这是通过为字符串对象内置`.format`方法实现的

可以用`help(" ".format)/help(str.format)`直接看函数简介

- `str`整体的文档在https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
- 格式化字符串的网址在https://docs.python.org/3/library/string.html#formatstrings

```python
print("count {0} {1} {2}".format(1,2,3))
# format()内的东西采用逗号分隔，相当于作为一个元组输入，而前面{}里面的序号对应元组的位序
print("count {} {} {}".format(1,2,3))# 不写就按默认顺序
print("{0[1]} {1.__doc__}".format([1,2],"lower"))#输入数据对象可以再进行.(调用属性)或者[]操作

# *对可迭代对象的解包 https://www.python.org/dev/peps/pep-3132/

"""
python的len函数是一个很有用的函数，对字符也有多个功能
"""
string = "中文字符串的len😀"
print(len(string),'中文英文都是按一个字计算的') #10
print(len(string.encode('utf-8')),'中文6*3+英文3*1+1*4=25（英文不会被转换为utf8代码）')

"""
字符串对象有几个比较重要的内置方法
"""
s = "I love programming"
s.title()# 'I Love Programming'
s.lower()# 'i love programming'
s.upper()# 'I LOVE PROGRAMMING'
```

第三种方式：`f-string`

f字符串这个思路比较清奇，因为他不需要你去安排数据是啥这个问题（前面两种都需要把数据写在某些位置），你只要写变量名就可以自动让Python帮你找需要替换什么。

P.S.这个思路有点像Django框架对于变量的替换

```python
a = '找'
a = '我'
str = f"你猜接下来输出是？{a}"
print(str)
#你猜接下来输出是？我
```

第四个方式`string.Template.substitute`

使用有点复杂，但是好处是可以封装特点的替换方式

```python
from string import Template

def demoTemplate():
  #创建一个实例tmp
  myTemplate = Template("斐波那契数列第${a}项：${b}")
  feb = [1,1,2,3,5,8,13,21]
  i = 1
  for val in feb:
    result= myTemplate.substitute(a=i,b=val)#给相应的key（键）赋值，返回格式化的字符串
    print(result)
    i += 1
demoTemplate()#运行
```

## 如何写注释

一个比较好的代码是需要有注释的，而且Python有个很强大的功能是可以自动为你生成用户文档，只需要用`help`函数即可

```python
class Demo(object):
    """
    展现如何给自己的代码留下可以方便重用的注释
    """
    def demoPrint(self,inputVal:str='默认打印这个')->None:
        """
        一个展示打印用的函数
        按照定义要求inputVal输入的是str，并且返回None
        """
        print('>')
        print(inputVal)
        print()

if __name__ == '__main__':
    import howToWriteNote
    print(help(howToWriteNote))
    print()
    demo = Demo()
    demo.demoPrint()
    demo.demoPrint('输出指定内容')
    demo.demoPrint(('注意到输入并不符合定义式也可以运行',1))
```