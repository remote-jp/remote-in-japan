'use strict'
module.exports = {
  compile: compile,
  setOptions: setOptions
}

var options = {}
options.pattern = /\{(.*?)\}/g
options.template = ''
options.middleware = function () {}

function setOptions (_options) {
  options.pattern = _options.pattern || options.pattern
  options.template = _options.template || options.template
  if (typeof _options.middleware === 'function') {
    options.middleware = _options.middleware
  }
}

function compile (data) {
  return options.template.replace(options.pattern, function (match, prop) {
    var value = options.middleware(prop, data[prop], options.template)
    if (typeof value !== 'undefined') {
      return value
    }
    return data[prop] || match
  })
}
