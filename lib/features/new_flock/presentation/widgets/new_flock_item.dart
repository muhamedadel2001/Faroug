import 'package:finalproject/core/utilities/screens.dart';

import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class NewFlockItem extends StatelessWidget {
  const NewFlockItem({super.key, required this.flockModel});
  final FlockModel flockModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(flockInfoScreen, arguments: {'flock_model': flockModel});
      },
      child: Container(
        margin: EdgeInsets.only(
            left: ResponsiveCalc().widthRatio(25),
            right: ResponsiveCalc().widthRatio(25),
            bottom: ResponsiveCalc().heightRatio(12)),
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset('assets/images/active_flock.png'),
              SizedBox(width: ResponsiveCalc().widthRatio(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${flockModel.flockName}",
                    style: MyFonts.textStyle12,
                  ),
                  Text(
                    'amount : ${flockModel.number}',
                    style:
                        MyFonts.textStyle10.copyWith(color: primaryGrayColor),
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_circle_right_outlined, size: 24)
            ]),
            SizedBox(height: ResponsiveCalc().heightRatio(5)),
            const Divider()
          ],
        ),
      ),
    );
  }
}
