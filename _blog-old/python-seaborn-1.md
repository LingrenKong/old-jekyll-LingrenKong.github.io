---
title: seaborn学习笔记（1）--Distribution图
mathjax: false
date: 2020-05-08 08:07:18
tags:
- Python
- Seaborn
categories:
- 学习
- Python
- 可视化
- seaborn
---

Distribution图的文档翻译与学习

https://seaborn.pydata.org/tutorial/distributions.html

<!--more-->

# Visualizing the distribution of a dataset 数据集分布的可视化

When dealing with a set of data, often the first thing you’ll want to do is get a sense for how the variables are distributed. This chapter of the tutorial will give a brief introduction to some of the tools in seaborn for examining univariate and bivariate distributions. You may also want to look at the categorical plots chapter for examples of functions that make it easy to compare the distribution of a variable across levels of other variables.

在处理一组数据时，通常首先要做的是了解变量是如何分布的。本章将简要介绍seaborn中用于检查单变量和双变量分布的一些工具。您可能还想查看分类图一章中的函数示例，这些函数使比较变量在其他变量级别上的分布变得很容易。


```python
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from scipy import stats 
```


```python
sns.set(color_codes=True)
np.random.seed(1)
```

导入的包有
* numpy--矩阵向量运算
* pandas--dataframe操作
* seaborn
* plt--是seaborn的基础，sns实际上是对plt的封装
* stats--提供统计函数

sns.set可以设定出seaborn的配置（此处控制了配色）

设定随机数有助于数据的稳定性，这样画出来的图是一样的

## Plotting univariate distributions 单变量分布图

The most convenient way to take a quick look at a univariate distribution in seaborn is the distplot() function. By default, this will draw a histogram and fit a kernel density estimate (KDE).

要快速查看seaborn中的单变量分布，最方便的方法是使用distplot()函数。默认情况下，这将绘制一个直方图并**拟合核密度估计(KDE)**。

P.S. seaborn在这方面最大的优势就是提供一个默认的核密度估计，虽然画图速度变慢，但是特别棒。


```python
x = np.random.normal(size=100)
sns.distplot(x);
```

{% asset_img output_5_0.png  %}


### Histograms直方图

Histograms are likely familiar, and a hist function already exists in matplotlib. A histogram represents the distribution of data by forming bins along the range of the data and then drawing bars to show the number of observations that fall in each bin.

To illustrate this, let’s remove the density curve and add a rug plot, which draws a small vertical tick at each observation. You can make the rug plot itself with the rugplot() function, but it is also available in distplot():

直方图我们可能很熟悉，而且在matplotlib中已经存在一个hist函数。直方图表示数据的分布，它沿着数据的范围形成箱子，然后绘制条带*（与条形图不同）* 来显示每个箱子中的观测数据的数量。

为了说明这一点，我们删除密度曲线并添加一个rug plot，**它在每个观察值上画一个小的垂直刻度**。你可以用rugplot()函数创建rugplot，但也可以在distplot()中使用；

rug给出的小竖线对应的是每个数据点，可以减少直方图对数据分组产生的信息损失

P.S.实际上displot相当于是集大成了，可以用选项来控制使用不同的子方法，这也是sns简便之处


```python
sns.distplot(x, kde=False, rug=True);
```

{% asset_img output_7_0.png  %}


When drawing histograms, the main choice you have is the number of bins to use and where to place them. distplot() uses a simple rule to make a good guess for what the right number is by default, but trying more or fewer bins might reveal other features in the data:

在绘制直方图时，您的主要选择是**要使用的箱子的数量和放置它们的位置**。distplot()使用一个简单的规则来猜测默认情况下正确的数字是多少，但是尝试使用更多或更少的箱子可能会揭示数据中的其他特性:

P.S.有一个控制格子数的参数bins非常合理


```python
sns.distplot(x, bins=20, kde=False, rug=True);
```

{% asset_img output_9_0.png  %}


### Kernel density estimation核密度估计

