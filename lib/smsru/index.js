var Smsru, exports, http, querystring,
  __slice = [].slice;

http = require('http');

querystring = require('querystring');

Smsru = (function() {
  var data, host, path;

  data = {};

  host = 'sms.ru';

  path = '/sms/send';

  function Smsru(filename) {
    data = require(filename);
  }

  Smsru.prototype.getData = function() {
    return data;
  };

  Smsru.prototype.test = function(value) {
    if (value === void 0) {
      return +(!!data.test);
    } else {
      return data.test = +(!!value);
    }
  };

  Smsru.prototype.send = function() {
    var cb, options, req, text, to, _i;
    text = arguments[0], to = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), cb = arguments[_i++];
    if (cb == null) {
      cb = function() {};
    }
    options = {
      host: host,
      path: path + '?' + querystring.stringify(data)
    };
    options.path += '&text=' + text;
    options.path += '&to=' + (to[0] || data.to);
    req = http.request(options, cb);
    return req.end();
  };

  return Smsru;

})();

module.exports = exports = Smsru;
