import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';

class CustomButtonInventory extends StatelessWidget {
  const CustomButtonInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveCalc().heightRatio(40),
      width: ResponsiveCalc().widthRatio(40),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: [brandSecondColor, brandPrimaryColor]),
          shape: BoxShape.circle),
      child: Material(
        borderRadius: BorderRadius.circular(90),
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
