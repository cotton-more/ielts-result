assert = require 'assert'
path = require 'path'
querystring = require 'querystring'

Smsru = require './index'

smsru = new Smsru(path.resolve '../.smsru.json')

describe 'smsru', ->
    describe 'module', ->
        it 'should be set an api_id', ->
            assert.equal true, !!smsru.getData().api_id
        it 'should turn on test mode', ->
            assert.equal smsru.test(), 0
            assert.equal smsru.test(true), 1
            assert.equal smsru.test(), 1
        it 'should send request', (done) ->
            @timeout 5000
            smsru.test true

            smsru.send 'text', (error, response, body) ->
                data = body.split "\n"
                assert.equal data[0], '100'
                done()
