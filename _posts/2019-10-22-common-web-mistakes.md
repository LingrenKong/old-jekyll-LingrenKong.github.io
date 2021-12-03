---
title: 网页制作迷惑行为大赏
tags: 
- HTML
- 学习
---



摘要

<!--more-->

很多人都说网页制作比其他程序容易，然而网页制作一样有很多大坑。以下是我和我认识的人遇到过的奇怪坑。



# HTML

## 错拼标签

### href

都说写HTML和写文字差不多，然而乱七八糟标签总会让人在一开始迷了眼。

```html
<a href="https:\\www.baidu.com">链接到百度</a> <!--这个是有效的-->
<a href="www.baidu.com">链接到百度</a> <!--是个链接，但是进入的是当前页面下的目录-->
<a herf="https:\\www.baidu.com">链接到百度</a> <!--看起来非常正常，但是点不开，拼写错了href-->
```

[链接到百度](https://www.baidu.com/)
[链接到百度](https://lingrenkong.github.io/2019/10/22/common-mistakes-for-web/www.baidu.com)
链接到百度

`by森鸾`{:.info}

### method-no-r

类似的还有似懂非懂的英文理解，比如说`<button method="post">按钮</button>`按钮，如果拼写成`methord`就尴尬了。

`by我`{:.info}

# 感谢列表

森鸾