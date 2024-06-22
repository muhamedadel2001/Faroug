
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/colors.dart';


class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 1),
                const FlSpot(3, 4),
                const FlSpot(4, 6),
                const FlSpot(5, 2),
                const FlSpot(6, 4),
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFF0000),
                  Color(0xff92A3FD),
                  Color(0xff9DCEFF),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              barWidth: 4,
              isCurved: true,
              curveSmoothness: 0.35,
              preventCurveOverShooting: true,
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: primaryGrayColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('Sun', style: style);
                      break;
                    case 1:
                      text = const Text('Mon', style: style);
                      break;
                    case 2:
                      text = const Text('Tue', style: style);
                      break;
                    case 3:
                      text = const Text('Wed', style: style);
                      break;
                    case 4:
                      text = const Text('Thu', style: style);
                      break;
                    case 5:
                      text = const Text('Fri', style: style);
                      break;
                    case 6:
                      text = const Text('Sat', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        text,
                        SizedBox(height: ResponsiveCalc().heightRatio(2)),
                        Container(
                          height: ResponsiveCalc().heightRatio(2),
                          width: ResponsiveCalc().widthRatio(20),
                          color: primaryGrayColor,
                        ),
                      ],
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
          ),
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,
        ),
      ),
    );
  }
}