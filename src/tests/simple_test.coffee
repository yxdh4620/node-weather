should = require "should"
debuglog = require("debug")("node-weather::tests::simple_test")
SimpleWeather = require('../index').SimpleWeather
types = require '../enums/types'
config = require './config'
async = require 'async'

httpUrl = config.httpUrl
appId = config.appId
privateKey = config.privateKey

## Test cases
describe "test simple", ->

  before () ->
    # before test happen

  #describe "constructor", ->

  #  it "loadByType 指数 index test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadByType '101010200', types.TYPE_INDEX, (err,body)->
  #      console.log err if err?
  #      console.dir body
  #      done()


  #  it "loadByType 常规预报： forecast3d test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadByType '101010100', types.TYPE_FORECAST3D, (err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()

  #  it "loadByType 实况： observe test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadByType '101010100', types.TYPE_OBSERVE, (err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()

  #describe "load weather by type", ->

  #  it "loadByType 指数 index test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadIndex '101010100', (err,body)->
  #      console.log err if err?
  #      console.dir body
  #      done()


  #  it "loadByType 常规预报： forecast3d test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadForecast3d '101020200', (err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()

  #  it "loadByType 实况： observe test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadObserver '101010100',(err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()


  #describe "load areas", ->

  #  it "loadProvinces test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadProvinces (err,body)->
  #      console.log err if err?
  #      console.dir body
  #      done()

  #  it "loadCitys test", (done) ->
  #    @timeout = 30000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadCitys '10102', (err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()

  #  it "loadAreas test", (done) ->
  #    @timeout = 60000
  #    sw = new SimpleWeather(httpUrl,appId,privateKey)
  #    sw.loadAreas '10102','00', false, (err, body)->
  #      console.log err if err?
  #      console.dir body
  #      done()


  describe "synthesize test", ->
    it "synthesize test", (done) ->
      @timeout = 60000
      sw = new SimpleWeather(httpUrl,appId,privateKey)
      provinces = ['10131']
      async.eachSeries provinces, (province, next) =>
        sw.loadCitys province, (err,body)->
          console.log err if err?
          citys = []
          for key, val of body
            citys.push key
          async.eachSeries citys, (city, next) =>
            sw.loadAreas province, city, true, (err, body) =>
              console.log err if err?
              areas = []
              for key, val of body
                areas.push key
              async.eachSeries areas, (area, next) =>
                sw.loadByType area, types.TYPE_FORECAST3D, (err, body) =>
                  console.log err if err?
                  console.dir body
                  next()
              ,(err) =>
                console.error err if err?
                next()
          ,(err) =>
            console.error err if err?
            next()
      ,(err) =>
        console.error err if err?
        done()

