
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/styles/stataic_text.dart';
import 'package:finalproject/features/profile/presentation/widgets/app_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utilities/logic/responsive.dart';

class AboutUsBodyScreen extends StatelessWidget {
  const AboutUsBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveCalc().widthRatio(25),
                vertical: ResponsiveCalc().heightRatio(30)),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBARSectionProfile(title: 'About Us'),
                Padding(
                  padding: EdgeInsets.only(
                      left: ResponsiveCalc().widthRatio(98),
                      top: ResponsiveCalc().heightRatio(20)),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo (1).svg',
                        width: ResponsiveCalc().widthRatio(90),
                        height: ResponsiveCalc().heightRatio(150),
                      ),
                      const Text(
                        'Faroug',
                        style: MyFonts.textStyle40,
                      ),
                      SizedBox(
                        height: ResponsiveCalc().heightRatio(22),
                      ),
                    ],
                  ),
                ),
                const Text(
                  aboutUs,
                  style: MyFonts.textStyle12,
                )
              ],
            ))));
  }
}
