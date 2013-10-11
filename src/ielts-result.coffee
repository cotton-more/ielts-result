###
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
###
'use strict'

process.abort() if process.argv.length < 4

Get = require './get'
Smsru = require './smsru'

get = new Get process.argv[2]
smsru = new Smsru process.argv[3]

get.fetchResult (res) ->
    res.setEncoding 'utf8'

    data = ''
    res.on 'data', (d) ->
        data += d

    res.on 'end', ->
        console.log data
        smsru.send data
