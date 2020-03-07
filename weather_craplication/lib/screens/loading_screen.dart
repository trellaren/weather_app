import 'package:flutter/material.dart';
import 'package:weather_craplication/services/location.dart';
import 'package:weather_craplication/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String applicationId = '6a9d749847b5b9671825adb143d60d13';
  String weatherDescrip;
  String city;
  int condition;
  double currentLatitude;
  double currentLongitude;
  double temp;
  double wind;
  double feelsLike;
  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    currentLatitude = currentLocation.latitude;
    currentLongitude = currentLocation.longitude;

    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?units=imperial&lat=$currentLatitude&lon=$currentLongitude&appid=$applicationId');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//body: Container(
//padding: const EdgeInsets.all(16.0),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Row(
//children: <Widget>[
//Flexible(
//child: Text(
//'City: $city',
//),
//),
//],
//),
//Row(
//children: <Widget>[
//Flexible(
//child: Text(
//'Current Temp: $temp',
////                  'Long: $currentLongitude.toString()',
//),
//)
//],
//),
//Row(
//children: <Widget>[
//Flexible(
//child: Text(
//'Feels Like: $feelsLike',
//)
//)
//],
//),
//Row(
//children: <Widget>[
//Flexible(
//child: Text(
//'Wind Speed: $wind',
//),
//)
//],
//),
//Row(
//children: <Widget>[
//Flexible(
//child: Text(
//'Description: $weatherDescrip',
//)
//)
//],
//),
//],
//),
//),