
import 'package:flutter/material.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';


class GradientCircularProgressIndicatorWidget extends StatefulWidget {
  const GradientCircularProgressIndicatorWidget({super.key});

  @override
  State<GradientCircularProgressIndicatorWidget> createState() => _GradientCircularProgressIndicatorWidgetState();
}

class _GradientCircularProgressIndicatorWidgetState extends State<GradientCircularProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveCalc().heightRatio(66),
      width: ResponsiveCalc().widthRatio(66),
      child: GradientCircularProgressIndicator(
        stroke: 10,
        gradient: const LinearGradient(
          colors: [primaryPurple, Color(0xffB4C0FE)],
        ),
        //animation: true,
        progress: 0.7,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: ResponsiveCalc().heightRatio(50),
              height: ResponsiveCalc().heightRatio(50),
              decoration: const BoxDecoration(
                gradient:
                LinearGradient(colors: blueLinear),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              child: Text(
                "3 Kg \n left",
                style: MyFonts.textStyle10
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        //circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}