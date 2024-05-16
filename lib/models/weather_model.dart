class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final String currentstate;
  final double avgtemp;
  final double mintemp;
  final double maxtemp;
  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.avgtemp,
    required this.maxtemp,
    required this.mintemp,
    required this.currentstate,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      currentstate: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
