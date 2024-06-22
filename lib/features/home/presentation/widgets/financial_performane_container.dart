import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class FinancialPerformanceContainer extends StatelessWidget {
  const FinancialPerformanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient:  const LinearGradient(
              begin: Alignment.centerRight, colors: blueLinear)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveCalc().widthRatio(21),
            vertical: ResponsiveCalc().heightRatio(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Financial Performance',
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
                              '5600LE',
                              style: MyFonts.textStyleCard14,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Total Expense',
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
                              '1800LE',
                              style: MyFonts.textStyleCard14,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Total Income',
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
                              '10000LE',
                              style: MyFonts.textStyleCard14,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Net Balance',
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
