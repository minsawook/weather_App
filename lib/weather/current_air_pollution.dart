import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';

class CurrentAirPollution {
  Future<dynamic> getCurrentAirPollutionData(
      {@required String lat,
      @required String lon,
      @required String openweatherkey}) async {
    var airPollationData;
    var str =
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$openweatherkey';
    Response response = await get(Uri.parse(str));

    if (response.statusCode == 200) {
      var data = response.body;
      var dataJson = jsonDecode(data);
      airPollationData = await dataJson;
    } else {
      print('response status code = ${response.statusCode}');
    }
    return airPollationData;
  }
}
