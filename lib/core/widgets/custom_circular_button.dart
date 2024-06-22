import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      required this.pressAction,
      required this.icon,
      this.clr = true});
  final void Function() pressAction;
  final IconData icon;
  final bool? clr;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.166,
      width: width * 0.166,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: clr!
                  ? [brandPrimaryColor, brandSecondColor]
                  : [primaryPurple, secondPurple]),
          shape: BoxShape.circle),
      child: Material(
        borderRadius: BorderRadius.circular(90),
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            pressAction();
          },
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
