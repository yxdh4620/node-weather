###
# 签名生成工具类
###

debuglog = require('debug')("node-weather::utils::sign")
crypto = require 'crypto'
urlencode = require('urlencode');

privateKey = null


dateYearRegexp = /(y+)/
Date.prototype.Format = (fmt) ->
  o = {
    "M+" : this.getMonth()+1,                 #//月份
    "d+" : this.getDate(),                    #//日
    "h+" : this.getHours(),                   #//小时
    "m+" : this.getMinutes(),                 #//分
    "s+" : this.getSeconds(),                 #//秒
    "q+" : Math.floor((this.getMonth()+3)/3), #//季度
    "S"  : this.getMilliseconds()             #//毫秒
  }
  if(/(y+)/.test(fmt))
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length))
    for k, val of o
      if(new RegExp("(#{k})").test(fmt))
        fmt = fmt.replace(RegExp.$1, if RegExp.$1.length==1 then (o[k]) else (("00"+ o[k]).substr((""+ o[k]).length)))
    return fmt




module.exports =

  sign : (public_key, private_key) ->
    return crypto.createHmac('sha1',private_key).update(public_key).digest("base64")

  urlEncode:(str) ->
    return urlencode(str)

  urlDecode : (str) ->
    return urlencode.decode str
