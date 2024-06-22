import 'package:flutter/material.dart';

class ResponsiveCalc {
  double _height = 0;
  double _width = 0;

  ResponsiveCalc._privateConstructor();

  static ResponsiveCalc? _instance;

  factory ResponsiveCalc() {
    _instance ??= ResponsiveCalc._privateConstructor();
    return _instance!;
  }

  factory ResponsiveCalc.getInstance(BuildContext context) {
    if (_instance == null) {
      _instance = ResponsiveCalc._privateConstructor();
      _instance!.initResponsive(context);
    }
    return _instance!;
  }

  void initResponsive(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  double widthRatio(double widgetWidth) {
    return _width * widgetWidth / 360;
  }

  double heightRatio(double widgetHeight) {
    return _height * widgetHeight/800;
    }
}