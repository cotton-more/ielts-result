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

main = ->
    get.fetchResult (error, response, body) ->
        if ~body.indexOf('color:red') is 0
            smsru.send response.request.href, ->
                process.abort()
        else
            setTimeout ->
                console.log body
                main()
            , 1000

main()
