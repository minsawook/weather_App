class HourWeather {
  var temp;
  var icon;

  HourWeather({this.icon, this.temp});

  HourWeather.fromjson(Map<String, dynamic> json, int i) {
    temp = json['hourly'][i]['temp'];
    icon = json['hourly'][i]['weather'][0]['icon'];
  }
}
