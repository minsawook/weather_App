import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget forecastElement(
    BuildContext context,
    dynamic daysFromNow,
    dynamic minTemperature,
    dynamic maxTemperature,
    dynamic iconForecast,
    Size size) {
  var now = new DateTime.now();
  var oneDayFromNow = now.add(new Duration(days: daysFromNow));
  return Container(
    width: size.width * 0.12,
    child: Column(
      children: <Widget>[
        Text(
          new DateFormat.E().format(oneDayFromNow),
        ),
        Container(
          child: Image.network(
              'http://openweathermap.org/img/wn/${iconForecast}@2x.png'),
        ),
        Text(
          '${maxTemperature.toInt()}°',
        ),
        Text(
          '${minTemperature.toInt()}°',
        ),
      ],
    ),
  );
}
