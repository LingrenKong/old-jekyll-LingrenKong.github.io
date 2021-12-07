---
title: 博客搭建-新
tags: 
- 技术
- 博客搭建
---

如何通过`jekyll`和`github-pages`搭建自己的个人博客

<!--more-->

# 动机



# 工具



## jekyll引擎：



## PicGo图床结合阿里云

配置安装参考[这个](https://zhuanlan.zhihu.com/p/104152479)

注意记得设置公共读取权限~

设置上传成功之后，就可以用链接访问了，这个是typora上传测试结果：

![typora测试icon](https://klr-picgo.oss-cn-beijing.aliyuncs.com/img/typora-icon.png)

{:.info}

阿里云OSS有个小坑，链接访问是直接下载，不过在网站网页和typora都可以正常显示，所以问题不大。另外就是要注意，picgo上传可能会因为梯子或者短时间上传过多失败，一般等等就好了。



## Typora



# 一些配置调整

模板作者有很好的[中文](https://tianqi.name/jekyll-TeXt-theme/docs/zh/quick-start)和[英文](https://tianqi.name/jekyll-TeXt-theme/docs/en/quick-start)文档，因此操作是参照文档来调整的，这里主要是记录一下我的个性化方案。其他的还请自行参考文档。

关于jekyll的高级参考（有点旧了）：https://crispgm.com/page/48-tips-for-jekyll-you-should-know.html

github page支持的插件：https://pages.github.com/versions/

## 安装模式

我选取的是主题安装，因此还需要手动从作者的模板页面获取部分文件。

需要额外活动的内容：

- `_includes`文件夹



## 主题选取

作者在`_config.yaml`{:.info}中提供了多种颜色和代码高亮主题，我决定选取`orange`+`tommorow`，不过实际上能用的颜色皮肤主题并不是6个，因为在改变皮肤颜色时候，其他功能比如`{:.info}`没有对应的配色变换，因此基准背景色只能在白色或者近似白色情况下才具有最好的效果。



## 关于预览效果

在`index.html`{:.info}文件中，有选项控制预览显示，由于之前Hexo已经习惯了手动设置预览分栏线，因此沿袭过往的模式（另外确实`text`预览模式有点丑）

```yaml
articles:
    excerpt_type: html
```



## markdown增强

markdown扩展语法也在`_config.yaml`{:.info}中。由于typora也支持`mathjax`和`mermaid`，所以我开启了这两个，没有开启chart。多两个插件，网速应该不是太大问题。

```yaml
## Mathjax
mathjax: true # false (default), true
mathjax_autoNumber: false # false (default), true

## Mermaid
mermaid: true # false (default), true

## Chart
chart: # false (default), true
```

对于数学公式，我平时用的typora偏好中，我没有勾选自动编号，因此在博客上面也默认不开启了。

测试功能：

- 内联`$$`：$\alpha$
- 内联`\\( \\)`:\\( \beta\\) 【typora不支持】
- 行间`$$$$`：

$$
\int_0^\infty x^{a-1}e^{-x}=\Gamma(a)
$$

- 行间`\\[\\]`：【typora不支持】

\\[
\int_0^\infty x^{a-1}e^{-x}=\Gamma(a)
\\]

## logo

暂时没想好用什么……



## 个性化页面-404

放了一个我家的猫猫图，但是404页面不支持图片定义的圆角这些类，所以只能直接放了。

![猫猫图]({{site.url}}/assets/my-cat.jpg){:.circle}




## 创建新文章

自己动手，丰衣足食，注意到`_template.md`这种下划线开头不会被加载，我们可以直接做一个模板文件，然后利用复制的方式来生产新的文件。

为了节约掉写日期的麻烦，所以写了个`create.bat`文件：

```sh
set yyyy=%date:~,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set /p title= #接收标题名称
copy _template.md "%yyyy%-%mm%-%dd%-%title%.md"
```



实现分类：https://smartadpole.github.io/tool/blog/2021/01/18/TeXt-theme-head.html
