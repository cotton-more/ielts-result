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
  return get.fetchResult(function(res) {
    var data;
    res.setEncoding('utf8');
    data = '';
    res.on('data', function(d) {
      return data += d;
    });
    return res.on('end', function() {
      if (~data.indexOf('color:red') === 0) {
        return setTimeout(function() {
          return main();
        }, 1000);
      } else {
        return smsru.send('data', function() {
          return process.abort();
        });
      }
    });
  });
};

main();
