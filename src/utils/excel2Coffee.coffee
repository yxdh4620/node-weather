###
# 将excel 文件转换为JSON工具
###

path = require "path"
fs = require "fs"
nodeExcel = require 'node-xlsx'

module.exports =

  parseFile:(filePath, outPath,callback) ->

    obj = nodeExcel.parse(filePath)
    data = obj[0].data
    areas = {}
    keys = data.splice(0,1)
    keys = keys[0]
    for city in data
      area = {}
      for val,index in city
        area[keys[index]] = val
      areas[city[0]] = area
    str = "module.exports =\n"
    str += "data:#{JSON.stringify(areas,null,4)}"
    fs.writeFileSync outPath, str
    #fs.writeFileSync outPath, JSON.stringify(areas,null,4)
    callback()

