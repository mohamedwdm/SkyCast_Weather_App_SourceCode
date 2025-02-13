import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/home_view.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // to provide the cubit
      create: (context) => GetWeatherCubit(),
      child: Builder(
        //to create new context after cubit context
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: GetThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context).weathermodel?.weatherCondition,
                  )),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor GetThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Light rain":
    case "Patchy light rain":
    case "Light rain shower":
    case "Patchy light rain with thunder":
      return Colors.lightBlue;
    case "Moderate rain":
    case "Moderate rain at times":
    case "Moderate or heavy rain":
    case "Heavy rain":
    case "Heavy rain at times":
    case "Torrential rain shower":
      return Colors.blue;
    case "Patchy snow possible":
    case "Light snow":
    case "Light snow showers":
    case "Patchy light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Blizzard":
    case "Moderate or heavy snow showers":
    case "Patchy moderate snow":
    case "Patchy heavy snow":
    case "Moderate or heavy snow with thunder":
    case "Patchy light snow with thunder":
      return Colors.lightBlue;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
      return Colors.purple;
    case "Thundery outbreaks possible":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.indigo;
    default:
      return Colors.blueGrey;
  }
}
