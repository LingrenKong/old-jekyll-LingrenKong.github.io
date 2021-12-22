---
title: docsify学习笔记
modified_date: 2021-12-22
tags: 
- 技术
- docsify
---

docsify 是一个从markdown生成文档的利器，来学习一下如何使用。

由于官方文档很好，所以这里主要是补充记录一些自己的理解和踩坑，会陆续更新。

<!--more-->

# 参考资源

[docsify官网](https://docsify.js.org/#/?id=docsify)

[中文新手教程](http://www.yii-china.com/docsify/quickstart.html)

# 安装



## node.js

首先需要安装基础工具：从[官网](https://nodejs.org/en/)下载，选择LTS（长期支持稳定版）

前面步骤一路顺风，按照默认路径即可，毕竟不是特别大。

然后勾选自动安装依赖项，减少工作量：

![image-20211210190836427](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/image-20211210190836427.png)



## docsify

按照官网的写法，同时指定淘宝镜像加速。

```sh
npm i docsify-cli -g --registry=https://registry.npm.taobao.org
```



# 使用

## 免安装版本

和其他引擎有重要区别的一点就是docsify是真正的纯静态网页，写完上传就行，都不需要进行编译。

因此，就有不安装也能用的方式，也就是教程说到的“ 手动初始化”，不依赖于工具也能直接手动创建`index.html`，然后就能在服务器看到静态网页效果。

当然，这个方法总归不那么好，所以最好还是用命令行工具来设置。

## 标准初始化

这里需要介绍一下，`docsify`的特点决定了它使用主要是超轻量级任务，所以常用于给个人代码库创建一个简单文档，没有个人博客的功能，所以一般放在`./docs`目录下面，正好便于github pages的启动。

```bash
docsify init ./docs 在./docs目录初始化
docsify serve docs 运行./docs目录的文件
```



# 踩坑笔记



## 路径

`docsify`的路径支持功能不是那么友好，如果是markdown路径链接，`./`这种表达式不会被解析，而且即便是在`<a></a>`块实现链接，我们也会发现，`./`对应的同级目录永远是根目录，和`/#/path`的模式不一样，因此似乎没办法弄成相对路径。

> 更新：实际上这个是高级选项，需要启动 [relativePath](https://docsify.js.org/#/configuration?id=relativepath) 功能



# 扩展

docsify一个重要特点在于，他的很多功能交给插件制作去实现（比如数学），因此除了官方文档，还需要自己找各种插件使用。

## 基本注意事项

扩展的放置位置要注意，不是随便放在HTML里面就行的。



## 数学

目前比较好的支持插件是[docsify-katex](https://upupming.site/docsify-katex/docs/#/)

插入之后，默认语法的单双美元都是得到支持的。
