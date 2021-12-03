---
title: 博客搭建(3)--数学渲染的坑
tags: 
- 博客搭建
- 技术
---

【注：这是过去使用的github博客搭建方案，现在已经更换到jekyll】

关于hexo数学加载的坑

<!--more-->

hexo可以启用mathjax来渲染markdown里面的数学符号，但是它的引擎有点问题，会把`_a_`这种下划线包裹识别为斜体，导致数学公式里面出现符号`<em>`而故障，还有下划线有时候也会出现问题。



为了解决这个问题，我参考了`https://www.jianshu.com/p/c9beedaf08e4`这篇文章，其中有手动修改原引擎正则表达式的方法，但是我的正则表达式和这个博客不一样，看的晕了 ，所以尝试了更换引擎的方法。

在hexo项目的路径下面输入如下指令，成功更换了引擎

```
npm uninstall hexo-renderer-marked --save
npm install hexo-renderer-pandoc --save
```

然而……数学公式还是不行（这次连generate指令都坏掉了，网上找不到这个问题的解决）

```
Error:
[ERROR][hexo-renderer-pandoc] pandoc exited with code null.
```

于是卸载重新装hexo的原生数学：

```
npm install hexo-renderer-marked --save
npm uninstall hexo-renderer-pandoc --save
```



然后尝试手动修改正则表达式：

位置node_modules\marked\lib\marked.js

然后修改inline部分的正则表达式

* 一个是em斜体：把用下划线匹配的表达式删去（不同版本表达式不一样，需要自己看）
* 另一个就是`\\`的转义，需要修改escape那一项的正则表达式

这样修改之后就可以成功加载出来了