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
  String city;
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
        icon = weatherData['weather'][0]['icon'];
        pollution =
            (int.parse('${airPollationData['list'][0]['main']['aqi']}'));
      });
    });

    //print('온도는 ${weatherData['main']['temp']}');
    //print('는 ${weatherData['sys']['country']}');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/임시.jpg',
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
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
              Text(
                '${temp.toInt()}°',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: size.width * 0.2,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: pollution == 1
                        ? Colors.blue[100]
                        : pollution == 2
                            ? Colors.yellow[100]
                            : pollution == 3
                                ? Colors.yellow
                                : pollution == 4
                                    ? Colors.red[300]
                                    : pollution == 5
                                        ? Colors.red
                                        : Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text('미세먼지'),
              ),
            ],
          ),
        ],
      );
}
