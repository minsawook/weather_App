import 'package:flutter/material.dart';
import 'package:weather_app/model/area.dart';
import 'package:weather_app/model/days_weather.dart';
import 'package:weather_app/model/hour_weather.dart';
import 'package:weather_app/model/poolution.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/main_screen/main_image.dart';
import 'package:weather_app/screen/main_screen/main_weather.dart';
import 'package:weather_app/screen/second_page/background_color.dart';
import 'package:weather_app/screen/second_page/etc_data.dart';
import 'package:weather_app/screen/second_page/hour_weather.dart';
import 'package:weather_app/screen/second_page/poolation_ui.dart';
import 'package:weather_app/weather_api/my_location.dart';
import 'package:weather_app/weather_api/weather_api.dart';
import 'package:weather_app/screen/second_page/days_weather.dart';
import 'package:weather_app/screen/main_screen/main_image.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key key}) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  WeatherApi weatherApi = WeatherApi();
  Area area = Area();
  MyLocation _mylocation = MyLocation();
  CurrentWeather currentWeatherdata = CurrentWeather();
  Poolation poolation = Poolation();
  DaysWeather daysWeather = DaysWeather();
  HourWeather hourWeather = HourWeather();
  List<dynamic> minTemperatureForecast = List.filled(8, 0);
  List<dynamic> maxTemperatureForecast = List.filled(8, 0);
  List<dynamic> iconForecast = List.filled(8, 0);
  List<dynamic> HourTemperatureForecast = List.filled(24, 0);
  List<dynamic> HouriconForecast = List.filled(24, 0);
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
  var daysData;

  @override
  Future<dynamic> getData() async {
    await _mylocation.getLocation();
    currentWeatherdata = await weatherApi.getCurrentWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    area = await weatherApi.getArea(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    poolation = await weatherApi.getPoolation(
        _mylocation.lat.toString(), _mylocation.lon.toString());
    daysData = await weatherApi.getDaysWeather(
        _mylocation.lat.toString(), _mylocation.lon.toString());

    for (var i = 0; i < 8; i++) {
      daysWeather = await DaysWeather.fromJson(daysData, i);
      minTemperatureForecast[i] = daysWeather.temp_min;
      maxTemperatureForecast[i] = daysWeather.temp_max;
      iconForecast[i] = daysWeather.icon;
    }
    for (var i = 0; i < 24; i++) {
      hourWeather = await HourWeather.fromjson(daysData, i);
      HourTemperatureForecast[i] = hourWeather.temp;
      HouriconForecast[i] = hourWeather.icon;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      key: refreshKey,
      child: MainLayout(context, size),
      onRefresh: getData,
    );
  }

  Widget MainLayout(BuildContext context, Size size) => FutureBuilder(
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
                title: Row(
                  children: [
                    Icon(Icons.fmd_good_sharp),
                    Text('${area.county} ${area.town}'),
                  ],
                ),
                actions: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.add))
                ],
              ),
              body: PageView(
                scrollDirection: Axis.vertical,
                controller: controller,
                children: <Widget>[
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      MainImage(context, currentWeatherdata, poolation),
                      weatherData(context, size, currentWeatherdata, poolation,
                          minTemperatureForecast[0], maxTemperatureForecast[0]),
                    ],
                  ),
                  //second page//
                  Container(
                      color: BackgroundColor(
                          context, currentWeatherdata, poolation),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: etcData(
                                context, size, currentWeatherdata, textStyle),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            color: Colors.blue[100],
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  for (var i = 0; i < 24; i++)
                                    hourForecastElement(
                                        context,
                                        i,
                                        HourTemperatureForecast[i],
                                        HouriconForecast[i]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                for (var i = 1; i < 8; i++) ...[
                                  Container(
                                    height: 1.0,
                                    color: Colors.white54,
                                  ),
                                  forecastElement(
                                      context,
                                      i,
                                      minTemperatureForecast[i],
                                      maxTemperatureForecast[i],
                                      iconForecast[i],
                                      size),
                                ]
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    poolationData(context, size, '미세먼지',
                                        poolation.pm10, 25, 50, 90, 18),
                                    poolationData(context, size, '초미세먼지',
                                        poolation.pm2, 15, 30, 55, 110),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    poolationData(context, size, '이산화질소',
                                        poolation.no2, 50, 100, 200, 400),
                                    poolationData(context, size, '오존',
                                        poolation.o3, 60, 120, 180, 240)
                                  ],
                                ),
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
