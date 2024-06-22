import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class MortalityFiltrationBar extends StatelessWidget {
  const MortalityFiltrationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ResponsiveCalc().widthRatio(8),
        right: ResponsiveCalc().widthRatio(8),
        top: ResponsiveCalc().heightRatio(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 6, right: 12, top: 8, bottom: 8),
              height: ResponsiveCalc().heightRatio(40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      offset: const Offset(0.0, 4),
                      blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Total Mortality: 5',
                style: MyFonts.textStyle12,
              ),
            ),
          ),
          SizedBox(width: ResponsiveCalc().widthRatio(8)),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 6, right: 12, top: 8, bottom: 8),
              height: ResponsiveCalc().heightRatio(40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0.0, 4),
                      blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Percentage: 1%',
                style: MyFonts.textStyle12,
              ),
            ),
          ),
          SizedBox(width: ResponsiveCalc().widthRatio(8)),
          Container(
            alignment: Alignment.center,
            height: ResponsiveCalc().heightRatio(40),
            width: ResponsiveCalc().widthRatio(87),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient:  const LinearGradient(colors: purpleLinear)),
            child: DropdownButton(
              value: 'All items',
              icon: const Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.white),
              hint: Text(
                'All Time',
                style: MyFonts.textStyle12.copyWith(color: Colors.white),
              ),
              items: const [],
              onChanged: (val) {},
            ),
          )
        ],
      ),
    );
  }
}
