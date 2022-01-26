class DaysWeather {
  var temp_min;
  var temp_max;
  var icon;

  DaysWeather({this.icon, this.temp_max, this.temp_min});

  DaysWeather.fromJson(Map<String, dynamic> json, int i) {
    temp_min = json['daily'][i]['temp']['min'];
    temp_max = json['daily'][i]['temp']['max'];
    icon = json['daily'][i]['weather'][0]['icon'];
  }
}
