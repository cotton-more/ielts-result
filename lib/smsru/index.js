var Smsru, exports, request,
  __slice = [].slice;

request = require('request');

Smsru = (function() {
  var data, host, path;

  data = {};

  host = 'http://sms.ru';

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
    var cb, qs, text, to, _i;
    text = arguments[0], to = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), cb = arguments[_i++];
    if (cb == null) {
      cb = function() {};
    }
    qs = {
      'api_id': data.api_id,
      'test': this.test()
    };
    qs.text = text;
    qs.to = to[0] || data.to;
    return request({
      uri: host + path,
      qs: qs
    }, cb);
  };

  return Smsru;

})();

module.exports = exports = Smsru;
