// Generated by CoffeeScript 1.8.0

/*
 * 将excel 文件转换为JSON工具
 */

(function() {
  var fs, nodeExcel, path;

  path = require("path");

  fs = require("fs");

  nodeExcel = require('node-xlsx');

  module.exports = {
    parseFile: function(filePath, outPath, callback) {
      var area, areas, city, data, index, keys, obj, str, val, _i, _j, _len, _len1;
      obj = nodeExcel.parse(filePath);
      data = obj[0].data;
      areas = {};
      keys = data.splice(0, 1);
      keys = keys[0];
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        city = data[_i];
        area = {};
        for (index = _j = 0, _len1 = city.length; _j < _len1; index = ++_j) {
          val = city[index];
          area[keys[index]] = val;
        }
        areas[city[0]] = area;
      }
      str = "module.exports =\n";
      str += "data:" + (JSON.stringify(areas, null, 4));
      fs.writeFileSync(outPath, str);
      return callback();
    }
  };

}).call(this);