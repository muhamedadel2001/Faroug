// weather_state.dart


import '../../../data/models/weather_model.dart';

class WeatherState {
  final WeatherModel? currentWeather;
  final WeatherForecastModel? forecast;
  final bool isLoading;
  final String? errorMessage;

  WeatherState({
    this.currentWeather,
    this.forecast,
    this.isLoading = false,
    this.errorMessage,
  });

  WeatherState copyWith({
    WeatherModel? currentWeather,
    WeatherForecastModel? forecast,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      forecast: forecast ?? this.forecast,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
