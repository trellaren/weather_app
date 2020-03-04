import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String currentLocation = 'Location services not enabled.';
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    Position position = await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    currentLocation = position.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              currentLocation,
            ),
          ],
        ),
      ),
    );
  }
}