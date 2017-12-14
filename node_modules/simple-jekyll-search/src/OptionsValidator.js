'use strict'
module.exports = function OptionsValidator (params) {
  if (!validateParams(params)) {
    throw new Error('-- OptionsValidator: required options missing')
  }
  if (!(this instanceof OptionsValidator)) {
    return new OptionsValidator(params)
  }

  var requiredOptions = params.required

  this.getRequiredOptions = function () {
    return requiredOptions
  }

  this.validate = function (parameters) {
    var errors = []
    requiredOptions.forEach(function (requiredOptionName) {
      if (typeof parameters[requiredOptionName] === 'undefined') {
        errors.push(requiredOptionName)
      }
    })
    return errors
  }

  function validateParams (params) {
    if (!params) {
      return false
    }
    return typeof params.required !== 'undefined' && params.required instanceof Array
  }
}
