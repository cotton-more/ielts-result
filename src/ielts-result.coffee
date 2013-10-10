###
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
###
'use strict'

Get = require './get/get'

get = new Get 'test/exam.json'

get.fetchResult (res) ->
    res.setEncoding 'utf8'

    data = ''
    res.on 'data', (d) ->
        data += d

    res.on 'end', ->
        console.log data
