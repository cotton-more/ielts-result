'use strict'

path = require 'path'
request = require 'request'

class Get
    data = {}
    constructor: (filename) ->
        data = require path.resolve filename

    fetchResult: (cb = ->) ->
        request {
            url: 'http://ielts-moscow.ru/ajax/get_results.php'
            qs: data
        }, cb

exports = module.exports = Get
