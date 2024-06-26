import 'package:flutter/material.dart';

import '../../../../../core/utilities/styles/colors.dart';
import '../../../../../core/utilities/styles/fonts.dart';
import '../../../../../core/utilities/logic/responsive.dart';

class FlockItem extends StatelessWidget {
  const FlockItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(12)),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset('assets/images/Ellipse.png'),
            SizedBox(width: ResponsiveCalc().widthRatio(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Layer',
                  style: MyFonts.textStyle12,
                ),
                Text(
                  '3 birds - 23/01/2024',
                  style: MyFonts.textStyle10.copyWith(color: primaryGrayColor),
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_off_outlined, size: 24),
            )
          ]),
          SizedBox(height: ResponsiveCalc().heightRatio(5)),
          const Divider()
        ],
      ),
    );
  }
}