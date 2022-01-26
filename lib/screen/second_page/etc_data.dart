import 'package:flutter/material.dart';

Widget etcData(BuildContext context, Size size, dynamic currentWeatherdata,
        TextStyle textStyle) =>
    Container(
      /*decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),*/
      width: double.infinity,
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "풍속",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "기압",
                    style: textStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${currentWeatherdata.wind}",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "${currentWeatherdata.pressure}",
                    style: textStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "습도",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "체감온도",
                    style: textStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${currentWeatherdata.humidity}",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "${currentWeatherdata.feels_like.toInt()}°",
                    style: textStyle,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
