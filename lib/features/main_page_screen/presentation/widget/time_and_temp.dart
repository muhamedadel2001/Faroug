import 'package:flutter/material.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../data/models/weather_model.dart';

class TimeAndTemp extends StatelessWidget {
  const TimeAndTemp({
    super.key,
    required this.hourly,
  });

  final HourlyForecast hourly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hourly.time,
          style: MyFonts.textStyle14.copyWith(color: Colors.white),
        ),
        Image.network(hourly.iconUrl),
        Text(
          '${hourly.temp}°',
          style: MyFonts.textStyle14.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
