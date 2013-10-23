###
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
###
'use strict'

process.abort() if process.argv.length < 4

Smsru = require 'smsru'
path = require 'path'
request = require 'request'

# create smsru service instance
smsru = new Smsru process.argv[3]

# get data for request
data = require( path.resolve( process.argv[2] ) )

main = ->
    request {
        url: 'http://ielts-moscow.ru/ajax/get_results.php'
        qs: data
    }, (error, response, body) ->
        if ~body.indexOf('color:red') is 0
            smsru.send response.request.href, ->
                process.abort()
        else
            setTimeout ->
                console.log body
                main()
            , 2000

main()
