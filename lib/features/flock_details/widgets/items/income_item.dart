import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../models/income_model.dart';

class IncomeItem extends StatelessWidget {
  const IncomeItem({super.key, required this.flock});
  final IncomeModel flock;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(22)),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Car Rent',
                  style: MyFonts.textStyle12,
                ),
                Text(
                  '5000',
                  style: MyFonts.textStyle20
                      .copyWith(color: const Color(0xff38CA44)),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline_rounded, size: 24))
          ]),
          const Divider()
        ],
      ),
    );
  }
}
