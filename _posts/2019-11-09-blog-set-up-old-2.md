---
title: 博客搭建(2)
tags: 
- 技术
- 博客搭建
---

【注：这是过去使用的github博客搭建方案，现在已经更换到jekyll】

本篇涉及HEXO的基本指令以及如何配置一个主题（以NEXT为例）

<!--more-->



# HEXO基本指令

```
hexo server/s 运行服务器
hexo generate/g 生成
hexo g -d 生成并部署
hexo deploy/d 部署到服务器
```

# 主题配置

本文采用的是NEXT主题，但是主题的基本配置是相同的

最全配置可以看[这个](http://theme-next.iissnan.com/theme-settings.html)

在配置之前先看一下目录（有两个文件被隐藏–`.deploy_git .gitignore`）：

```shell
$ dir
_config.yml  node_modules  package-lock.json  scaffolds  themes
db.json      package.json  public             source
```

里面的`.json`文件是一些配置，初级操作用不到

`node_modules`文件夹是`node.js`的一些内容，初级操作也用不到

`public .deploy_git`文件夹是已经生成好的HTML，是用来预览/部署到服务器的

`source`是存放创建的markdown的文件夹，下面含有2+n个文件夹

- _drafts：草稿箱
- _posts：博客帖子
- 其他文件夹–通过`hexo new page "页面名"`来创建

`scaffolds`是`hexo new`指令创建新md文件时候的模板所在位置，包含：

- draft草稿：不会发布在正式博客的内容（但是可以`hexo s -d`本地查看草稿）
- page页面：用于创建一些额外的页面，比如说tags标签页
- post日志：最常用的，也是默认的类型，代表一篇博客
- [我的scaffolds配置](https://lingrenkong.github.io/2019/11/09/blog-setup-2/#我的scaffolds配置)

## 我的scaffolds配置

这个配置实际上是写一个md文件，之后指令生成的文件以它为基础（并且加上变量替换）

三横里面的是yaml，外面的是HTML/markdown内容

post：

```yaml
---
title: {{ title }} 双括号代表变量替换，title是创建指令给出的名字
date: {{ date }} date是系统自动的创建时间
mathjax: false 配置数学公式渲染为false，如果需要再自己改成true
tags: 标签，可以有多个，采用列表的形式
categories: 分类具有顺序性和层次性
---

<!--more--> 这个是hexo体系的助记符，在主页只显示到more之前
```

draft：

唯一区别是草稿没有创建日期（反正草稿发布是按照发布时间）

```yaml
---
title: {{ title }}
mathjax: false
tags:
categories:
---

<!--more-->
```

page：

```yaml
---
title: {{ title }}
date: {{ date }}
type: "某个类别" type不存在于默认的模板，添加type才会让page被识别为主题设定的东西
---
```
