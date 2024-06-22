import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/logic/responsive.dart';
import '../../../core/widgets/custom_primary_button.dart';

class HealthyChickenScreen extends StatelessWidget {
  const HealthyChickenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/healthy.png',
                width: ResponsiveCalc().widthRatio(255),
                height: ResponsiveCalc().heightRatio(327),
              ),
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(36),
            ),
            const Text(
              "Congratulations, Your \n Chicken Is Healthy",
              style: MyFonts.textStyle20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(29),
            ),
            const Text(
              "Your Chicken has no detected diseases, we \n hope it stays in good health forever!",
              style: MyFonts.textStyleForm12,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(100),
            ),
            PrimaryButton(
              text: 'Back',
              pressAction: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
