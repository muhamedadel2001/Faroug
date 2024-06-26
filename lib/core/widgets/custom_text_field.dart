import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.prefixIcon,
      this.suffixIcon,
      this.type,
      this.suffixPress,
      this.onTap,
      this.validate,
      this.controller,
       this.hintText,
      this.enabled})
      : super(key: key);
  final String? hintText;
  final IconData? prefixIcon;
  final bool? enabled;
  final IconData? suffixIcon;
  final TextInputType? type;
  final void Function()? suffixPress;
  final void Function()? onTap;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final isPassword = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        enabled: enabled ?? true,
        style: MyFonts.textStyleForm12.copyWith(color: Colors.black),
        onTap: onTap,
        controller: controller,
        keyboardType: type,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
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
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixPress, icon: Icon(suffixIcon))
              : null,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor)),
              
        ),
      ),
    );
  }
}
