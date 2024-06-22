
import 'package:flutter/material.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/logic/responsive.dart';
class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: thirdGrayColor,
            height:ResponsiveCalc().heightRatio(32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(color: blackColor,fontFamily: "Poppins",fontSize: 12),
          ),
        ),
        Expanded(
          child: Divider(
            color: thirdGrayColor,
            height: ResponsiveCalc().heightRatio(32),
          ),
        ),
      ],
    );
  }
}