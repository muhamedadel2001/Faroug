import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/widgets/custom_circular_button.dart';
import 'package:finalproject/features/home/presentation/widgets/analysis_flocks.dart';
import 'package:finalproject/features/home/presentation/widgets/records_flocks.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import 'flock_info_container.dart';

class FlockInfoBodyScreen extends StatefulWidget {
  const FlockInfoBodyScreen({super.key});

  @override
  State<FlockInfoBodyScreen> createState() => _FlockInfoBodyScreenState();
}

class _FlockInfoBodyScreenState extends State<FlockInfoBodyScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveCalc().widthRatio(23),
          vertical: ResponsiveCalc().heightRatio(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularButton(
            pressAction: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios_new,
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(22),
          ),
          const Text(
            'Flocks',
            style: MyFonts.textStyle32,
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(22),
          ),
          const FlockInfoContainer(),
          SizedBox(
            height: ResponsiveCalc().heightRatio(26),
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: TabBar(
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              controller: tabController,
              padding: const EdgeInsets.all(10),
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: brandPrimaryColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border:
                            Border.all(width: 1, color: Colors.transparent)),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Records',
                          style: TextStyle(),
                        )),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border:
                            Border.all(width: 1, color: Colors.transparent)),
                    child: const Align(
                        alignment: Alignment.center, child: Text('Analysis')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: const [
              RecordsFlocks(),
              AnalysisFlocks(),
            ]),
          )
        ],
      ),
    );
  }
}
