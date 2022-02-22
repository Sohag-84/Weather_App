import 'package:weather_app/service/location.dart';
import 'package:weather_app/service/networking.dart';



const apiKey = "31ea942005ebfb33e7f1242a00a16198";

class WeatherModel {
  Future<dynamic> getLocationWeather()async{

    Location location = Location();
    await location.getCurrentLocation(); //we wait for this method until detect the user current location;
    // latitude = location.latitude;
    // longitude = location.longitude;

    Uri uri = Uri.parse("https://api.openweathermap.org/data/2.5/weather?"
        "lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    NetworkHelper networkHelper = NetworkHelper(uri); //Create network helper class object and pass api url

    var weatherData = await networkHelper.getData();

    return weatherData; // set similar datatype in method datatype
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