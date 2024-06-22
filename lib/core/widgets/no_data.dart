import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/cupertino.dart';


import '../utilities/logic/responsive.dart';

class NoData extends StatelessWidget {
  const NoData({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveCalc().heightRatio(35),
          bottom: ResponsiveCalc().heightRatio(35)),
      child: Column(
        children: [
          Text(
            'No $title Added',
            style: MyFonts.textStyle16,
          ),
          SizedBox(height: ResponsiveCalc().heightRatio(35)),
          const Text(
            'Tab on add button below to add a new income',
            style: MyFonts.textStyle14,
          )
        ],
      ),
    );
  }
}
