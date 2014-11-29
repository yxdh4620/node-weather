###
# 简单的借口实现
###

debulg = require('debug')("node-weather::simple")
assert = require 'assert'
path = require 'path'
fs = require 'fs'

root_path = path.resolve __dirname, "../"
areaid_v = null
areaid_f = null

class SimpleWeather

  constructor: (@appId, @privateKey) ->
    assert @appId, "missing appId"
    assert @privateKey, "missing privateKey"
    unless areaid_f?
      console.log "bbbbbbbbbbbb"
      areaid_f = JSON.parse(fs.readFileSync(path.join(root_path,"./lib/jsons/areaid_f.json")))
    unless areaid_v?
      areaid_v = JSON.parse(fs.readFileSync(path.join(root_path,"./lib/jsons/areaid_v.json")))



