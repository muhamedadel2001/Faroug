
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/styles/stataic_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import 'app_bar_section.dart';

class PrivacyPolicyBodyScreen extends StatelessWidget {
  const PrivacyPolicyBodyScreen({super.key});

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
                    const AppBARSectionProfile(title: 'Privacy Policy'),
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(22),
                    ),
                    const Text(
                      privacyPolicy,
                      style: MyFonts.textStyle12,
                    )
                  ],
                ))));
  }
}
