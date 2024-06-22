import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';

import '../utilities/logic/responsive.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/error 1.png'),
            SizedBox(
              height: ResponsiveCalc.getInstance(context).heightRatio(37.14),
            ),
            Text(
              'Page Not Found',
              style: MyFonts.textStyle18.copyWith(
                color: Colors.black,
                fontFamily: 'Poppins-Regular.ttf',
              ),
            ),
            SizedBox(
              height: ResponsiveCalc.getInstance(context).heightRatio(18.13),
            ),
            Text(
              'Try and check your internet connection',
              style: MyFonts.textStyle14.copyWith(
                color: Colors.black,
                fontFamily: 'Poppins-Regular.ttf',
              ),
            ),
            const Spacer(),
            PrimaryButton(text: 'Back To Home', pressAction: () {}),
            SizedBox(
              height: ResponsiveCalc.getInstance(context).heightRatio(29),
            ),
          ],
        ),
      ),
    );
  }
}
