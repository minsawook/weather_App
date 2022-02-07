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
  var oneDayFromNow = now.add(new Duration(days: daysFromNow - 1));
  return Container(
    height: size.height * 0.055,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            width: size.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(new DateFormat.E().format(oneDayFromNow)),
                Image.network(
                    'http://openweathermap.org/img/wn/${iconForecast}@2x.png'),
              ],
            )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${maxTemperature.round()}°/',
            ),
            Text(
              '${minTemperature.round()}°',
            ),
          ],
        ))
      ],
    ),
  );
}
