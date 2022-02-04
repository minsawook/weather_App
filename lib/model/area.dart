class Area {
  var city;
  var county;
  var town;
  var lat;
  var lon;

  Area({this.city, this.county, this.town, this.lat, this.lon});

  Area.fromjson(Map<String, dynamic> json) {
    city = json['results'][0]['region']['area1']['name'];
    lat = json['results'][0]['region']['area1']['coords']['center']['y'];
    lon = json['results'][0]['region']['area1']['coords']['center']['x'];
    county = json['results'][0]['region']['area2']['name'];
    town = json['results'][0]['region']['area3']['name'];
  }
}
