import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../models/feed_serve_model.dart';

class FeedServedItem extends StatelessWidget {
  const FeedServedItem({super.key, required this.flock});
  final FeedServeModel flock;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveCalc().widthRatio(315),
      height: ResponsiveCalc().heightRatio(125),
      margin: EdgeInsets.only(
          left: ResponsiveCalc().heightRatio(22),
          right: ResponsiveCalc().heightRatio(22),
          top: 0,
          bottom: ResponsiveCalc().widthRatio(16)),
      padding: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(15),
          right: ResponsiveCalc().widthRatio(20),
          top: 0,
          bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(colors: [
            const Color(0xff92A3FD).withOpacity(.2),
            const Color(0xff9DCEFF).withOpacity(.2)
          ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Corn',
                style: MyFonts.textStyle16,
              ),
              SizedBox(height: ResponsiveCalc().heightRatio(16)),
              Text(
                'Day3  18/01/2024 - Today',
                style: MyFonts.textStyle10.copyWith(color: primaryGrayColor),
              ),
              SizedBox(height: ResponsiveCalc().heightRatio(6)),
              Text(
                'Quantity: 3kg',
                style: MyFonts.textStyle10.copyWith(color: primaryGrayColor),
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/Edit Square.png',
                        width: ResponsiveCalc().widthRatio(16),
                        height: ResponsiveCalc().heightRatio(16),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/Paper Fail.png',
                        width: ResponsiveCalc().widthRatio(16),
                        height: ResponsiveCalc().heightRatio(16),
                      ))
                ],
              ),
              Image.asset(
                'assets/images/flour.png',
                height: ResponsiveCalc().heightRatio(50),
                width: ResponsiveCalc().widthRatio(45),
              )
            ],
          )
        ],
      ),
    );
  }
}
