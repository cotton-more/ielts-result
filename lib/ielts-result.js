/*
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
*/

'use strict';
var Get, get;

if (process.argv.length < 4) {
  process.abort();
}

Get = require('./get');

get = new Get(process.argv[2]);

get.fetchResult(function(res) {
  var data;
  res.setEncoding('utf8');
  data = '';
  res.on('data', function(d) {
    return data += d;
  });
  return res.on('end', function() {
    return console.log(data);
  });
});
