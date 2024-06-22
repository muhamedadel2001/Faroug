import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class AppBARSectionProfile extends StatelessWidget {
  final String title;
  const AppBARSectionProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title != 'Profile'
            ? Container(
                width: ResponsiveCalc().widthRatio(38),
                height: ResponsiveCalc().heightRatio(40),
                decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: blackColor,
                    size: 15,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.only(
              left: title == 'Profile'
                  ? ResponsiveCalc().widthRatio(130)
                  : title == 'Privacy Policy' || title == 'Profile Data'
                      ? ResponsiveCalc().widthRatio(70)
                      : ResponsiveCalc().widthRatio(90)),
          child: Text(
            title,
            style: MyFonts.textStyle16,
          ),
        )
      ],
    );
  }
}
