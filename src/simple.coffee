###
# 简单的借口实现
###

debuglog = require('debug')("node-weather::simple")
assert = require 'assert'
path = require 'path'
fs = require 'fs'
http = require 'http'
sign = require './utils/sign'
request = require 'request'
types = require './enums/types'

root_path = path.resolve __dirname, "../"
areaid_v = null
areaid_f = null

class SimpleWeather

  constructor: (@url, @appId, @privateKey) ->
    assert @url, "missing url"
    assert @appId, "missing appId"
    assert @privateKey, "missing privateKey"
    debuglog "instantiation"
    unless areaid_f?
      areaid_f = JSON.parse(fs.readFileSync(path.join(root_path,"./lib/jsons/areaid_f.json")))
    unless areaid_v?
      areaid_v = JSON.parse(fs.readFileSync(path.join(root_path,"./lib/jsons/areaid_v.json")))

  loadAreaidF:()->
    return areaid_f

  loadAreaidV:()->
    return areaid_v

  loadAreaById:(areaid) ->
    return areaid_v[areaid]

  #指数接口
  loadIndex : (areaid, callback) ->
    @loadByType areaid, types.TYPE_INDEX, callback
    return

  #3天常规预报接口
  loadForecast3d : (areaid, callback) ->
    @loadByType areaid, types.TYPE_FORECAST3D, callback
    return

  #实况预报接口
  loadObserver: (areaid, callback) ->
    @loadByType areaid, types.TYPE_OBSERVE, callback
    return


  loadByType: (areaid, type, callback) ->
    assert areaid, "missing areaid"
    assert type, "missing type"

    date = new Date().Format("yyyyMMddhhmm")
    public_key = "#{@url}?areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@appId}"
    key = sign.sign public_key, @privateKey

    url = "#{@url}?areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@appId.substr(0,6)}&key=#{sign.urlEncode(key)}"
    options =
      url:url
      method:"GET"

    request url, (err, res, body) ->
      if err?
        callback err
      callback(null, body)
      return
    return

module.exports = SimpleWeather



