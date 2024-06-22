import 'package:finalproject/features/new_flock/widgets/new_flock_item.dart';
import 'package:flutter/material.dart';

import '../../core/utilities/styles/fonts.dart';
import '../../core/utilities/logic/responsive.dart';
import '../../core/widgets/custom_ two_options_tab_bar_buttons.dart';

class NewFlock extends StatefulWidget {
  const NewFlock({super.key});

  @override
  State<NewFlock> createState() => _NewFlockState();
}

class _NewFlockState extends State<NewFlock> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: ResponsiveCalc().heightRatio(80)),
          const Text('Flocks', style: MyFonts.textStyle32),
          SizedBox(height: ResponsiveCalc().heightRatio(32)),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ResponsiveCalc().widthRatio(20)),
            child: Row(
              children: [
                Expanded(
                  child: TwoOptionsTabBar(
                    text: 'Active Flock',
                    pressAction: () {
                      changeIdx(true);
                    },
                    clr: isActive,
                  ),
                ),
                SizedBox(width: ResponsiveCalc().widthRatio(20)),
                Expanded(
                  child: TwoOptionsTabBar(
                    text: 'Closed Flock',
                    pressAction: () {
                      changeIdx(false);
                    },
                    clr: !isActive,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveCalc().heightRatio(40)),
          const Text('total flocks : 5', style: MyFonts.textStyle16),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const NewFlockItem(),
            ),
          )
        ],
      ),
    );
  }

  void changeIdx(bool btn) {
    setState(() => isActive = btn);
  }
}
