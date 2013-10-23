/*
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
*/

'use strict';
var Smsru, data, main, path, request, smsru;

if (process.argv.length < 4) {
  process.abort();
}

Smsru = require('./smsru');

path = require('path');

request = require('request');

smsru = new Smsru(process.argv[3]);

data = require(path.resolve(process.argv[2]));

main = function() {
  return request({
    url: 'http://ielts-moscow.ru/ajax/get_results.php',
    qs: data
  }, function(error, response, body) {
    if (~body.indexOf('color:red') === 0) {
      return smsru.send(response.request.href, function() {
        return process.abort();
      });
    } else {
      return setTimeout(function() {
        console.log(body);
        return main();
      }, 2000);
    }
  });
};

main();
