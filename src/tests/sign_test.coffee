###
# utils::sign 的测试类
###

should = require "should"
sign = require "../utils/sign"
debuglog = require("debug")("node-weather::tests::sign_test")



private_key  = 'dsafasdfafafas'

## Test cases
describe "test sign", ->

  before () ->
    # before test happen

  describe "sign", ->

    it "sign test", (done) ->

      text = sign.sign 'http://dsjkdjsfkjaskdjak',private_key
      console.log text
      done()

    it "sign test 2", (done) ->
      public_key = "http://open.weather.com.cn/data/?areaid=101010100&type=index_f&date=201212010741&appid=1234567890"
      private_key= "793ffb_SmartWeatherAPI_662cbc7"

      console.log sign.sign public_key, private_key
