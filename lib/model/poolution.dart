class Poolation {
  var pm10;
  var pm2;
  var aqi;
  var co;
  var no2;
  var o3;

  Poolation({this.aqi, this.pm10, this.pm2, this.co, this.no2, this.o3});

  Poolation.fromJson(Map<String, dynamic> json) {
    aqi = json['list'][0]['main']['aqi'];
    pm10 = json['list'][0]['components']['pm10'];
    pm2 = json['list'][0]['components']['pm2_5'];
    co = json['list'][0]['components']['co'];
    no2 = json['list'][0]['components']['no2'];
    o3 = json['list'][0]['components']['o3'];
  }
}
