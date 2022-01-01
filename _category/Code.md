---
layout:  articles
titles: 软件与编程
sidebar:
    nav: CODE
---

<ul>
    {% for cat in site.categories %}
        {% if cat[0] == "Code" %}
        {% for post in cat[1] %}
        {{post.date | date:"%d/%m/%Y"}}
        <font size="3"><a href="{{post.url}}" title="{{ cat[0] }}">{{post.title}}</a></font>
        <br>
        {% endfor %}
        {% endif %}
    {% endfor %}
</ul>


