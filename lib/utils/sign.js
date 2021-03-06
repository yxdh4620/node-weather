// Generated by CoffeeScript 1.8.0

/*
 * 签名生成工具类
 */

(function() {
  var crypto, dateYearRegexp, debuglog, privateKey, urlencode;

  debuglog = require('debug')("node-weather::utils::sign");

  crypto = require('crypto');

  urlencode = require('urlencode');

  privateKey = null;

  dateYearRegexp = /(y+)/;

  Date.prototype.Format = function(fmt) {
    var k, o, val;
    o = {
      "M+": this.getMonth() + 1,
      "d+": this.getDate(),
      "h+": this.getHours(),
      "m+": this.getMinutes(),
      "s+": this.getSeconds(),
      "q+": Math.floor((this.getMonth() + 3) / 3),
      "S": this.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
      for (k in o) {
        val = o[k];
        if (new RegExp("(" + k + ")").test(fmt)) {
          fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
      }
      return fmt;
    }
  };

  module.exports = {
    sign: function(public_key, private_key) {
      return crypto.createHmac('sha1', private_key).update(public_key).digest("base64");
    },
    urlEncode: function(str) {
      return urlencode(str);
    },
    urlDecode: function(str) {
      return urlencode.decode(str);
    }
  };

}).call(this);
