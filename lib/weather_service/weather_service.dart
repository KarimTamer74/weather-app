import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'e645d49edb964ba4920215642241702%20';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'oops there is an error, please try later';
      throw Exception(errorMessage);
    }
    // catch (e){
    //   throw Exception('oops there is an error, please try later');
    // }
  }
}

// import 'package:dio/dio.dart';
// import 'package:weatherapp/models/weather_model.dart';

// class WeatherService {
//   final Dio dio;
//   String baseUrl = 'https://api.weatherapi.com/v1';
//   String apiKey = 'e645d49edb964ba4920215642241702%20';
//   WeatherService(this.dio);
//   Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
//     try {
//       Response response = await dio
//           .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');
//       Map<String, dynamic> json = response.data;
//       WeatherModel weatherModel = WeatherModel.fromjson(json);
//       return weatherModel;
//     } on DioException catch (e) {
//       String errorMessage = e.response?.data['error']['message'] ??
//           'oops there is an error , please try again';
//       throw Exception(errorMessage);
//     }
//   }
// }
