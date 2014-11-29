###
# 天气气象编码枚举
###


WEATHERS = {
  0:{name:"晴",  code:"Sunny"},
  1:{name:"多云",  code:"Cloudy"},
  2:{name:"阴",  code:"Overcast"},
  3:{name:"阵雨",  code:"Shower"},
  4:{name:"雷阵雨",  code:"Thundershower"},
  5:{name:"雷阵雨伴有冰雹",  code:"Thundershower with hail"},
  6:{name:"雨夹雪",  code:"Sleet"},
  7:{name:"小雨",  code:"Light rain"},
  8:{name:"中雨",  code:"Moderate rain"},
  9:{name:"大雨",  code:"Heavy rain"},
  10:{name:"暴雨", code:"Storm"},
  11:{name:"大暴雨",  code:"Heavy storm"},
  12:{name:"特大暴雨",  code:"Severe storm"},
  13:{name:"阵雪",  code:"Snow flurry"},
  14:{name:"小雪",  code:"Light snow"},
  15:{name:"中雪",  code:"Moderate snow"},
  16:{name:"大雪",  code:"Heavy snow"},
  17:{name:"暴雪",  code:"Snowstorm"},
  18:{name:"雾",    code:"Foggy"},
  19:{name:"冻雨",  code:"Ice rain"},
  20:{name:"沙尘暴",    code:"Duststorm"},
  21:{name:"小到中雨",  code:"Light to moderate rain"},
  22:{name:"中到大雨",  code:"Moderate to heavy rain"},
  23:{name:"大到暴雨",  code:"Heavy rain to storm"},
  24:{name:"暴雨到大暴雨",  code:"Storm to heavy storm"},
  25:{name:"大暴雨到特大暴雨",  code:"Heavy to severe storm"},
  26:{name:"小到中雪",  code:"Light to moderate snow"},
  27:{name:"中到大雪",  code:"Moderate to heavy snow"},
  28:{name:"大到暴雪",  code:"Heavy snow to snowstorm"},
  29:{name:"浮尘",  code:"Dust"},
  30:{name:"扬沙",  code:"Sand"},
  31:{name:"强沙尘暴",  code:"Sandstorm"},
  53:{name:"霾",  code:"Haze"},
  99:{name:"无",  code:"Unknown"}
}

exports.WEATHERS = WEATHERS
