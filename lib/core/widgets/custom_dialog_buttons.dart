import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

class CustomDialogButtons extends StatelessWidget {
  final String text;
  final String image;
  final String action;
  const CustomDialogButtons(
      {super.key,
      required this.text,
      required this.image,
      required this.action});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      elevation: 0,
      icon: SizedBox(height: height * 0.15, child: Image.asset(image)),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent)),
      title:  Text(text,
        textAlign: TextAlign.center,
        style: MyFonts.textStyle16
      ),
      backgroundColor: Colors.white,
      content: Container(
        height: height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: borderColor,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Row(
            children: [
              Text(
                'Cancel',
                style: MyFonts.textStyle16.copyWith(
                    fontWeight: FontWeight.w400, color: secondGrayColor),
              ),
              SizedBox(width: width * 0.0479),
              Container(
                  width: width * 0.28,
                  height: height * 0.0570,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      gradient: const LinearGradient(
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                          colors: [brandPrimaryColor, brandSecondColor])),
                  child: Center(
                      child: Text(
                    action,
                    style: MyFonts.textStyleButton16,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
