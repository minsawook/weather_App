import 'dart:convert' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/model/pollution.dart';
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
    print(body);
    return CurrentWeather.fromJson(body);
  }

  Future<Poolation> getPoolation(
    String lat,
    String lon,
  ) async {
    var str =
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$_openweatherkey';
    var response = await get(Uri.parse(str));
    var body = http.jsonDecode(response.body);
    print(body);
    return Poolation.fromJson(body);
  }
}
