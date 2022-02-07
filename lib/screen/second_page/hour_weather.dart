import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget hourForecastElement(BuildContext context, dynamic daysFromNow,
    dynamic Temperature, dynamic iconForecast) {
  var now = new DateTime.now();
  var oneDayFromNow = now.add(new Duration(hours: daysFromNow));
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              '${Temperature.toInt()}°',
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(
                    'http://openweathermap.org/img/wn/${iconForecast}@2x.png'),
              ),
            ),
            Text(
              new DateFormat.H().format(oneDayFromNow) + '시',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