The kernel density estimate may be less familiar, but it can be a useful tool for plotting the shape of a distribution. Like the histogram, the KDE plots encode the density of observations on one axis with height along the other axis:

核密度估计对我们可能不太熟悉，但它可以作为绘制分布形状的有用工具。与柱状图一样，KDE图在一个轴上编码观察的密度，在另一个轴上编码高度:

`seaborn.kdeplot(data, data2=None, shade=False, vertical=False, kernel='gau', bw='scott', gridsize=100, cut=3, clip=None, legend=True, cumulative=False, shade_lowest=True, cbar=False, cbar_ax=None, cbar_kws=None, ax=None, **kwargs)`

函数如上面所说：
- data是数据输入（一维度数组）
- 如果有data2就是二维的核密度估计了
- shade--是否在函数下面加阴影
- vertical
- 有多种kernel可选：{‘gau’ | ‘cos’ | ‘biw’ | ‘epa’ | ‘tri’ | ‘triw’ },其中二维只能用高斯核函数
- bw是bandwidth的缩写，有两种自动估计方法，也可以输入标量自己定（或者二维一对标量）{‘scott’ | ‘silverman’ | scalar | pair of scalars }
- gridsize控制格点密度（如果格点太多计算就复杂了）
- cut处理极值
- clip限定用于绘图的数据点个数
- legend图例
- cumulative：给出kde函数的累计密度$F(x)$
- shade_lowest二维用到的参数
- cbar：给二维一个颜色条（因为二维kde的密度用颜色表示）
    - cbar_ax：颜色条画在哪里
    - cbar_kws：颜色条参数
- ax：画在哪个轴上（ax是plt的概念）
- **kwargs：就是其他参数


```python
sns.distplot(x, hist=False, rug=True);
```

{% asset_img output_12_0.png  %}


Drawing a KDE is more computationally involved than drawing a histogram. What happens is that each observation is first replaced with a normal (Gaussian) curve centered at that value:

Next, these curves are summed to compute the value of the density at each point in the support grid. The resulting curve is then normalized so that the area under it is equal to 1:

**绘制KDE比绘制直方图更涉及计算开销**。发生的情况是，每个观测首先被一个以该值为中心的正常(高斯)曲线所取代

然后，对这些曲线求和，计算网格中每个点的密度值。然后对得到的曲线进行归一化处理，使曲线下的面积等于1

P.S.这个是对KDE的讲解，tarpz这种积分工具函数和画图关系不大


```python
x = np.random.normal(0, 1, size=30)
bandwidth = 1.06 * x.std() * x.size ** (-1 / 5.)
support = np.linspace(-4, 4, 200)

kernels = []
for x_i in x:

    kernel = stats.norm(x_i, bandwidth).pdf(support)
    kernels.append(kernel)
    plt.plot(support, kernel, color="r")

sns.rugplot(x, color=".2", linewidth=3);
```

{% asset_img output_14_0.png  %}



```python
from scipy.integrate import trapz
density = np.sum(kernels, axis=0)
density /= trapz(density, support)
plt.plot(support, density);
```

{% asset_img output_15_0.png  %}


We can see that if we use the kdeplot() function in seaborn, we get the same curve. This function is used by distplot(), but it provides a more direct interface with easier access to other options when you just want the density estimate:

我们可以看到，如果在seaborn中使用kdeplot()函数，我们会得到相同的曲线。distplot()使用这个函数，但它（kde）提供了一个更直接的接口，当您只想要密度估计时，可以更容易地访问其他选项（应该是指kde这个方法的参数）:


```python
sns.kdeplot(x, shade=True);
```

{% asset_img output_17_0.png  %}


The bandwidth (bw) parameter of the KDE controls how tightly the estimation is fit to the data, much like the bin size in a histogram. It corresponds to the width of the kernels we plotted above. The default behavior tries to guess a good value using a common reference rule, but it may be helpful to try larger or smaller values:

KDE的bandwidth (bw)参数控制估计与数据的匹配程度，就像直方图中的bin大小一样。它对应于我们在上面绘制的内核的宽度。默认情况会使用一个公共的参考规则来猜测一个好的值，但是如果你去尝试更大或更小的值或许会更好:

