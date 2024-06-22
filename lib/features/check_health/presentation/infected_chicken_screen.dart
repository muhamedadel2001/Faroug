import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/logic/responsive.dart';
import '../../../core/widgets/custom_primary_button.dart';

class InfectedChickenScreen extends StatelessWidget {
  const InfectedChickenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 117,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/sad_chick.png',
                width: ResponsiveCalc().widthRatio(173.52),
                height: ResponsiveCalc().heightRatio(269),
              ),
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(27),
            ),
            const Text(
              "Sadly, Your Chicken \n Has Coccidosis",
              style: MyFonts.textStyle20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(12),
            ),
            const Text(
              "Coccidiosis is a deadly disease that hampers \n chicken's productivity and welfare.",
              style: MyFonts.textStyleForm12,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(20),
            ),
            const Text(
              "The most popular treatment for coccidiosis is \n Amprolium, which blocks the parasite's ability \n to uptake and multiply.",
              style: MyFonts.textStyleForm12,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(50),
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
