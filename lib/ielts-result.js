/*
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
*/

'use strict';
var Get, Smsru, get, main, smsru;

if (process.argv.length < 4) {
  process.abort();
}

Get = require('./get');

Smsru = require('./smsru');

get = new Get(process.argv[2]);

smsru = new Smsru(process.argv[3]);

main = function() {
  return get.fetchResult(function(error, response, body) {
    if (~body.indexOf('color:red') === 0) {
      return smsru.send(response.request.href, function() {
        return process.abort();
      });
    } else {
      return setTimeout(function() {
        console.log(body);
        return main();
      }, 1000);
    }
  });
};

main();
