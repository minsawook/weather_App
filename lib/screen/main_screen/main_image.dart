import 'package:flutter/material.dart';

Widget MainImage(BuildContext context, dynamic currentWeatherdata) {
  if (currentWeatherdata.icon == '01d' || currentWeatherdata.icon == '01n') {
    return Image.asset(
      'assets/images/맑음.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '02d' ||
      currentWeatherdata.icon == '02n' ||
      currentWeatherdata.icon == '03n' ||
      currentWeatherdata.icon == '03d' ||
      currentWeatherdata.icon == '04n' ||
      currentWeatherdata.icon == '04d') {
    return Image.asset(
      'assets/images/흐림.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '09d' ||
      currentWeatherdata.icon == '09n' ||
      currentWeatherdata.icon == '10n' ||
      currentWeatherdata.icon == '10d') {
    return Image.asset(
      'assets/images/비.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '03d' ||
      currentWeatherdata.icon == '03n') {
    return Image.asset(
      'assets/images/흐림.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '03d' ||
      currentWeatherdata.icon == '03n') {
    return Image.asset(
      'assets/images/흐림.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '03d' ||
      currentWeatherdata.icon == '03n') {
    return Image.asset(
      'assets/images/흐림.gif',
      fit: BoxFit.fill,
    );
  }
}
