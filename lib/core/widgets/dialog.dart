import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:flutter/material.dart';

class HelperFunction {
  static customDialog() {
    return AlertDialog(
      icon: const Icon(Icons.add),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent)),
      title: const Text('ds'),
      backgroundColor:whiteColor ,
      content: const Text('sad sadsa sad'),
    );
  }
}
