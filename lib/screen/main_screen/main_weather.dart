import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget weatherData(BuildContext context, Size size, dynamic currentWeatherdata,
        dynamic poolation, dynamic tempMin, dynamic tempMax) =>
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
          ],
        ),
        Container(
          transform: Matrix4.translationValues(
            0,
            -20,
            0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${currentWeatherdata.temp.round()}°',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
            transform: Matrix4.translationValues(
              0,
              -30,
              0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${tempMin.round()}°',
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  '/',
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  '${tempMax.round()}°',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ],
            ))
        /*Container(
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
                            ? Colors.lightGreen
                            : poolation.aqi == 3
                                ? Colors.yellow
                                : poolation.aqi == 4
                                    ? Colors.orange
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
        ),*/
      ],
    );
