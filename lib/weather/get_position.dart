import 'dart:convert';
import 'dart:ffi';
import 'current_air_pollution.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/weather/my_location.dart';
import 'package:http/http.dart';

class GetPosition {
  MyLocation _mylocation = MyLocation();
  CurrentAirPollution _currentAirPollution = CurrentAirPollution();

  final _openweatherkey = '2db2f66ff4c3c59a8ede85ea41cecfb6';

  dynamic getPosition() async {
    var weatherData;
    await _mylocation.getLocation();
    weatherData = await getWeatherData(
      lat: _mylocation.lat.toString(),
      lon: _mylocation.lon.toString(),
    );
    return weatherData;
  }

  dynamic getCurrentAirPollution() async {
    var airPollationData;
    await _mylocation.getLocation();
    airPollationData = await _currentAirPollution.getCurrentAirPollutionData(
        lat: _mylocation.lat.toString(),
        lon: _mylocation.lon.toString(),
        openweatherkey: _openweatherkey);
    return airPollationData;
  }

  Future<dynamic> getWeatherData({
    @required String lat,
    @required String lon,
  }) async {
    var weatherData;

    var str =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_openweatherkey&units=metric';
    Response response = await get(Uri.parse(str));

    if (response.statusCode == 200) {
      var data = response.body;
      var dataJson = jsonDecode(data);
      weatherData = await dataJson;
    } else {
      print('response status code = ${response.statusCode}');
    }
    return weatherData;
  }
}
