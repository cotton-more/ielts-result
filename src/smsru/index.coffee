http = require 'http'
querystring = require 'querystring'

class Smsru
    data = {}
    host = 'sms.ru'
    path = '/sms/send'

    constructor: (filename) ->
        data = require filename

    getData: -> data

    test: (value)->
        if value is undefined
            +(!!data.test)
        else
            data.test = +(!!value)

    send: (text, to..., cb = ->) ->
        options =
            host: host
            path: path + '?' + querystring.stringify data

        options.path += '&text=' + text
        options.path += '&to=' + (to[0] || data.to)

        req = http.request options, cb

        req.end()

module.exports = exports = Smsru
