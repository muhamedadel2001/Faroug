import 'package:finalproject/features/main_page_screen/data/services/water_intake/cubit/water_cubit.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/vertical_barlandicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';

class HomeScreenCards extends StatefulWidget {
  const HomeScreenCards({super.key});

  @override
  State<HomeScreenCards> createState() => _HomeScreenCardsState();
}

class _HomeScreenCardsState extends State<HomeScreenCards> {
  @override
  void initState() {
    BlocProvider.of<WaterCubit>(context).getWaterInTake();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WaterCubit>(context);
    return BlocConsumer<WaterCubit, WaterState>(
      listener: (context, state) {
        if (state is WaterSuccess) {
          cubit.waterUsed = state.waterUsed;
          cubit.liters = state.liters;
        }
      },
      builder: (context, state) {
        if (state is WaterSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ResponsiveCalc().heightRatio(315),
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalBarIndicatorWidget(
                            percent: cubit.waterUsed / cubit.liters,
                          ),
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
                                  '${cubit.waterUsed}',
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
                                  '12am - 11:59am',
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
