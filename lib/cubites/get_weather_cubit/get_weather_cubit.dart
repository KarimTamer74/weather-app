import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/weather_service/weather_service.dart';

class GetWeatherCubit extends Cubit<getWeather> {
  GetWeatherCubit() : super(WeatherInitialState());

  void getWeatherCubit({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService().getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
