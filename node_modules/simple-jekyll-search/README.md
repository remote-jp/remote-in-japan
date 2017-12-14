# Simple-Jekyll-Search

[![Build Status](https://travis-ci.org/christian-fei/Simple-Jekyll-Search.svg?branch=master)](https://travis-ci.org/christian-fei/Simple-Jekyll-Search)

A JavaScript library to add search functionality to any Jekyll blog.

Find it on [npmjs.com](https://www.npmjs.com/package/simple-jekyll-search).

Browser support should be about IE6+ with this `addEventListener` [shim](https://gist.github.com/eirikbacker/2864711#file-addeventlistener-polyfill-js).


# Installation

## npm

```
npm install simple-jekyll-search
```

## bower

```
bower install --save simple-jekyll-search
```


# Getting started

## Create `search.json`

Place the following code in a file called `search.json` in the **root** of your Jekyll blog.

This file will be used as a small data source to perform the searches on the client side:

```
---
---
[
  {% for post in site.posts %}
    {
      "title"    : "{{ post.title | escape }}",
      "category" : "{{ post.category }}",
      "tags"     : "{{ post.tags | join: ', ' }}",
      "url"      : "{{ site.baseurl }}{{ post.url }}",
      "date"     : "{{ post.date }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
]
```


## Using the plugin

You need to place the following code within the layout where you want the search to appear. (See the configuration section below to customize it)

For example in  **_layouts/default.html**:

```html
<!-- HTML elements for search -->
<div id="search-container">
  <input type="text" id="search-input" placeholder="search...">
  <ul id="results-container"></ul>
</div>

<!-- script pointing to jekyll-search.js -->
<script src="{{ site.baseurl }}/simple-jekyll-search.min.js"></script>
```


# Configuration

Customize SimpleJekyllSearch by passing in your configuration options:

```js
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json'
})
```

## searchInput (Element) [required]

The input element on which the plugin should listen for keyboard event and trigger the searching and rendering for articles.


## resultsContainer (Element) [required]

The container element in which the search results should be rendered in. Typically an `<ul>`.


## json (String|JSON) [required]

You can either pass in an URL to the `search.json` file, or the results in form of JSON directly, to save one round trip to get the data.


## searchResultTemplate (String) [optional]

The template of a single rendered search result.

The templating syntax is very simple: You just enclose the properties you want to replace with curly braces.

E.g.

The template

```html
<li><a href="{url}">{title}</a></li>
```

will render to the following

```html
<li><a href="/jekyll/update/2014/11/01/welcome-to-jekyll.html">Welcome to Jekyll!</a></li>
```

If the `search.json` contains this data

```json
[
    {
      "title"    : "Welcome to Jekyll!",
      "category" : "",
      "tags"     : "",
      "url"      : "/jekyll/update/2014/11/01/welcome-to-jekyll.html",
      "date"     : "2014-11-01 21:07:22 +0100"
    }
]
```


## templateMiddleware (Function) [optional]

A function that will be called whenever a match in the template is found.

It gets passed the current property name, property value, and the template.

If the function returns a non-undefined value, it gets replaced in the template.

This can be potentially useful for manipulating URLs etc.

Example:

```js
SimpleJekyllSearch({
  ...
  templateMiddleware: function(prop, value, template) {
    if (prop === 'bar') {
      return value.replace(/^\//, '')
    }
  }
  ...
})
```

See the [tests](src/Templater.test.js) for an in-depth code example


## noResultsText (String) [optional]

The HTML that will be shown if the query didn't match anything.


## limit (Number) [optional]

You can limit the number of posts rendered on the page.


## fuzzy (Boolean) [optional]

Enable fuzzy search to allow less restrictive matching.

## exclude (Array) [optional]

Pass in a list of terms you want to exclude (terms will be matched against a regex, so urls, words are allowed).


# Wiki

Check out the [wiki](https://github.com/christian-fei/Simple-Jekyll-Search/wiki)!


# Development

- `npm install`
- `npm test`

# Contributors

Thanks to all [contributors](https://github.com/christian-fei/Simple-Jekyll-Search/graphs/contributors) over the years! You are the best :)

> [@daviddarnes](https://github.com/daviddarnes)
[@XhmikosR](https://github.com/XhmikosR)
[@PeterDaveHello](https://github.com/PeterDaveHello)
[@mikeybeck](https://github.com/mikeybeck)
[@egladman](https://github.com/egladman)
[@midzer](https://github.com/midzer)
[@eduardoboucas](https://github.com/eduardoboucas)
[@kremalicious](https://github.com/kremalicious)
[@tibotiber](https://github.com/tibotiber)
and many others!

