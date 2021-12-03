---
title: 马原+空想社会主义&乌托邦+程序设计
mathjax: false
date: 2019-12-19 22:02:23
tags:
- 好玩
- Python
categories:
- 学习
- Python
---

O(∩_∩)O哈哈~

<!--more-->

马原课上老师讲到空想社会主义的时候，为了证明他们的理想化，提到说他们对城邦的人数有严密的设计，从而让城邦资源可以被从1到50整除均分。

然而……如果一个数被1-20都能整除，那么他就至少是232,792,560两个亿还多。

为了算这个东西写了个程序：

先用辗转相除求最大公约数，然后利用最大公约数求出最小公倍数

```python
def GreatestCommonDivisor(a:int,b:int)->int:
    """
    para: int a,b 两个整数
    temp: int r余数
    return：int b最大公约数
    method：辗转相除法
    """
    if a<b:
        a,b = b,a#保证a比b大
    while(True):
        r = a % b
        if(r==0):
            return b
        a,b = b,r
        
def  LeastCommonMultiple(a:int,b:int)->int:
    """
    para: int a,b 两个整数
    return：最小公倍数
    method：通过最大公约数和最小公倍数关系
    """
    return int(a*b/GreatestCommonDivisor(a,b))

def Utopian(div:int)->int:
    """
    para: int div要被多少整除
    return：int citizen空想社会主义城邦的完美人数
    method：逐个求最大公约数
    """
    citizen = 1
    for i in range(1,div+1):
        citizen = LeastCommonMultiple(citizen,i)
        print(i,"|||",citizen)
    return citizen

print("result",Utopian(50))
```



