import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_cubit.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_states.dart';
import 'package:wether_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        var weatherModel = BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel;
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: getThemeColor(
              weatherModel?.condtion
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    )
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    // Sunny & Clear
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    // Clouds & Overcast
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;

    // Dust, Smoke, Fog, Haze
    case 'Haze':
    case 'Dust haze':
    case 'Blowing dust':
    case 'Dust storm':
    case 'Sandstorm':
    case 'Severe sandstorm':
    case 'Mist':
    case 'Smoke':
    case 'Smoky haze':
    case 'Smog':
    case 'Severe smog':
    case 'Saharan dust':
    case 'Dust':
    case 'Fog':
    case 'Freezing fog':
      return Colors.brown;

    // Light Rain & Drizzle
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
      return Colors.lightBlue;

    // Moderate & Heavy Rain
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;

    // Thunderstorms
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    // Snow & Blizzard
    case 'Patchy snow possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.indigo;

    // Sleet, Freezing Rain & Ice Pellets
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    default:
      return Colors.blue; // Fallback color
  }
}
