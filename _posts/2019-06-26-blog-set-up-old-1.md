---
title: 博客搭建(1)
tags: 
- 技术
- 博客搭建
---



【注：这是过去使用的github博客搭建方案，现在已经更换到jekyll】

<!--more-->

本篇涉及基本的HEXO配置，不涉及操作

作者的配置环境：（命令行用 XXX -v可以快捷查看）

- Node.js 10.16.0 (x64)
- npm 6.9.0
- hexo–见下方内容
- git version 2.20.1.windows.1
- markdown–使用typora作为编辑器

## 为什么这样做

GitHubPages–免费博客平台

HEXO–高端大气的主题设置

没有广告！支持后续添加插件！

## 如何做

概括来讲步骤有以下几步

- 拥有一个GitHub账号$\rightarrow$这一步so easy
- 创建一个repository（简称repo）
- 安装HEXO
- 学习markdown
- 使用HEXO

### 创建仓库(repository)

创建方式和平时创建repo同样，公开库，命名格式为`Username.github.io`用自己账号的名字

![建立仓库](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/setup-a-repo.png)

注意，使用hexo不需要将你的新建repo下载到本地再同步，因为hexo是拥有将本地内容推送到GitHub等第三方网站的功能的。

### 安装HEXO

#### P.S.为什么不用jekyll

jekyll是GitHub-pages使用的工作引擎，因此理论上使用jekyll是最佳方案，而且我也尝试了一下

然而……jekyll使用Ruby作为语言，而Ruby本来是适用于Linux系统的，Windows安装的时候我的电脑出了一堆bug，于是只好放弃了。

{:.info}

不过如今回来看，其实是有Ruby的Windows安装套件的，安装问题不大

与之相反，HEXO基于node.js，这个安装要友好很多

#### HEXO安装–node.js

node.js–[官网](https://nodejs.org/en/download/)下载即可，有一个比较好的[介绍](https://www.liaoxuefeng.com/wiki/1022910821149312/1023025597810528)
