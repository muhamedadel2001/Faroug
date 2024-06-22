import 'package:finalproject/features/flock_details/models/income_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/styles/fonts.dart';
import '../../../core/utilities/logic/responsive.dart';
import '../../../core/widgets/custom_circular_button.dart';
import '../concrets/abstract_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.myItem});
  final MyItem myItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        margin: EdgeInsets.only(
            top: ResponsiveCalc().heightRatio(43),
            bottom: ResponsiveCalc().heightRatio(5),
            left: ResponsiveCalc().widthRatio(27)),
        alignment: Alignment.centerLeft,
        child: CircularButton(
          pressAction: () => Navigator.of(context).pop(),
          icon: Icons.arrow_back_ios_rounded,
        ),
      ),
      Text(myItem.getTitle, style: MyFonts.textStyle24),
      SizedBox(height: ResponsiveCalc().heightRatio(20)),
      /* NoData(title: myItem.getTitle)*/
      myItem.buildFiltration(),
      SizedBox(height: ResponsiveCalc().heightRatio(11)),
      //bloc builder is here --->>>>
      Expanded(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (ctx, idx) => myItem.buildItem(IncomeModel()),
        ),
      )
    ]));
  }
}
