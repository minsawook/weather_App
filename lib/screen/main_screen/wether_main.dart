import 'package:flutter/material.dart';
import 'package:weather_app/model/days_weather.dart';
import 'package:weather_app/model/pollution.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/main_screen/main_weather.dart';
import 'package:weather_app/screen/second_page/etc_data.dart';
import 'package:weather_app/weather_api/my_location.dart';
import 'package:weather_app/weather_api/weather_api.dart';
import 'package:weather_app/screen/main_screen/wether_main.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key key}) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  WeatherApi weatherApi = WeatherApi();
  MyLocation _mylocation = MyLocation();
  CurrentWeather currentWeatherdata = CurrentWeather();
  Poolation poolation = Poolation();
  DaysWeather daysWeather = DaysWeather();
  var daysData;
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

  @override
  Future<dynamic> getData() async {
    await _mylocation.getLocation();
    currentWeatherdata = await weatherApi.getCurrentWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    poolation = await weatherApi.getPoolation(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    daysData = weatherApi.getDaysWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Text('에러');
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              children: <Widget>[
                Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 35,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                        '${currentWeatherdata.country} ${currentWeatherdata.city}'),
                  ),
                  extendBodyBehindAppBar: true,
                  body: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/맑음.gif',
                        fit: BoxFit.fill,
                      ),
                      weatherData(context, size, currentWeatherdata, poolation)
                    ],
                  ),
                ),
                Scaffold(
                    body: Container(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          children: [
                            etcData(
                                context, size, currentWeatherdata, textStyle),
                            Container(
                                width: size.width,
                                child: Divider(
                                    color: Colors.black, thickness: 2.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  for (var i = 0; i < 7; i++)
                                    forecastElement(i + 1
                                        //  daysWeather =  DaysWeather.fromJson(daysData, i)
                                        //  minTemperatureForecast[i],
                                        //   maxTemperatureForecast[i]),
                                        )
                                ],
                              ),
                            ),
                          ],
                        ))),
              ],
            );
          }
        });
  }

  Widget forecastElement(
    daysFromNow,
    // DaysWeather daysWeather,
  ) {
    var now = new DateTime.now();
    var oneDayFromNow = now.add(new Duration(days: daysFromNow));
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              /* Text(
                new DateFormat.E().format(oneDayFromNow),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),*/
              Text(
                new DateFormat.d().format(oneDayFromNow),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                  color: Colors.amber,
                ),
              ),
              Text(
                'High: ',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                'Low: ',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
