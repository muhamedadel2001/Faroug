
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/widgets/custom_tab_bar_button.dart';
import 'chart_widget.dart';

class PoultryExchangeScreen extends StatefulWidget {
  const PoultryExchangeScreen({super.key});

  @override
  State<PoultryExchangeScreen> createState() => _PoultryExchangeScreenState();
}

class _PoultryExchangeScreenState extends State<PoultryExchangeScreen> {
  double percent = 0.43;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: Row(
              children: [
                const Text(
                  'Poultry exchange',
                  style: MyFonts.textStyle20,
                ),
                const Spacer(),
                TabBarButton(text: 'Weekly',
                  pressAction: () {  },),
              ],
            ),
          ),
          const ChartWidget(),
          SizedBox(height: ResponsiveCalc().heightRatio(20)),
          Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Fri, 28 Feb',
                            style: MyFonts.textStyle16
                                .copyWith(color: primaryGrayColor),
                          ),
                          const Spacer(),
                          const Text(
                            '60% ↑',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ResponsiveCalc().heightRatio(10)),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Chicken Price',
                        style: MyFonts.textStyle18,
                      ),
                    ),
                    SizedBox(height: ResponsiveCalc().heightRatio(10)),
                    LinearPercentIndicator(
                      backgroundColor: Colors.grey.shade200,
                      barRadius: const Radius.circular(5),
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2000,
                      percent: percent,
                      progressColor: brandPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );  
  }
}