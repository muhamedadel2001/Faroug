import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

import '../utilities/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.text,
      required this.pressAction,
      this.clr = true});
  final String text;
  final void Function() pressAction;
  final bool? clr;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.875,
      height: height * 0.075,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: clr!
                  ? [brandPrimaryColor, brandSecondColor]
                  : [primaryPurple, secondPurple])),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(99),
        child: InkWell(
            splashColor: Colors.white.withOpacity(0.001),
            child: Center(
                child: Text(
              text,style: MyFonts.textStyleButton16,
            )),
            onTap: () {
              pressAction();
            }),
      ),
    );
  }
}
