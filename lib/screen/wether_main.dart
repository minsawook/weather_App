import 'package:flutter/material.dart';
import 'package:weather_app/weather/get_position.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key key}) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  GetPosition getPosition = GetPosition();
  var weatherData;
  var airPollationData;
  double temp = 0.0;
  double temp_min = 0.0;
  double temp_max = 0.0;
  String city;
  String country;
  int pollution;
  var icon = '01d';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      weatherData = await getPosition.getPosition();
      airPollationData = await getPosition.getCurrentAirPollution();
      print(weatherData);
      print(airPollationData);
      setState(() {
        temp = double.parse('${weatherData['main']['temp']}');
        temp_min = double.parse('${weatherData['main']['temp_min']}');
        temp_max = double.parse('${weatherData['main']['temp_max']}');
        icon = weatherData['weather'][0]['icon'];
        city = weatherData['name'];
        country = weatherData['sys']['country'];
        pollution =
            (int.parse('${airPollationData['list'][0]['main']['aqi']}'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('$country $city'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/맑음.gif',
            fit: BoxFit.fill,
          ),
          _weatherData(context, size),
        ],
      ),
    );
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
              Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
              Container(
                  transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${temp.toInt()}°',
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        '${temp_min.toInt()}°',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      Text(
                        '/',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${temp_max.toInt()}°',
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
                      color: pollution == 1
                          ? Colors.blue[200]
                          : pollution == 2
                              ? Colors.blue[300]
                              : pollution == 3
                                  ? Colors.green
                                  : pollution == 4
                                      ? Colors.yellow
                                      : pollution == 5
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
