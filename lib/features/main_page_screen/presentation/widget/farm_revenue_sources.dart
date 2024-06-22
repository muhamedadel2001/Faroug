import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/inventory/presentation/inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/widgets/custom_tab_bar_button.dart';
import 'custom_pie_chart.dart';

class FarmRevenueCard extends StatelessWidget {
  final double percentage;

  const FarmRevenueCard({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    List<Color> list = [const Color(0xffC58BF2), const Color(0xffEEA4CE)];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, top: 26),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farm Revenue Sources',
              style: MyFonts.textStyle16.copyWith(color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  'Eggs makes ${percentage.toInt()}% of revenue',
                  style: MyFonts.textStyle12.copyWith(color: Colors.white),
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(50.0),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomPieChart(percentage: percentage),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(10.0),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: TabBarButton(
                  text: 'View More',
                  pressAction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider(
                                  create: (context) => NavBarCubit(),
                                  child: Home(
                                    index: 0,
                                  ),
                                )));
                  },
                  clr: false,
                )),
            SizedBox(
              height: ResponsiveCalc().heightRatio(15),
            )
          ],
        ),
      ),
    );
  }
}
