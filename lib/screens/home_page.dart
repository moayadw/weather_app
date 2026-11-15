import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_cubit.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_states.dart';
import 'package:wether_app/screens/search_page.dart';
import 'package:wether_app/widgets/no_weatherwidget.dart';
import 'package:wether_app/widgets/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            ),
            icon: const Icon(Icons.search_outlined, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is InitialState) {
            return NoWeatherWidget();
          } else if (state is WeatherLoadedState) {
             
            return WeatherInfo(
            );
          } else {
            return Text('oops there was an error');
          }
        },
      )
    );
  }
}
