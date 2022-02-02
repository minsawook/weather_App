import 'package:flutter/material.dart';
import 'package:weather_app/model/days_weather.dart';
import 'package:weather_app/model/poolution.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/main_screen/main_weather.dart';
import 'package:weather_app/screen/second_page/etc_data.dart';
import 'package:weather_app/weather_api/my_location.dart';
import 'package:weather_app/weather_api/weather_api.dart';
import 'package:weather_app/screen/second_page/days_weather.dart';

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
  List<dynamic> minTemperatureForecast = List.filled(7, 0);
  List<dynamic> maxTemperatureForecast = List.filled(7, 0);
  List<dynamic> iconForecast = List.filled(7, 0);
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
  var daysData;

  @override
  Future<dynamic> getData() async {
    await _mylocation.getLocation();
    currentWeatherdata = await weatherApi.getCurrentWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    poolation = await weatherApi.getPoolation(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    daysData = await weatherApi.getDaysWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());

    for (var i = 0; i < 7; i++) {
      daysWeather = await DaysWeather.fromJson(daysData, i);
      minTemperatureForecast[i] = daysWeather.temp_min;
      maxTemperatureForecast[i] = daysWeather.temp_max;
      iconForecast[i] = daysWeather.icon;
    }

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
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  toolbarHeight: 35,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Text(
                      '${currentWeatherdata.country} ${currentWeatherdata.city}'),
                ),
                body: PageView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  children: <Widget>[
                    Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/맑음.gif',
                          fit: BoxFit.fill,
                        ),
                        weatherData(
                            context, size, currentWeatherdata, poolation)
                      ],
                    ),
                    Container(
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
                                    forecastElement(
                                        context,
                                        i + 1,
                                        minTemperatureForecast[i],
                                        maxTemperatureForecast[i],
                                        iconForecast[i]),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.015),
                            Container(
                              //margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  //    border: Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  poolationData(context, size, '미세먼지',
                                      poolation.pm10, 25, 50, 90, 18),
                                  poolationData(context, size, '초미세먼지',
                                      poolation.pm2, 15, 30, 55, 110),
                                  poolationData(context, size, '이산화질소',
                                      poolation.no2, 50, 100, 200, 400),
                                  poolationData(context, size, '오존',
                                      poolation.o3, 60, 120, 180, 240)
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ));
          }
        });
  }

  Widget poolationData(
    BuildContext context,
    Size size,
    String name,
    var name2,
    var good,
    var fair,
    var moderate,
    var poor,
  ) =>
      Expanded(
          child: Container(
        color: name2 < good
            ? Colors.blue[200]
            : name2 < fair
                ? Colors.blue[300]
                : name2 < moderate
                    ? Colors.green
                    : name2 < poor
                        ? Colors.yellow
                        : Colors.red,
        height: size.height * 0.16,
        width: size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$name'),
            Text('${name2.toStringAsFixed(1)}')
          ],
        ),
      ));
}
