import 'package:flutter/material.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class BirdCounterFormField extends StatelessWidget {
  const BirdCounterFormField({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: MyFonts.textStyleForm12.copyWith(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: MyFonts.textStyleForm12,
          fillColor: borderColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor)),
          filled: true,
          hintText: 'Number of Birds',

          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0), // Adjust the padding as needed
            child: SizedBox(
              width: ResponsiveCalc().widthRatio(18),
              height: ResponsiveCalc().heightRatio(18),
              child: const ImageIcon(
                AssetImage('assets/images/R.png',),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
