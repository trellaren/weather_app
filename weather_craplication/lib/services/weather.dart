import 'package:weather_craplication/services/location.dart';
import 'package:weather_craplication/services/networking.dart';

const applicationId = '6a9d749847b5b9671825adb143d60d13';
const openWeatherURL = 'http://api.openweathermap.org/data/2.5/weather';
String unitType = 'imperial';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherURL?units=$unitType&q=$cityName&appid=$applicationId'
    );
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?units=$unitType&lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$applicationId'
    ); // q={city name},{state},{country code}
    var weatherData = await networkHelper.getData();

    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}