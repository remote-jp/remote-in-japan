'use strict'
module.exports = {
  merge: merge,
  isJSON: isJSON
}

function merge (defaultParams, mergeParams) {
  var mergedOptions = {}
  for (var option in defaultParams) {
    mergedOptions[option] = defaultParams[option]
    if (typeof mergeParams[option] !== 'undefined') {
      mergedOptions[option] = mergeParams[option]
    }
  }
  return mergedOptions
}

function isJSON (json) {
  try {
    if (json instanceof Object && JSON.parse(JSON.stringify(json))) {
      return true
    }
    return false
  } catch (e) {
    return false
  }
}
