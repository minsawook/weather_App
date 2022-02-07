import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color BackgroundColor(
    BuildContext context, dynamic currentWeatherdata, dynamic poolation) {
  if (currentWeatherdata.icon == '01d' || currentWeatherdata.icon == '01n') {
    return Color(0xffa0d8ef);
  } else if ((currentWeatherdata.icon == '01d' ||
          currentWeatherdata.icon == '01n') &&
      poolation.aqi > 4) {
    return Color(0xff6c9bd2);
  } else if (currentWeatherdata.icon == '02d' ||
      currentWeatherdata.icon == '02n' ||
      currentWeatherdata.icon == '03n' ||
      currentWeatherdata.icon == '03d' ||
      currentWeatherdata.icon == '04n' ||
      currentWeatherdata.icon == '04d') {
    return Color(0xff83ccd2);
  } else if (currentWeatherdata.icon == '09d' ||
      currentWeatherdata.icon == '09n' ||
      currentWeatherdata.icon == '10n' ||
      currentWeatherdata.icon == '10d') {
    return Color(0xff83ccd2);
  } else if (currentWeatherdata.icon == '11d' ||
      currentWeatherdata.icon == '11n') {
    return Color(0xff6c9bd2);
  } else if (currentWeatherdata.icon == '13d' ||
      currentWeatherdata.icon == '13n') {
    return Color(0xffa0d8ef);
  } else if (currentWeatherdata.icon == '50d' ||
      currentWeatherdata.icon == '50n') {
    return Color(0xff64bcc7);
  }
}
