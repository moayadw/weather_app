import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/cubits/get_weather_component/get_weather_states.dart';
import 'package:wether_app/models/weather_model.dart';
import 'package:wether_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel = await WetherService(dio: Dio())
          .getCurrentWether(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
