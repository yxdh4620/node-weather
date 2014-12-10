###
# 简单的借口实现
###

debuglog = require('debug')("node-weather::simple")
assert = require 'assert'
path = require 'path'
fs = require 'fs'
http = require 'http'
_ = require 'underscore'
sign = require './utils/sign'
request = require 'request'
types = require './enums/types'


root_path = path.resolve __dirname, "../"
areaid_v = null
areaid_f = null

PROVINCES_URL = "http://www.weather.com.cn/data/city3jdata/china.html"
CITYS_URL = "http://www.weather.com.cn/data/city3jdata/provshi/"
AREAS_URL = "http://www.weather.com.cn/data/city3jdata/station/"

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
    assert _.isFunction callback, "missing callback"

    date = new Date().Format("yyyyMMddhhmm")
    public_key = "#{@url}?areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@appId}"
    key = sign.sign public_key, @privateKey
    url = "#{@url}?areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@appId.substr(0,6)}&key=#{sign.urlEncode(key)}"
    request url, (err, res, body) ->
      return callback err if err?
      try
        body = JSON.parse(body) || {}
        callback(null, body)
      catch err
        callback new Error("results data is error")
        return
      return
    return

  #获得中国省份的JSON列表
  loadProvinces:(callback) ->
    request PROVINCES_URL, (err, res, body)->
      return callback err if err?
      try
        provinces = JSON.parse(body) || {}
        callback null, provinces
      catch err
        callback new Error("results data is error")
        return
      return
    return

  #获得指定省份下的城市JSON列表
  loadCitys:(province, callback) ->
    assert province, "missing province"
    assert _.isFunction callback, "missing callback"
    request "#{CITYS_URL}#{province}.html", (err, res, body) ->
      return callback err if err?
      try
        citys = JSON.parse(body) || {}
        callback null, citys
      catch err
        callback new Error("results data is error")
        return
      return
    return

  #获得指定城市下的区域JSON列表
  # province:5位省份代码
  # city: 2位城市代码
  # isFull: 是否返回完整的9位区域码， 否则只返回2位区域码（true: 是， false: 否）
  # return 为什么要返回完整区域码？（直辖市的编码规则与一般规则不同，所以这里可以直接按照天气预报的区域编码返回JSON列表）
  loadAreas:(province, city, isFull, callback) ->
    assert province, "missing province"
    assert city, "missing city"
    assert _.isFunction callback, "missing callback"
    request "#{AREAS_URL}#{province}#{city}.html", (err, res, body) ->
      return callback err if err?
      try
        tests = JSON.parse(body) || {}
        areas = {}
        unless isFull
          areas = tests
        else
          for key, val of tests
            if city is '00'
              areas["#{province}#{key}#{city}"] = val
              continue
            else
              areas["#{province}#{city}#{key}"]=val
              continue
        callback null, areas
      catch err
        callback new Error("results data is error")
        return
      return
    return


module.exports = SimpleWeather



