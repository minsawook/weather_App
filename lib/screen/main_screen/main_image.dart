import 'package:flutter/material.dart';

Widget MainImage(
    BuildContext context, dynamic currentWeatherdata, dynamic poolation) {
  if (((currentWeatherdata.icon == '01d' || currentWeatherdata.icon == '01n') &&
          poolation.aqi >= 4) ||
      ((currentWeatherdata.icon == '02d' ||
              currentWeatherdata.icon == '02n' ||
              currentWeatherdata.icon == '03n' ||
              currentWeatherdata.icon == '03d' ||
              currentWeatherdata.icon == '04n' ||
              currentWeatherdata.icon == '04d') &&
          poolation.aqi >= 4)) {
    return Image.asset(
      'assets/images/미세먼지.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '01d' ||
      currentWeatherdata.icon == '01n') {
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
  } else if (currentWeatherdata.icon == '11d' ||
      currentWeatherdata.icon == '11n') {
    return Image.asset(
      'assets/images/번개.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '13d' ||
      currentWeatherdata.icon == '13n') {
    return Image.asset(
      'assets/images/눈.gif',
      fit: BoxFit.fill,
    );
  } else if (currentWeatherdata.icon == '50d' ||
      currentWeatherdata.icon == '50n') {
    return Image.asset(
      'assets/images/안개.gif',
      fit: BoxFit.fill,
    );
  }
}
