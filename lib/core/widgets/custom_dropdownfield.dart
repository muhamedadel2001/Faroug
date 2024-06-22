import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:flutter/material.dart';

import '../utilities/styles/colors.dart';
import '../utilities/styles/fonts.dart';

class CustomDropDownField extends StatelessWidget {
  final List list;
  final TextEditingController textEditingController;
  final String? Function(String?)? validate;
  final String text;
  const CustomDropDownField(
      {super.key,
      required this.list,
      required this.textEditingController,
      this.validate,
      required this.text});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.875,
      child: DropdownButtonFormField<String>(
        validator: validate,
        borderRadius: BorderRadius.circular(16),
        alignment: Alignment.bottomRight,
        elevation: 2,
        hint: Padding(
          padding: EdgeInsets.only(right: ResponsiveCalc().widthRatio(45)),
          child: Text(text),
        ),
        icon: const Icon(Icons.arrow_drop_down_outlined),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.location_on_outlined),
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
            filled: true),
        items: list.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (String? value) {
          textEditingController.text = value!;
        },
      ),
    );
  }
}
