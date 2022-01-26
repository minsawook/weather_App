import 'package:flutter/material.dart';
import 'package:weather_app/model/pollution.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/weather_api/my_location.dart';
import 'package:weather_app/weather_api/weather_api.dart';

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
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  @override
  Future<dynamic> getData() async {
    await _mylocation.getLocation();
    currentWeatherdata = await weatherApi.getCurrentWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    poolation = await weatherApi.getPoolation(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getData(),
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
                      _weatherData(context, size)
                    ],
                  ),
                ),
                Container(
                  color: Colors.orangeAccent.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      '두 번째 페이지',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }

  Widget _weatherData(BuildContext context, Size size) => Column(
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
}
