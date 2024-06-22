import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/shimmer_loading.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/time_and_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../data/services/weather_service.dart';
import '../manager/weather_cubit/weather_cubit.dart';
import '../manager/weather_cubit/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  final WeatherCubit weatherCubit = WeatherCubit(WeatherService());
  String city = SharedPrefUtil().getCity()!;
  @override
  void initState() {
    super.initState();
    weatherCubit.fetchWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: weatherCubit,
      builder: (context, state) {
        if (state.isLoading) {
          return buildShimmerLoading();
        } else if (state.errorMessage != null) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state.currentWeather == null || state.forecast == null) {
          return const Center(child: Text('No data'));
        } else {
          return _buildWeatherContent(state);
        }
      },
    );
  }

  Widget _buildWeatherContent(WeatherState state) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: ResponsiveCalc().widthRatio(322),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        state.currentWeather!.city,
                        style: MyFonts.textStyle20.copyWith(color: Colors.white),
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Text(
                    state.currentWeather!.description,
                    style: MyFonts.textStyle16.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Text(
                '${state.currentWeather!.currentTemp}°',
                style: MyFonts.textStyle32.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(118),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.forecast!.hourlyForecast.length,
              itemBuilder: (context, index) {
                var hourly = state.forecast!.hourlyForecast[index];
                return TimeAndTemp(hourly: hourly);
              },
            ),
          ),
        ],
      ),
    );
  }


}


