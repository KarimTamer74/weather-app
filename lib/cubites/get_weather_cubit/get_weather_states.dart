import 'package:weatherapp/models/weather_model.dart';

class getWeather {}

class WeatherInitialState extends getWeather {}

class WeatherSuccessState extends getWeather {
  final WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends getWeather {}
