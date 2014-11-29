###
# excel 2 json 的测试类
###

should = require "should"
excel2json = require "../utils/excel2json"
excel2Coffee = require "../utils/excel2Coffee"
path = require 'path'
debuglog = require("debug")("node-weather::tests::excel2json_test")


root_path = path.resolve __dirname, "../../"


## Test cases
describe "test excel2json", ->

  before () ->
    # before test happen

  describe "parseFile", ->

    it "parseFile test", (done) ->
      @timeout 5000
      console.log root_path
      excel2json.parseFile path.join(root_path, 'areaid_f.xlsx'), path.join(root_path, './lib/jsons/areaid_f.json'),(err)->
        done()

    it "parseFile test2", (done) ->
      @timeout 5000
      console.log root_path
      excel2json.parseFile path.join(root_path, 'areaid_v.xlsx'), path.join(root_path, './lib/jsons/areaid_v.json'),(err)->
        done()

    it "parseFile test", (done) ->
      @timeout 5000
      console.log root_path
      excel2Coffee.parseFile path.join(root_path, 'areaid_f.xlsx'), path.join(root_path, './src/enums/areaid_f.coffee'),(err)->
        done()

    it "parseFile test2", (done) ->
      @timeout 5000
      console.log root_path
      excel2Coffee.parseFile path.join(root_path, 'areaid_v.xlsx'), path.join(root_path, './src/enums/areaid_v.coffee'),(err)->
        done()


