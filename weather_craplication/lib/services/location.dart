import 'package:geolocator/geolocator.dart';

class Location{
  Location({this.latitude, this.longitude});
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async{
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    try {
      Position position = await geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      return(e);
    }
  }
}