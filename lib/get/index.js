'use strict';
var Get, exports, http, path, querystring;

path = require('path');

http = require('http');

querystring = require('querystring');

Get = (function() {
  var data;

  data = {};

  function Get(filename) {
    data = require(path.resolve(filename));
  }

  Get.prototype.fetchResult = function(cb) {
    var options, req;
    if (cb == null) {
      cb = function() {};
    }
    options = {
      host: 'ielts-moscow.ru',
      path: '/ajax/get_results.php?' + querystring.stringify(data)
    };
    req = http.request(options, cb);
    return req.end();
  };

  return Get;

})();

exports = module.exports = Get;
