import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_cubit.dart';
import 'package:wether_app/models/weather_model.dart';
import 'package:wether_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a City',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xfff6a944),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 84),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
          
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: const TextStyle(color: Color(0xfff6a944)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'Enter City Name',
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: const Icon(Icons.search, color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 16,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xfff6a944), width: 2),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xfff6a944), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? wetherModel;
