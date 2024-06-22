// weather_cubit.dart

import 'package:bloc/bloc.dart';
import '../../../data/services/weather_service.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherState());

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(isLoading: true));
    try {
      final currentWeather = await weatherService.fetchCurrentWeather(city);
      final forecast = await weatherService.fetchForecast(city);
      emit(state.copyWith(
        currentWeather: currentWeather,
        forecast: forecast,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
