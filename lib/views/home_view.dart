import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_states.dart';

import 'package:weatherapp/views/noweather_view.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/views/weather_change_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SearchPage();
                    },
                  ),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search),
              ))
        ],
        title: Text('Weather'),
      ),
      body: BlocBuilder<GetWeatherCubit, getWeather>(builder: (context, state) {
        if (state is WeatherInitialState)
          return NoWeatherNow();
        else if (state is WeatherSuccessState)
          return WeatherChange(
            weatherModel: state.weatherModel,
          );
        else
          return ErrorWidget();
      }),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'Oops, there is an error, please check the correct city name.',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
