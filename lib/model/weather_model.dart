class CurrentWeather {
  double temp;
  double temp_min;
  double temp_max;
  String city;
  String country;
  var description;
  var icon;
  double feels_like;

  CurrentWeather(
      {this.city,
      this.country,
      this.description,
      this.icon,
      this.temp,
      this.temp_max,
      this.temp_min});
  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temp = json['main']['temp'];
    temp_min = json['main']['temp_min'];
    temp_max = json['main']['temp_max'];
    icon = json['weather'][0]['icon'];
    city = json['name'];
    country = json['sys']['country'];
    description = json['weather'][0]['description'];
    feels_like = json['main']['feels_like'];
    //pollution = json['list'][0]['main']['aqi'];
  }
}
