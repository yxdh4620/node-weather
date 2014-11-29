###
# 将excel 文件转换为JSON工具
###

path = require "path"
fs = require "fs"
#excel2json = require "excel2json"
#excel = require 'excel-stream'
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
    fs.writeFileSync outPath, JSON.stringify(areas,null,4)
    callback()
    #ex = fs.createReadStream(filePath)
    #  .pipe(excel())

    #ex.on('data',(data)->
    #  console.dir data
    #  console.log "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    #  fs.appendFileSync(outPath, JSON.stringify(data))
    #  callback
    #)

    #jsonExcel.excel2json filePath, (err, data) ->
    #  return callback err if err?
    #  console.dir data
    #  excel2json.toJson data, (err, results)->
    #    return callback err if err?
    #    fs.writeFileSync(outPath, JSON.stringify(results))
    #    callback()

