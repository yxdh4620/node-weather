should = require "should"
debuglog = require("debug")("node-weather::tests::simple_test")
SimpleWeather = require('../index').SimpleWeather
types = require '../enums/types'
config = require './config'

httpUrl = config.httpUrl
appId = config.appId
privateKey = config.privateKey

## Test cases
describe "test simple", ->

  before () ->
    # before test happen

  describe "constructor", ->

    it "loadByType 指数 index test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadByType '101010100', types.TYPE_INDEX, (err,body)->
        console.log err if err?
        console.dir body
        done()


    it "loadByType 常规预报： forecast3d test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadByType '101010100', types.TYPE_FORECAST3D, (err, body)->
        console.log err if err?
        console.dir body
        done()

    it "loadByType 实况： observe test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadByType '101010100', types.TYPE_OBSERVE, (err, body)->
        console.log err if err?
        console.dir body
        done()

  describe "load weather by type", ->

    it "loadByType 指数 index test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadIndex '101010100', (err,body)->
        console.log err if err?
        console.dir body
        done()


    it "loadByType 常规预报： forecast3d test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadForecast3d '101010100', (err, body)->
        console.log err if err?
        console.dir body
        done()

    it "loadByType 实况： observe test", (done) ->
      @timeout = 30000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      sw.loadObserver '101010100',(err, body)->
        console.log err if err?
        console.dir body
        done()


