---
title: Python numpy学习笔记（1）--随机数功能
mathjax: false
date: 2020-05-01 14:49:53
tags:
- Python
- Numpy
categories:
- 学习
- Python
- Numpy
---

numpy随机数功能学习【文档太乱，反而是python的help效果更好】

<!--more-->

# 模块总览

```python
from numpy import random
```

numpy的random库是一个功能很强的库，可以替代Python本身的random（所以不要同时导入这两个）

通过查看包的`__init__.py`可以了解其中的功能（有点多）

其中分为几块：

* Utility functions：效用函数？（大概就是常用的意思吧）
* Compatibility function：兼容功能（相对比较新的函数）
* Univariate distributions：单变量分布生成
* Multivariate distributions：多变量分布生成
* Standard distributions：标准分布（如标准正态、标准$\Gamma$分布等）
* Internal functions：检查随机数生成器的当前状态

对于指定分布的生产，在使用的时候通过文档查询即可，但是常用的随机数操作功能需要熟练使用，因此本文学习常用的。

```
========================
Random Number Generation
========================

==================== =========================================================
Utility functions
==============================================================================
random_sample        Uniformly distributed floats over ``[0, 1)``.
random               Alias for `random_sample`.
bytes                Uniformly distributed random bytes.
random_integers      Uniformly distributed integers in a given range.
permutation          Randomly permute a sequence / generate a random sequence.
shuffle              Randomly permute a sequence in place.
seed                 Seed the random number generator.
choice               Random sample from 1-D array.

==================== =========================================================

==================== =========================================================
Compatibility functions
==============================================================================
rand                 Uniformly distributed values.
randn                Normally distributed values.
ranf                 Uniformly distributed floating point numbers.
randint              Uniformly distributed integers in a given range.
==================== =========================================================

==================== =========================================================
Univariate distributions
==============================================================================
beta                 Beta distribution over ``[0, 1]``.
binomial             Binomial distribution.
chisquare            :math:`\\chi^2` distribution.
exponential          Exponential distribution.
f                    F (Fisher-Snedecor) distribution.
gamma                Gamma distribution.
geometric            Geometric distribution.
gumbel               Gumbel distribution.
hypergeometric       Hypergeometric distribution.
laplace              Laplace distribution.
logistic             Logistic distribution.
lognormal            Log-normal distribution.
logseries            Logarithmic series distribution.
negative_binomial    Negative binomial distribution.
noncentral_chisquare Non-central chi-square distribution.
noncentral_f         Non-central F distribution.
normal               Normal / Gaussian distribution.
pareto               Pareto distribution.
poisson              Poisson distribution.
power                Power distribution.
rayleigh             Rayleigh distribution.
triangular           Triangular distribution.
uniform              Uniform distribution.
vonmises             Von Mises circular distribution.
wald                 Wald (inverse Gaussian) distribution.
weibull              Weibull distribution.
zipf                 Zipf's distribution over ranked data.
==================== =========================================================

==================== =========================================================
Multivariate distributions
==============================================================================
dirichlet            Multivariate generalization of Beta distribution.
multinomial          Multivariate generalization of the binomial distribution.
multivariate_normal  Multivariate generalization of the normal distribution.
==================== =========================================================

==================== =========================================================
Standard distributions
==============================================================================
standard_cauchy      Standard Cauchy-Lorentz distribution.
standard_exponential Standard exponential distribution.
standard_gamma       Standard Gamma distribution.
standard_normal      Standard normal distribution.
standard_t           Standard Student's t-distribution.
==================== =========================================================

==================== =========================================================
Internal functions
==============================================================================
get_state            Get tuple representing internal state of generator.
set_state            Set state of generator.
==================== =========================================================

```

# rand&random&random_sample&ranf 

```python
numpy.random.random(size=None)
numpy.random.random(size=(2,3))
numpy.random.rand()
numpy.random.rand(2,3)
```

Uniformly distributed floats over ``[0, 1)``

产生从0-1的均匀分布，只接受一个产出值形状参数

* None默认一个数
* 整数产生n个随机数
* 有形状（用元组）则随机生成相应的一系列均匀分布随机数数值。
* 如果是rand则不需要元组，直接写一系列整数，相对舒服一些



# bytes 

Uniformly distributed random bytes.

```python
np.random.bytes(10)
# eh\x85\x022SZ\xbf\xa4
```

随机生成n个字节的字符串，不太常用



# randint（random_integers已经弃用）

Uniformly distributed integers in a given range.

一定范围内随机整数,[low,high），没有low就默认从0开始

dtype决定是64位int还是32位int，小细节

```python
np.random.randint(low,high,size,dtype)
np.random.randint(3，size=(2,2))
array([[0, 2],
       [0, 1]])
```



# randn

Normally distributed values.

随机标准正态数据

```python
np.random.randn(d0, d1, ..., dn)
```



# permutation&shuffle

permutation --Randomly permute a sequence / generate a random sequence.

随机排列序列，或者生产随机序列

```python
np.random.permutation(x)
```

实现了一个比较奇特的重载：

* 如果x是整数，那么是对`np.arange(x)`的重新排列--于是是一个随机序列
* 如果x是一维数组，那么就是对数组的排列（和shuffle一个效果，但是不修改原数据）
* 多维数组只对第一个维度做重新随机排列

shuffle --Randomly permute a sequence in place.

原位重排列

```python
np.random.shuffle(x)
```



# choice

Random sample from 1-D array.

从一维数组随机采样

```python
choice(a, size=None, replace=True, p=None)
```

* a可以是数组，或者整数（相当于`np.arange(a)`）
* size是采样输出的形状
* replace为真即有放回抽样
* 可以设置不等概率采样（默认等概率）



# seed

Seed the random number generator.

设置随机数种子，这样后面的所有随机操作数据是不变的

```python
np.random.seed(2333)
```



