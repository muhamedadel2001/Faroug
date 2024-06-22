import 'package:flutter/material.dart';

import '../utilities/styles/colors.dart';
import '../utilities/styles/fonts.dart';

class HintActionLine extends StatelessWidget {
  const HintActionLine(
      {super.key,
        required this.hintText,
        required this.buttonText,
        required this.lineAction});
  final String hintText;
  final String buttonText;
  final void Function() lineAction;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        hintText,
        style: MyFonts.textStyle14.copyWith(color: Colors.black),
      ),
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: lineAction,
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          child: Text(
            '  $buttonText  ',
            style: MyFonts.textStyle14.copyWith(color: primaryPurple),
          ),
        ),
      )
    ]);
  }
}