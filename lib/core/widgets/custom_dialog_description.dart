import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import '../utilities/styles/colors.dart';

class CustomDialogWithDescription extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CustomDialogWithDescription({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      elevation: 0,
      icon: SizedBox(
          height: height * 0.17066666666666667,
          width: width * 0.424,
          child: Image.asset(image)),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent)),
      title: Text(
        textAlign: TextAlign.center,
        title,
        style: MyFonts.textStyle32,
      ),
      backgroundColor: Colors.white,
      content: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.071),
          child: Text(
            textAlign: TextAlign.center,
            description,
            style: const TextStyle(
                color: primaryGrayColor,
                fontSize: 17,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
