'use strict';
var Get, exports, path, request;

path = require('path');

request = require('request');

Get = (function() {
  var data;

  data = {};

  function Get(filename) {
    data = require(path.resolve(filename));
  }

  Get.prototype.fetchResult = function(cb) {
    if (cb == null) {
      cb = function() {};
    }
    return request({
      url: 'http://ielts-moscow.ru/ajax/get_results.php',
      qs: data
    }, cb);
  };

  return Get;

})();

exports = module.exports = Get;
