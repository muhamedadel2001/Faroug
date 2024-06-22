import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/features/inventory/presentation/widgets/custom_button_inventory.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_circular_button.dart';

class TapOnButtonInventory extends StatelessWidget {
  const TapOnButtonInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tap On',
          style: MyFonts.textStyle14.copyWith(color: blackColor),
        ),
        const SizedBox(
          width: 3,
        ),
        const CustomButtonInventory(),
        const SizedBox(
          width: 3,
        ),
        Flexible(
          child: Text(
            'below to add a new item ',
            style: MyFonts.textStyle14.copyWith(color: blackColor),
          ),
        ),
      ],
    );
  }
}