【理解】如果宽度太大，就看起来都是一个唯一的正态分布了（绿色），而如果宽度太小和直方图宽过小一样，会过于关注单个数据的特质，有太多的峰（橙色）


```python
sns.kdeplot(x)
sns.kdeplot(x, bw=.2, label="bw: 0.2")
sns.kdeplot(x, bw=2, label="bw: 2")
plt.legend();
```

{% asset_img output_19_0.png  %}


As you can see above, the nature of the Gaussian KDE process means that estimation extends past the largest and smallest values in the dataset. It’s possible to control how far past the extreme values the curve is drawn with the cut parameter; however, this only influences how the curve is drawn and not how it is fit:

正如在上面所看到的，高斯KDE过程的本质意味着对数据集从最小到最大值的区间上一个估计。你可以用CUT控制kde曲线的范围，然而，这只影响如何绘制曲线，而不是如何拟合:

【下例就是cut=0的时候，截取到数据的两端，没有往外画】


```python
sns.kdeplot(x, shade=True, cut=0)
sns.rugplot(x);
```

{% asset_img output_21_0.png  %}


## Fitting parametric distributions

You can also use distplot() to fit a parametric distribution to a dataset and visually evaluate how closely it corresponds to the observed data:

你还可以使用distplot()将参数分布拟合到数据集，并直观地评估它与观察到的数据的密切程度:

下图为一个伽马分布的分布与数据直方图

【这个拟合线不是kde，而是对于数据，按照给定fit为gamma分布族进行了参数估计画出来的密度】


```python
x = np.random.gamma(6, size=200)
sns.distplot(x, kde=False, fit=stats.gamma);
```

{% asset_img output_23_0.png  %}


# Plotting bivariate distributions 两个变量的分布画图

It can also be useful to visualize a bivariate distribution of two variables. The easiest way to do this in seaborn is to just use the jointplot() function, which creates a multi-panel figure that shows both the bivariate (or joint) relationship between two variables along with the univariate (or marginal) distribution of each on separate axes.

将两个变量的二元分布形象化也很有用。在seaborn中，最简单的方法是使用jointplot()函数，它创建一个多面板图形，显示两个变量之间的二元(或联合)关系，以及**每个变量在不同轴上的单变量(或边际)分布**。


```python
# 数据
mean, cov = [0, 1], [(1, .5), (.5, 1)]
data = np.random.multivariate_normal(mean, cov, 200)
df = pd.DataFrame(data, columns=["x", "y"])
```

## Scatterplots散点图

The most familiar way to visualize a bivariate distribution is a scatterplot, where each observation is shown with point at the x and y values. This is analogous to a rug plot on two dimensions. You can draw a scatterplot with scatterplot(), and it is also the default kind of plot shown by the jointplot() function:

将二元分布形象化的最常见方法是散点图，其中每个观察点都指向x和y值。这类似于二维化的rug。你可以用scatterplot()绘制散点图，它也是jointplot()函数显示的默认类型的图:


```python
sns.jointplot(x="x", y="y", data=df);
```

{% asset_img output_27_0.png  %}


## Hexbin plots六方/蜂巢图

A bivariate analogue of a histogram is known as a “hexbin” plot, because it shows the counts of observations that fall within hexagonal bins. This plot works best with relatively large datasets. It’s available through in matplotlib as matplotlib.axes.Axes.hexbin() and as a style in jointplot(). It looks best with a white background:

直方图的双变量模拟图被称为“蜂巢图”，因为它显示了六角形桶内的观察计数。此图最适用于相对较大的数据集。它可以在matplotlib中作为matplotlib.ax .ax .hexbin()获得，也可以作为一种风格在jointplot()中获得。白色背景看起来最好:


```python
x, y = np.random.multivariate_normal(mean, cov, 1000).T
with sns.axes_style("white"):
    sns.jointplot(x=x, y=y, kind="hex", color="k");
```

{% asset_img output_29_0.png  %}


