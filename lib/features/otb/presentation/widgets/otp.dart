
import 'package:flutter/material.dart';

import 'otp_box_field.dart';

class Otp extends StatelessWidget {
  const Otp(
      {super.key,
      required this.firstController,
      required this.secondController,
      required this.thirdController,
      required this.forthController});
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController forthController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpBoxField(controller: firstController),
        OtpBoxField(controller: secondController),
        OtpBoxField(controller: thirdController),
        OtpBoxField(controller: forthController),
      ],
    );
  }
}
