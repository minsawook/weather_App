class CurrentWeather {
  double temp;
  var temp_min;
  var temp_max;
  String city;
  String country;
  var description;
  var icon;
  double feels_like;
  var wind;
  int humidity;
  int pressure;
  CurrentWeather({
    this.city,
    this.country,
    this.description,
    this.icon,
    this.temp,
    this.temp_max,
    this.temp_min,
    this.wind,
    this.feels_like,
    this.humidity,
    this.pressure,
  });
  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temp = json['main']['temp'];
    temp_min = json['main']['temp_min'];
    temp_max = json['main']['temp_max'];
    icon = json['weather'][0]['icon'];
    city = json['name'];
    country = json['sys']['country'];
    description = json['weather'][0]['description'];
    wind = json['wind']['speed'];
    feels_like = json['main']["feels_like"];
    humidity = json['main']['humidity'];
    pressure = json['main']['pressure'];
  }
}
