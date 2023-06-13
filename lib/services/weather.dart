import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '4c5b86cf1ab33e8139ecd16a4bd5b30e';
const openWeatherUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url=Uri.parse("$openWeatherUrl&appid=$apiKey&units=metric");
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather()async{

    location locations = location();
    await locations.getCurrentLocation();
    var uri = Uri.parse(
        "$openWeatherUrl?lat=${locations.latitude}&lon=${locations.longitude}&appid=$apiKey&units=metric");
    NetworkHelper networkHelper = NetworkHelper(uri);
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
