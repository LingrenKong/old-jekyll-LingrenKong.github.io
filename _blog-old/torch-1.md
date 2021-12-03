---
title: pytorch学习笔记（1）--理解autograd
mathjax: true
date: 2020-07-06 15:11:33
tags:
categories:
- 学习
- Python
- Pytorch
---

通过几个自己写的情况来辅助理解autograd

<!--more-->

# 标量例子

首先尝试一下纯标量的求导

$$
z = x + y^2
$$

那么对应的导数是：
$$
\frac{\partial z}{\partial x} = 1,\frac{\partial z}{\partial y} = 2y
$$

标量的情况比较朴素，得到结论也很直观。
唯一要注意的可能就是pytorch本身动态图的特点:
* 不要进行两次backward，否则会有`RuntimeError: Trying to backward through the graph a second time, but the buffers have already been freed. Specify retain_graph=True when calling backward the first time.`
* 如果retain_graph=True，那么可以再次进行求导，梯度会累加


```python
x = torch.tensor(1.0, requires_grad=True)
y = torch.tensor(2.0, requires_grad=True)
z = x+y**2
print(x,y,z,sep='\n')
>>>tensor(1., requires_grad=True)
>>>tensor(2., requires_grad=True)
>>>tensor(5., grad_fn=<AddBackward0>)
z.backward(retain_graph=True)
print(x.grad,y.grad,sep='\n')
>>>tensor(1.)
>>>tensor(4.)
```

没有清零就会累计的梯度：

```python
z.backward()
x.grad
>>>tensor(2.)
```





# 向量输入-标量结果的求导

$$
x = (1,2)^T,y = x^2,z=|y|
$$

`norm`函数默认是矩阵范数
$$
\frac{\partial z}{\partial x_1} = 2x_1^3(x_1^4+x_2^4)^{-\frac12},\frac{\partial z}{\partial x_2} = 2x_2^3(x_1^4+x_2^4)^{-\frac12}
$$


```python
x = torch.tensor([1.,2.], requires_grad=True)
y = x**2
z = torch.norm(y)
z.backward()
print(x.grad)
>>>tensor([0.4851, 3.8806])
```

验算没有问题：


```python
from math import sqrt
x1,x2 = 1.,2.
print([2*x1**3/sqrt(x1**4+x2**4),2*x2**3/sqrt(x1**4+x2**4)])
>>>[0.48507125007266594, 3.8805700005813275]
```




# 输出为向量的情况如何求导
$$
y = x^2
$$

对于向量的求导要传入一个参数，和被求导的内容有同一形状，一般用全1的张量


```python
x = torch.tensor([1.,2.], requires_grad=True)
y = x**2
y.backward(torch.ones_like(y))
print(x.grad)
>>>tensor([2., 4.])
```

PS注意，即使经过view或者reshape也不是原始数据，从而不能求梯度……


$$
 \begin{equation}
   \left[
 \begin{array}{cc}
     1 & 2
 \end{array}
 \right]  
 \left[
 \begin{array}{cc}
     1 & 2 \\
     3 & 4 
 \end{array}
 \right]
 =
  \left[
 \begin{array}{cc}
     7 \\
     10 
 \end{array}
 \right]  
 \end{equation}
$$

$$
 \begin{equation}
   \left[
 \begin{array}{cc}
     x_1 & x_2
 \end{array}
 \right]  
 \left[
 \begin{array}{cc}
     y_{11} & y_{12} \\
     y_{21} & y_{22}
 \end{array}
 \right]
 =
  \left[
 \begin{array}{cc}
     x_1y_{11}+x_2y_{21} \\
     x_1y_{12}+x_2y_{22} 
 \end{array}
 \right]  
 \end{equation}
$$


相应进行对x的求导：

$$
z = z_1+z_2
$$

$$
\frac{\partial z}{\partial x_1} = y_{11} + y_{12},
\frac{\partial z}{\partial x_2} = y_{21} + y_{22}
$$


```python
x = torch.tensor([[1., 2.]], requires_grad=True)
y = torch.tensor([[1., 2.], [3., 4.]], requires_grad=False)
z = torch.mm(x, y)
z.backward(torch.ones_like(x))
x.grad
>>>tensor([[3., 7.]])
```
