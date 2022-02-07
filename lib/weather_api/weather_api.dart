import 'dart:convert' as http;
import 'package:weather_app/model/area.dart';
import 'package:weather_app/model/days_weather.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/model/poolution.dart';
import 'dart:ffi';
import 'package:http/http.dart';

class WeatherApi {
  //CurrentAirPollution _currentAirPollution = CurrentAirPollution();
  final _openweatherkey = '2db2f66ff4c3c59a8ede85ea41cecfb6';
  Future<CurrentWeather> getCurrentWeather(
    String lat,
    String lon,
  ) async {
    var str =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&lang=kr&appid=$_openweatherkey&units=metric';
    var response = await get(Uri.parse(str));
    var body = http.jsonDecode(response.body);
    return CurrentWeather.fromJson(body);
  }

  Future<Poolation> getPoolation(
    String lat,
    String lon,
  ) async {
    var str =
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$_openweatherkey&units=metric';
    var response = await get(Uri.parse(str));
    var body = http.jsonDecode(response.body);
    return Poolation.fromJson(body);
  }

  Future<dynamic> getDaysWeather(
    String lat,
    String lon,
  ) async {
    var str =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&lang=kr&exclude=current,minutely,alerts&appid=$_openweatherkey&units=metric';
    //https://api.openweathermap.org/data/2.5/onecall?lat=37.56&lon=127.08&lang=kr&exclude=current,minutely,alerts&appid=2db2f66ff4c3c59a8ede85ea41cecfb6&units=metric
    var response = await get(Uri.parse(str));
    var body = http.jsonDecode(response.body);
    print(1);
    return body;
  }

  Future<dynamic> getArea(String lat, String lon) async {
    var str =
        'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$lon,$lat&orders=admcode&output=json';

    var headers = {
      'X-NCP-APIGW-API-KEY-ID': 's6x3zyulw3',
      'X-NCP-APIGW-API-KEY': 'UJ9ZnGlXeS5LjSYsKmwVKTtsIsrAzYRIBdoPq2xw'
    };
    var response = await get(Uri.parse(str), headers: headers);
    var body = http.jsonDecode(response.body);
    return Area.fromjson(body);
  }
}
