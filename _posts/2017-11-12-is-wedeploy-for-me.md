---
layout: post
title: "Is WeDeploy for me?"
description: "Understand how WeDeploy can make you and your team more productive."
date:   2017-11-12 17:46:41 -0300
categories: start blog
by: 'Gustavo Quinalha'
icon: 'help-circle'
---

<div class="margin-top-20 margin-bottom-50">
{% for x in site.data.first %}
<div class="list-item container ">
<div class="flex-grow-1">

  <div class="">
    <h2 class="list-post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{x.question}} :</a>
    </h2>
  </div>

  <div class="">
    <span class="list-post-description">
      {{x.answer}}
    </span>
  </div>

</div>
</div>
{% endfor %}
</div>
