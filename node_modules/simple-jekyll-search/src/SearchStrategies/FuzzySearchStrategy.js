'use strict'
var fuzzysearch = require('fuzzysearch')

module.exports = new FuzzySearchStrategy()

function FuzzySearchStrategy () {
  this.matches = function (string, crit) {
    return fuzzysearch(crit, string)
  }
}
