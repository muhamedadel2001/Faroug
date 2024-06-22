import 'package:finalproject/features/home/presentation/flock_info_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/styles/colors.dart';
import '../../../core/utilities/styles/fonts.dart';
import '../../../core/utilities/logic/responsive.dart';

class NewFlockItem extends StatelessWidget {
  const NewFlockItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FlockInfoScreen()));
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
                  const Text(
                    'Fayoumi Chickens',
                    style: MyFonts.textStyle12,
                  ),
                  Text(
                    '5 Days',
                    style:
                        MyFonts.textStyle10.copyWith(color: primaryGrayColor),
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_circle_right_outlined, size: 24),
              )
            ]),
            SizedBox(height: ResponsiveCalc().heightRatio(5)),
            const Divider()
          ],
        ),
      ),
    );
  }
}
