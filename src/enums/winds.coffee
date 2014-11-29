###
#
# 风向的类型枚举
###

###
0 无持续风向  No wind 0 微风  <10m/h
1 东北风  Northeast 1 3-4级 10~17m/h
2 东风  East  2 4-5级 17~25m/h
3 东南风  Southeast 3 5-6级 25~34m/h
4 南风  South 4 6-7级 34~43m/h
5 西南风  Southwest 5 7-8级 43~54m/h
6 西风  West  6 8-9级 54~65m/h
7 西北风  Northwest 7 9-10级  65~77m/h
8 北风  North 8 10-11级 77~89m/h
9 旋转风  Whirl wind  9 11-12级 89~102m/h
###

WIND_DIRECTIONS = {
  0:{name:"无持续风向", code:"No wind"},
  1:{name:"东北风", code:"Northeast"},
  2:{name:"东风", code:"East"},
  3:{name:"东南风",  code:"Southeast"},
  4:{name:"南风",    code:"South"},
  5:{name:"西南风",  code:"Southwest"},
  6:{name:"西风",    code:"West"},
  7:{name:"西北风",  code:"Northwest"},
  8:{name:"北风",    code:"North"},
  9:{name:"旋转风",  code:"Whirl wind"}
}

WIND_POWERS = {
  0:{name:"微风",    code:"<10m/h"},
  1:{name:"3-4级",   code:"10~17m/h"},
  2:{name:"4-5级",   code:"17~25m/h"},
  3:{name:"5-6级",   code:"25~34m/h"},
  4:{name:"6-7级",   code:"34~43m/h"},
  5:{name:"7-8级",   code:"43~54m/h"},
  6:{name:"8-9级",   code:"54~65m/h"},
  7:{name:"9-10级",  code:"65~77m/h"},
  8:{name:"10-11级", code:"77~89m/h"},
  9:{name:"11-12级", code:"89~102m/h"}
}

exports.WIND_DIRECTIONS = WIND_DIRECTIONS
exports.WIND_POWERS = WIND_POWERS




