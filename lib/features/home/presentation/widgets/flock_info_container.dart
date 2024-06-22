import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlockInfoContainer extends StatelessWidget {
  const FlockInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
              begin: Alignment.centerRight, colors: blueLinear)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveCalc().widthRatio(21),
            vertical: ResponsiveCalc().heightRatio(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'White Chicken',
                    style: MyFonts.textStyle16,
                  ),
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(46),
                ),
                Image.asset(
                  'assets/images/Edit Square.png',
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(18),
                ),
                Image.asset(
                  'assets/images/Add User.png',
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(18),
                ),
                Image.asset(
                  'assets/images/Paper Fail.png',
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(11),
            ),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5 Days',
                        style: MyFonts.textStyle10,
                      ),
                      Text(
                        'Number of Birds: 50',
                        style: MyFonts.textStyle10,
                      ),
                      Text(
                        'Alive : 5',
                        style: MyFonts.textStyle10,
                      ),
                      Text(
                        'Dead : 2',
                        style: MyFonts.textStyle10,
                      ),
                      Text(
                        'Sold : 120',
                        style: MyFonts.textStyle10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(70),
                ),
                Expanded(
                    child: SvgPicture.asset('assets/images/Component 1.svg'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
