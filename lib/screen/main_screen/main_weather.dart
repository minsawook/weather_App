import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget weatherData(BuildContext context, Size size, dynamic currentWeatherdata,
        dynamic poolation) =>
    Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.07,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'http://openweathermap.org/img/wn/${currentWeatherdata.icon}@2x.png'),
            Container(
                transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${currentWeatherdata.temp.toInt()}°',
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      '${currentWeatherdata.temp_min.toInt()}°',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                    Text(
                      '/',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '${currentWeatherdata.temp_max.toInt()}°',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ))
          ],
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: size.width * 0.2,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: poolation.aqi == 1
                        ? Colors.blue[200]
                        : poolation.aqi == 2
                            ? Colors.blue[300]
                            : poolation.aqi == 3
                                ? Colors.green
                                : poolation.aqi == 4
                                    ? Colors.yellow
                                    : poolation.aqi == 5
                                        ? Colors.red
                                        : Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  '미세먼지',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
