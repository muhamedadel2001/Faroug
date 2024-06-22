import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/logic/responsive.dart';
class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return // Google Sign In Button
      SizedBox(
        width: ResponsiveCalc().widthRatio(60),
        height: ResponsiveCalc().heightRatio(60),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // primary: whiteColor, // Background color
            // onPrimary: brandPrimaryColor, // Ripple color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: whiteColor),
            ),
          ),
          onPressed: () {
            // Handle Google Sign In
          },
          child: Image.asset(
            imagePath,
          ),
        ),
      );
  }
}