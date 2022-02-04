import 'package:flutter/material.dart';

Widget etcData(BuildContext context, Size size, dynamic currentWeatherdata,
        TextStyle textStyle) =>
    Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('풍속'),
                Text(
                  "${currentWeatherdata.wind} ㎧",
                  style: textStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('습도'),
                Text(
                  "${currentWeatherdata.humidity}%",
                  style: textStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('체감온도'),
                Text(
                  "${currentWeatherdata.feels_like.round()}°",
                  style: textStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('기압'),
                Text(
                  "${currentWeatherdata.pressure}hPa",
                  style: textStyle,
                ),
              ],
            ),
          ],
        )

        /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
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
                  ]),
              child: Row(
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
                        "${currentWeatherdata.wind} ㎧",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "${currentWeatherdata.pressure}hPa",
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
                        "${currentWeatherdata.humidity}%",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "${currentWeatherdata.feels_like.round()}°",
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),*/
        );
