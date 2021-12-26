---
title: 基于Typora的Markdown使用指南
tags: 
- 技术
- Markdown
- Typora
---

整理一下基于Typora的Markdown使用相关操作

（逐步更新中）

<!--more-->

# 关于软件

我目前使用的是Typora正式版的最新版本，不过最新版本目前的特性基本上和最后一个beta版本是一致的，除了付费之外区别很小。

## 版本差异

关于更新的区别参见官方[公告](https://support.typora.io/What's-New-1.0/#new)，这里我只简略介绍重点。这些重点实际上是最后一套正式版前的`beta 0.11.x`的，所以正式版目前可能真的只有付费区别。

更新重点：

- 支持ARM架构的电脑了
- 数学公式从`mathjax2`升级到`mathjax3`
  - 与此同时默认换行保持和`mathjax2`一致，允许`\\`作为换行（`mathjax3`要用`\\displaylines{}`）
  - 增加了物理符号`tex`库的启用选项

![image-20211218124057997](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/image-20211218124057997.png)



## 获取

正式版：直接去[官网](https://typora.io/)购买或者试用即可。

beta版：在[历史版本](https://typora.io/releases/all)中下载

- Windows/Linux：https://typora.io/windows/dev_release.html
- Mac：https://typora.io/dev_release.html



# 数学公式

Typora的数学公式加载功能基于`Mathjax`，正式版和`beta 0.11.x`是3，之前的版本是2

数学公式的比较可以在[这个网页](https://www.intmath.com/cg5/katex-mathjax-comparison.php)观看实时测评

## 公式块

公式块在Typora中采用`$$+换行+$$`的模式，不能识别`Mathjax`所默认的`\[\]`功能，不过这也是大部分Markdown语法实现的公式支持方案。

> 注：`Mathjax`用`\[\]`作为推荐公式块（displayed equations）并兼容支持`$$`作为公式块符号。

插入方式：

1. 首先输入两个美元符号`$$`，然后输入回车，会激活自动补全并开启公式块预览。注意**必须要有换行**，否则无法被Typora有效识别。

2. 右键，插入-公式块（`Ctrl+Shift+M`）

公式块在光标点击状态下是两栏，第一栏输入源码，第二栏展现预览，如下图。如果光标到其他位置则只展示公式加载效果

![image-20211218130758340](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/image-20211218130758340.png)

实际加载效果：

$$
\begin{equation}
Y=X\beta+\epsilon
\end{equation}
$$

这就是公式块的插入和对应操作。



## 内联公式

`Mathjax`采用`\(\)`作为内联公式（in-line math），因为美元符号可能是作为本身意义使用，因此不默认使用`$`。

如果要把你的Markdown文件架设到网页端，还需要用到官网的一个技巧：插入一个`script`来更改设置：

```javascript
window.MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']]
  }
};
```

同样的，在Typora中，也需要类似的操作，需要修改默认设置：

偏好设置->Markdown->Markdown扩展语法

![image-20211218130251033](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/image-20211218130251033.png)



插入方式：

1. 手动输入`$xxx$`
2. 先输入一个美元符号，然后按`esc`，就会触发自动补全（中文￥不行）



和公式块类似，也是不点击的情况下显示加载的数学效果，光标点到的时候会变为输入界面，预览效果也是显示在下面。下面是一个示例：

![内联的预览效果](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/image-20211218132504227.png)

如果内联公式比较多，预览来回来去弹出会比较乱，那么其实比较适合开启源代码模式来进行书写。

## 表格与公式

并不是所有Markdown编辑器都支持在表格内部放公式，不过Typora是可以在表内放置并加载内联公式的。

|   源码   |   公式   |
| :------: | :------: |
| `\alpha` | $\alpha$ |
| `\infty` | $\infty$ |



## 速查表-变量

这个速查表的内容来自VScode插件[LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)提供的snippet-Greek/Hebrew Letters

对于希腊字母按照大小写进行了对应，最右侧是希伯莱语字母。

| 源码          | 公式          | 源码    | 公式        | 源码   | 公式      |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| `\alpha`     | $\alpha$     |  `A`           | $A$           | `\aleph`   | $\aleph$   |
| `\beta`      | $\beta$      | `B` | $B$ | `\beth` | $ \beth $ |
| `\gamma`     | $\gamma$     | `\Gamma ` | $\Gamma$ | `\daleth` | $\daleth$ |
|   -  | -   |`\varGamma`   | $\varGamma$   | `\gimel` | $ \gimel $ |
| `\delta` | $\delta$ | `\Delta` | $\Delta$ |  |  |
| - | - | `\varDelta` | $\varDelta$ |  |  |
| `\epsilon`   | $\epsilon$   | `E` | $E$ |  |  |
| `\zeta`      | $\zeta$      | `Z` | $Z$ |  |  |
| `\eta`       | $\eta$       | `H` | $H$ |  |  |
| `\theta`      | $\theta$      | `\Theta` | $\Theta$ |  |  |
| `\vartheta`   | $\vartheta$   | `\varTheta` | $\varTheta$ |  |  |
| `\iota`      | $\iota$      | `I` | $I$ |  |  |
| `\kappa`    | $\kappa$    | `K` | $K$ |  |  |
| `\lambda`   | $\lambda$   | `\Lambda` | $\Lambda$ |  |  |
|  - |  - |`\varLambda`  | $\varLambda$  |   |   |
| `\mu`        | $\mu$        | `M` | $M$ |  |  |
| `\nu`        | $\nu$        | `N` | $N$ |  |  |
| `\xi`         | $\xi$         | `\Xi` | $\Xi$ |  |  |
|   -   |    -   | `\varXi`      | $\varXi$      |       |       |
| `o`           | $o$          | `O` | $O$ |  |  |
| `\pi`        | $\pi$        | `\Pi` | $\Pi$ |  |  |
| `\varpi`     | $\varpi$     | `\varPi` | $\varPi$ |  |  |
| `\rho`        | $\rho$        | `P` | $P$ |  |  |
| `\varrho`     | $\varrho$     | - | - |  |  |
| `\sigma`     | $ \sigma$     | `\Sigma` | $\Sigma$ |  |  |
| `\varsigma`   | $\varsigma$   | `\varSigma` | $\varSigma$ |  |  |
| `\tau`       | $ \tau$       | `T` | $T$ |  |  |
| `\upsilon`    | $\upsilon$    | `\Upsilon ` | $\Upsilon $ |  |  |
|  - | - |`\varUpsilon` | $\varUpsilon$ |  |  |
| `\phi`        | $\phi$        | `\Phi` | $\Phi$ |  |  |
| `\varphi`     | $\varphi$     | `\varPhi` | $\varPhi$ |  |  |
| `\chi`        | $\chi$        | `X` | $X$ |  |  |
| `\psi`        | $\psi$        | `\Psi` | $\Psi$ |  |  |
|    -   |   -   |`\varPsi`     | $\varPsi$     |      |      |
| `\omega`      | $\omega$      | `\Omega` | $\Omega$ |  |  |
| - | - |`\varOmega`   | $\varOmega$   |    |    |



