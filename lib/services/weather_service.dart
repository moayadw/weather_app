import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wether_app/models/weather_model.dart';

class WetherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a85caa6504ba470a973112440261210';
  
  WetherService({required this.dio});
  Future<WeatherModel> getCurrentWether({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );

      WeatherModel wetherModel = WeatherModel.fromJson(response.data);
      return wetherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data?['error']?['message'] ??
          'oops ther was an eror try again later';
      throw Exception(errorMessage);
    } catch (e, stack) {
      log('PARSE ERROR: $e', stackTrace: stack);
      throw Exception(e.toString());
    }
  }
}
