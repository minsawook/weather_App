import 'package:geolocator/geolocator.dart';

class MyLocation {
  double lat;
  double lon;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print('위치를 찾을 수 없음');
    }
  }
}
