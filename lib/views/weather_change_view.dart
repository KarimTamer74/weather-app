import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherChange extends StatelessWidget {
  WeatherChange({super.key, required this.weatherModel});
  WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Text(
            'Updated at ' + weatherModel.date,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              children: [
                Image.network(
                  weatherModel.image ?? '',
                ),
                Spacer(
                  flex: 1,
                ),
                Text(weatherModel.avgtemp.round().toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'MinTemp: ' + weatherModel.mintemp.round().toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'MaxTemp: ${weatherModel.maxtemp.round()}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
          Text(
            weatherModel.currentstate,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
        ]),
      ),
    );
  }
}
