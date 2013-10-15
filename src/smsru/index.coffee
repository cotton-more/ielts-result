request = require 'request'

class Smsru
    data = {}
    host = 'http://sms.ru'
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
        qs =
            'api_id': data.api_id
            'test': @test()

        qs.text = text
        qs.to = (to[0] || data.to)

        request {
            uri: host + path
            qs: qs
        }, cb

module.exports = exports = Smsru
