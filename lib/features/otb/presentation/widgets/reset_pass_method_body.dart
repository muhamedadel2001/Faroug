import 'package:flutter/material.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;


import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import 'my_method.dart';

class ResetPasswordMethodBody extends StatelessWidget {
  const ResetPasswordMethodBody({super.key});

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
          'Reset your password',
          style: MyFonts.textStyle32,
        ),
        SizedBox(height: ResponsiveCalc().heightRatio(44)),
        SizedBox(
          width: ResponsiveCalc().widthRatio(338),
          child: const Text(
            'Select which contact details should we use to reset your password',
            style: MyFonts.textStyle14,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: ResponsiveCalc().heightRatio(26)),
        MyMethod(
            methodName: 'Via sms',
            userData: '01203175032',
            methodAction: () {
              viaSmsAction(context);
            }),
        MyMethod(
            methodName: 'Via email',
            userData: 'yehyasaeed_ewr@gamil.com',
            methodAction: () {
              viaEmailAction(context);
            }),
      ],
    );
  }

  viaSmsAction(BuildContext context) {
    Navigator.of(context).pushNamed(screens.verPassScreen,
        arguments: {'verficationMethod': 'phone number'});
  }

  viaEmailAction(BuildContext context) {
    Navigator.of(context)
        .pushNamed(screens.verPassScreen, arguments: {'verficationMethod': 'email'});
  }
}
