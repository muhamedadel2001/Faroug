import 'package:flutter/material.dart';

class FieldConfig {
  final String fieldName;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;


  FieldConfig(
       {
         this.prefixIcon,
    this.suffixIcon,
    required this.fieldName,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  }) : controller = TextEditingController();
}
