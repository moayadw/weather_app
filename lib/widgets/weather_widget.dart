import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_cubit.dart';
import 'package:wether_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context)
        .weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: 
            getThemeColors(weatherModel.condtion)
          
          ,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: NetworkImage('https:${weatherModel.image}')),
                Text(
                  weatherModel.temp.round().toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text('MaxTemp: ${weatherModel.maxTemp.round()}'),
                    Text('MinTemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 34),
            Text(
              weatherModel.condtion.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

 List<Color> getThemeColors(String? condition) {
  if (condition == null) {
    return [const Color(0xFF2196F3), const Color(0xFF64B5F6)];
  }
  switch (condition) {
    // Sunny & Clear
    case 'Sunny':
    case 'Clear':
      return [const Color(0xFFFF9800), const Color(0xFFFFC107)];

    // Clouds & Overcast
    case 'Partly cloudy':
      return [const Color(0xFF607D8B), const Color(0xFF90A4AE)];
    case 'Cloudy':
    case 'Overcast':
      return [const Color(0xFF455A64), const Color(0xFF78909C)];

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
      return [const Color(0xFF795548), const Color(0xFF8D6E63)];

    // Light Rain & Drizzle
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
      return [const Color(0xFF03A9F4), const Color(0xFF4FC3F7)];

    // Moderate & Heavy Rain
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return [const Color(0xFF1976D2), const Color(0xFF2196F3)];

    // Thunderstorms
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return [const Color(0xFF512DA8), const Color(0xFF673AB7)];

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
      return [const Color(0xFF3F51B5), const Color(0xFF5C6BC0)];

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
      return [const Color(0xFF00BCD4), const Color(0xFF4DD0E1)];

    default:
      return [const Color(0xFF2196F3), const Color(0xFF64B5F6)]; // Fallback gradient colors
  }
}
}
