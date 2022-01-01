---
layout: article
title: 分类
---



这里是分类页面。



<ul>
    {% for cat in site.categories %}
        {% for post in cat[1] %}
        {{post.date | date:"%d/%m/%Y"}}
        <font size="3"><a href="{{post.url}}">[{{ cat[0] }}]{{post.title}}</a></font>
        <br>
        {% endfor %}
    {% endfor %}
</ul>


