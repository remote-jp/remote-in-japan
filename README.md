# Jekyll | Help Center
Simple and responsive Jekyll theme for help center.

# Demo
[Demo online](https://gustavoquinalha.github.io/jekyll-help-center-theme/)

![Color Theme](http://quinalha.me/jekyll-help-center-theme/assets/img/readme/responsive.png)

# Color theme
edit in _config.yml
```
color_theme:  "#0081ff"
color_text:  "#fff"
```

# Install
```
git clone https://github.com/gustavoquinalha/jekyll-help-center-theme
```
or
```
gem install jekyll-help-center-theme
```
https://rubygems.org/gems/jekyll-help-center-theme

# How to use
```
bundle exec jekyll serve --livereload --watch
```
Server address
```
localhost:4000/jekyll-help-center-theme/
```

# Post Example
```
---
layout: post
title: 'First category'
description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
date: 2017-11-12 17:46:41 -0300
categories: start blog
by: 'Gustavo Quinalha'
icon: 'credit-card'
questions:
  - question: 'Question 1'
    answer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    image: "1.gif"
  - question: 'Question 2'
    answer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    image: "2.gif"
  - question: 'Question 3'
    answer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    image: "3.gif"
  - question: 'Question 4'
    answer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    image: "4.gif"
---
```
## License
The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Inspired by
- https://help.market.envato.com/hc/en-us
- https://www.intercom.com/
