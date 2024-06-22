import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';


class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: secondPurple,
            value: percentage,
            title: '${percentage.toInt()}',
            radius: 40,
            titleStyle:MyFonts.textStyle12.copyWith(color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.white,
            value: 100 - percentage,
            title: '',
            radius: 40,
          ),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 30,
        startDegreeOffset: -90,
      ),
    );
  }
}