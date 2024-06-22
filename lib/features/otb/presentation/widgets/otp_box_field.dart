
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class OtpBoxField extends StatelessWidget {
  const OtpBoxField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      width: ResponsiveCalc().widthRatio(70.7),
      height: ResponsiveCalc().heightRatio(62.19),
      child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          validator: validator,
          onChanged: (val) {
            if (val.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: MyFonts.textStyle24,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              enabledBorder: customOutlinedBorder(),
              focusedBorder: customOutlinedBorder()),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1)
          ]),
    );
  }

  BorderSide customBorderSide() {
    return const BorderSide(
      width: 1.26,
      color: Color(0xff96B3FE),
      style: BorderStyle.solid,
    );
  }

  customOutlinedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.42),
        borderSide: customBorderSide());
  }

  String? validator(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Required';
    }
    return null;
  }
}
