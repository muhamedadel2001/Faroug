import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../../../../core/utilities/logic/responsive.dart';

class VerticalBarIndicatorWidget extends StatelessWidget {
  const VerticalBarIndicatorWidget({super.key, required this.percent});
  final double percent;
  @override
  Widget build(BuildContext context) {
    return VerticalBarIndicator(
      percent: percent,
      width: ResponsiveCalc().widthRatio(20),
      height: ResponsiveCalc().heightRatio(275),
      color: const [
        Color(0xffC58BF2),
        Color(0xffB4C0FE),
      ],
    );
  }
}
