import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class FinancialAnalysisContainer extends StatelessWidget {
  const FinancialAnalysisContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
              begin: Alignment.centerRight, colors: opacityLinear)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveCalc().widthRatio(21),
            vertical: ResponsiveCalc().heightRatio(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Financial Analysis',
              style: MyFonts.textStyle16,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(12),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          '50LE',
                          style: MyFonts.textStyleCard14,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Cost per bird',
                          style: MyFonts.textStyle10,
                        )
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(10),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          '200',
                          style: MyFonts.textStyleCard14,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'sold birds',
                          style: MyFonts.textStyle10,
                        )
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(10),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          '100000LE',
                          style: MyFonts.textStyleCard14,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Profit',
                          style: MyFonts.textStyle10,
                        )
                      ],
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
