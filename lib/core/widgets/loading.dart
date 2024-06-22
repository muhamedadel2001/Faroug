import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utilities/styles/colors.dart';
import '../utilities/logic/responsive.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double percent = 0.43;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Petbarn-visual-identity-by-Lan-unscreen 1.png',
              width: ResponsiveCalc().widthRatio(98),
              height: ResponsiveCalc().heightRatio(132),
            ),
            SizedBox(height: ResponsiveCalc().heightRatio(29)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                backgroundColor: const Color(0xffF7F8F9),
                barRadius: const Radius.circular(5),
                animation: true,
                lineHeight: 13.0,
                animationDuration: 2000,
                percent: percent,
                progressColor: brandPrimaryColor,
              ),
            ),
            SizedBox(height: ResponsiveCalc().heightRatio(28)),
            const Text(
              'Loading',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              '${(percent * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
