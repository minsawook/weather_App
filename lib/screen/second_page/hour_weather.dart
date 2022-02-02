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
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              new DateFormat.H().format(oneDayFromNow),
              style: TextStyle(color: Colors.white, fontSize: 20),
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
              '기온:${Temperature.toInt()}°',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    ),
  );
}
