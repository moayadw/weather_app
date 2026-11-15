class WeatherModel {
  final String? cityName;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? condtion;
  final String? image;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condtion,
    required this.temp,
    required this.image,
  });
  factory WeatherModel.fromJson(json) {
    final day = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: day['condition']['icon'],
      condtion: day['condition']['text'],
      maxTemp: (day['maxtemp_c'] as num).toDouble(),
      minTemp: (day['mintemp_c'] as num).toDouble(),
      temp: (day['avgtemp_c'] as num).toDouble(),
    );
  }
}
