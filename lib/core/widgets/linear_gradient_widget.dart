import 'package:flutter/material.dart';

import '../utilities/styles/colors.dart';

class LinearGradientWidget extends StatelessWidget {
  const LinearGradientWidget(
      {super.key, required this.iconData, this.size = 40, this.clr = true});
  final IconData iconData;
  final double? size;
  final bool? clr;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: clr! ? blueLinear : purpleLinear, // Your gradient colors
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: Icon(
        iconData,
        size: size,
        color: Colors.white, // This color will be replaced by the gradient
      ),
    );
  }
}