import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

import '../utilities/logic/responsive.dart';
import 'custom_primary_button.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/Success Illustration.png',
                  width: 172,
                  height: 162,
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(41),
                ),
                /** make a gradient text **/
                ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (Rect bounds) {
                    return  LinearGradient(
                      colors: list,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Congrats!',
                    style: MyFonts.textStyle30
                  ),
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(12),
                ),
                Text(
                  'Password reset successful',
                  style: MyFonts.textStyle24.copyWith(
                    color: darkColor,
                  ),
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(33),
                ),
                PrimaryButton(
                  text: 'Confirm',
                  pressAction: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const SuccessRegistration(name: 'Menna'),
                      ),
                    );*/
                  },
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context)
                      .heightRatio((height * 23.125) / 100),
                ),
              ],
            ),
            ),
        );
    }
}