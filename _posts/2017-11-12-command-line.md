---
layout: post
title: "Command Line Tool"
description: "Configure and manage WeDeploy projects right from your terminal."
date:   2017-11-12 17:46:41 -0300
categories: start blog
by: 'Gustavo Quinalha'
icon: 'credit-card'
---

<div class="margin-top-20 margin-bottom-50">
{% for x in site.data.third %}
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
