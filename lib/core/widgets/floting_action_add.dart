import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key, required this.navigate});
  final void Function() navigate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveCalc().heightRatio(65),
      width: ResponsiveCalc().widthRatio(65),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: list), shape: BoxShape.circle),
      child: InkWell(
        onTap: navigate,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
