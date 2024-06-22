import 'package:flutter/material.dart';

import '../utilities/styles/fonts.dart';
import '../utilities/logic/responsive.dart';
import 'custom_primary_button.dart';

class SuccessRegistration extends StatelessWidget {
  const SuccessRegistration({
    Key? key,
    //required this.name,
  }) : super(key: key);

  //final String name;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/Group.png',
                  width: 266.45,
                  height: 292.39,
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(55.61),
                ),
                 Text(
                  'Welcome' ,/*$name'*/
                  style: MyFonts.textStyle20.copyWith(fontWeight: FontWeight.bold)

                  ),

                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(5),
                ),
                const Text(
                  'You are all set now, let’s reach your\n goals together with us',
                  style: MyFonts.textStyleForm12,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: ResponsiveCalc.getInstance(context).heightRatio(56),
                ),
                PrimaryButton(
                  text: 'Go To Home',
                  pressAction: () {},
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