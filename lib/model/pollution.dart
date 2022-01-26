class Poolation {
  var pm10;
  var pm2;
  var aqi;

  Poolation({this.aqi, this.pm10, this.pm2});

  Poolation.fromJson(Map<String, dynamic> json) {
    aqi = json['list'][0]['main']['aqi'];
    pm10 = json['list'][0]['components']['pm10'];
    pm10 = json['list'][0]['components']['pm2_5'];
  }
}
