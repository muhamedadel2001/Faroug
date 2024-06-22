import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset('assets/images/logo (1).svg')),
                const Text(
                  'Faroug',
                  style: MyFonts.textStyle40,
                ),
                const Text(
                  'Track your farm',
                  style: MyFonts.textStyle14,
                ),
              ],
            ),
          ),
          PrimaryButton(
              text: 'Get Started',
              pressAction: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, screens.onBoardingScreen, (route) => false);
              }),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
