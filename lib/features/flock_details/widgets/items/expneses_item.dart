import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';


import '../../../../core/utilities/logic/responsive.dart';
import '../../models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.flock});

  final ExpenseModel flock;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(22)),
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
                      .copyWith(color: const Color(0xffFF0000)),
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