## Kernel density estimation 二维核密度

It is also possible to use the kernel density estimation procedure described above to visualize a bivariate distribution. In seaborn, this kind of plot is shown with a contour plot and is available as a style in jointplot():

也可以使用上面描述的核密度估计程序来可视化双变量分布。在seaborn中，这种图用等高表示，在jointplot()中可以作为一种风格使用:


```python
sns.jointplot(x="x", y="y", data=df, kind="kde");
```

{% asset_img output_31_0.png  %}


You can also draw a two-dimensional kernel density plot with the kdeplot() function. This allows you to draw this kind of plot onto a specific (and possibly already existing) matplotlib axes, whereas the jointplot() function manages its own figure:

你也可以使用kdeplot()函数绘制二维核密度图。这允许你在一个特定的(可能已经存在的)matplotlib轴上绘制这种绘图，而jointplot()函数管理它自己的图形:【就是简便VS可叠加】


```python
f, ax = plt.subplots(figsize=(6, 6))
sns.kdeplot(df.x, df.y, ax=ax)
sns.rugplot(df.x, color="g", ax=ax)
sns.rugplot(df.y, vertical=True, ax=ax);
```

{% asset_img output_33_0.png  %}


If you wish to show the bivariate density more continuously, you can simply increase the number of contour levels:

还可以画的更加连续--增加contour程度（nlevels）


```python
f, ax = plt.subplots(figsize=(6, 6))
cmap = sns.cubehelix_palette(as_cmap=True, dark=0, light=1, reverse=True)
sns.kdeplot(df.x, df.y, cmap=cmap, n_levels=60, shade=True);
```

{% asset_img output_35_0.png  %}


The jointplot() function uses a JointGrid to manage the figure. For more flexibility, you may want to draw your figure by using JointGrid directly. jointplot() returns the JointGrid object after plotting, which you can use to add more layers or to tweak other aspects of the visualization:

可以使用一个JointGrid来管理图形，从而更加灵活。在绘制之后，返回的是一个JointGrid对象，你可以用它来添加更多的层或者调整可视化的其他方面:

下图就是添加了tex轴标签，增加了散点在kde上面


```python
g = sns.jointplot(x="x", y="y", data=df, kind="kde", color="m")
g.plot_joint(plt.scatter, c="w", s=30, linewidth=1, marker="+")
g.ax_joint.collections[0].set_alpha(0)
g.set_axis_labels("$X$", "$Y$");
```

{% asset_img output_37_0.png  %}


# Visualizing pairwise relationships in a dataset可视化数据中的成对关系

To plot multiple pairwise bivariate distributions in a dataset, you can use the pairplot() function. This creates a matrix of axes and shows the relationship for each pair of columns in a DataFrame. By default, it also draws the univariate distribution of each variable on the diagonal Axes:

要在数据集中绘制多个成对的双变量分布，可以使用pairplot()函数。这将创建一个轴矩阵，并显示DataFrame中每对列的关系。默认情况下，它还绘制每个变量在对角线上的单变量分布:


```python
iris = sns.load_dataset("iris")
sns.pairplot(iris);
```

{% asset_img output_39_0.png  %}


Specifying the hue parameter automatically changes the histograms to KDE plots to facilitate comparisons between multiple distributions.

指定hue参数会自动将直方图更改为KDE图，以方便在多个分布之间进行比较。

【hue指定的是使用df的里面一个类别标签作为分类标】


```python
sns.pairplot(iris, hue="species");
```

{% asset_img output_41_0.png  %}


Much like the relationship between jointplot() and JointGrid, the pairplot() function is built on top of a PairGrid object, which can be used directly for more flexibility:

就像jointplot()和JointGrid之间的关系一样，pairplot()函数是建立在一个PairGrid对象之上的，可以直接使用Grid对象，可以获得更大的灵活性:


```python
g = sns.PairGrid(iris)
g.map_diag(sns.kdeplot)
g.map_offdiag(sns.kdeplot, n_levels=6);
```

{% asset_img output_43_0.png  %}