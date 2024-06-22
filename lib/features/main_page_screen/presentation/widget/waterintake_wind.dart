import 'package:finalproject/features/main_page_screen/presentation/widget/vertical_barlandicator_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import 'gradient_circular_progress_indicator.dart';

class HomeScreenCards extends StatefulWidget {
  const HomeScreenCards({super.key});

  @override
  State<HomeScreenCards> createState() => _HomeScreenCardsState();
}

class _HomeScreenCardsState extends State<HomeScreenCards> {
  @override
  Widget build(BuildContext context) {
    return  Column( // Changing Row to Column for vertical scroll
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ResponsiveCalc().heightRatio(315),
                width: ResponsiveCalc().widthRatio(150),
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Row(
                      children: [
                        VerticalBarIndicatorWidget(),
                        SizedBox(
                          width: ResponsiveCalc().widthRatio(10),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Water Intake',
                                style: MyFonts.textStyle12,
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(5),
                              ),
                              Text(
                                '12 Liters',
                                style: MyFonts.textStyle14
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(10),
                              ),
                              const Text(
                                'Real time updates',
                                style: MyFonts.textStyle10,
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(10),
                              ),
                              const Text(
                                '6am - 7am',
                                style: MyFonts.textStyle10,
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(3),
                              ),
                              Text(
                                '2000 ml',
                                style: MyFonts.textStyle10
                                    .copyWith(color: const Color(0xffC58BF2)),
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(30),
                              ),
                              const Text(
                                '8am - 9am',
                                style: MyFonts.textStyle10,
                              ),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(3),
                              ),
                              Text(
                                '4000 ml',
                                style: MyFonts.textStyle10.copyWith(
                                  color: const Color(0xffC58BF2),
                                ),
                              )
                            ],
                          ),
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
