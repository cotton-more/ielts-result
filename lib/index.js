/* jshint node: true*/

/*
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
*/

"use strict";
var Smsru, argv, data, log, main, path, request, smsru;

argv = require('optimist').usage('Get ielts exam result.\nUsage: $0').describe({
  smsru: 'Path to smsru config',
  ielts: 'Path to exam data'
}).demand(['smsru', 'ielts']).argv;

log = require('npmlog');

Smsru = require('smsru');

path = require('path');

request = require('request');

smsru = new Smsru(argv.smsru);

data = require(argv.ielts);

main = function() {
  return request({
    url: 'http://ielts-moscow.ru/ajax/get_results.php',
    qs: data
  }, function(error, response, body) {
    log.info('ielts', body);
    if (~body.indexOf('color:red') === 0) {
      return smsru.send(response.request.href, function(error, body) {
        if (error) {
          return log.error('smsru', error);
        } else {
          log.info('smsru', response.request.href);
          return log.info('smsru', body);
        }
      });
    } else {
      return setTimeout(function() {
        return main();
      }, 2000);
    }
  });
};

main();
