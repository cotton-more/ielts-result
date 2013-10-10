/*
ielts-result
https://github.com/vansanblch/ielts-result

Copyright (c) 2013 Ivan Nikulin
Licensed under the MIT license.
*/

'use strict';
var Get, get, handler, parser;

Get = require('./get/get');

handler = new htmlparser.DefaultHandler(error, dom)(function() {
  return console.log(this, arguments);
});

parser = new htmlparser.Parser(handler);

get = new Get('test/exam.json');

get.fetchResult(function(res) {
  var data;
  res.setEncoding('utf8');
  data = '';
  res.on('data', function(d) {
    return data += d;
  });
  return res.on('end', function() {
    return parser.parseComplete(data);
  });
});
