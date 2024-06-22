import 'package:dio/dio.dart';

import '../models/weather_model.dart';


class WeatherService {
  final String apiKey = '36660978117d4caa86804256241106';
  final Dio dio = Dio();

  Future<WeatherModel> fetchCurrentWeather(String city) async {
    final response = await dio.get(
      'http://api.weatherapi.com/v1/current.json',
      queryParameters: {
        'key': apiKey,
        'q': city,
        'aqi': 'no',
      },
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load current weather data');
    }
  }

  Future<WeatherForecastModel> fetchForecast(String city) async {
    final response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        'key': apiKey,
        'q': city,
        'days': 1,
        'aqi': 'no',
        'alerts': 'no',
      },
    );

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
