import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;


class AccountVerficationMethodBody extends StatelessWidget {
  const AccountVerficationMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: ResponsiveCalc().heightRatio(63),
              left: ResponsiveCalc().widthRatio(26)),
          alignment: Alignment.centerLeft,
          child: CircularButton(
            pressAction: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_ios_rounded,
          ),
        ),
        SizedBox(height: ResponsiveCalc().heightRatio(26)),
        const Text(
          'Account Verfication',
          style: MyFonts.textStyle32,
        ),
        SizedBox(height: ResponsiveCalc().heightRatio(44)),
        const Text(
          'Choose a way to verify your account',
          style: MyFonts.textStyle14,
        ),
        SizedBox(height: ResponsiveCalc().heightRatio(224)),
        PrimaryButton(
            text: 'Verify via Email',
            pressAction: () {
              viaEmailAction(context);
            }),
        SizedBox(height: ResponsiveCalc().heightRatio(30)),
        PrimaryButton(
            text: 'Verify via phone number',
            pressAction: () {
              viaSmsAction(context);
            }),
      ],
    );
  }

  viaSmsAction(BuildContext context) {
    Navigator.of(context).pushNamed(screens.verCodeScreen,
        arguments: {'verficationMethod': 'phone number'});
  }

  viaEmailAction(BuildContext context) {
    Navigator.of(context)
        .pushNamed(screens.verCodeScreen, arguments: {'verficationMethod': 'email'});
  }
}
