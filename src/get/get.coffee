'use strict'

path = require 'path'
http = require 'http'
querystring = require 'querystring'

class Get
    data = {}
    constructor: (filename) ->
        data = require path.resolve filename

    fetchResult: (cb = ->) ->
        options =
            host: 'ielts-moscow.ru'
            path: '/ajax/get_results.php?' + querystring.stringify data

        req = http.request options, cb

        req.end()

exports = module.exports = Get
