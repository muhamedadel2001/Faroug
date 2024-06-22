import 'package:flutter/material.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;


class ResetNewPasswordScreenBody extends StatelessWidget {
  const ResetNewPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 55.0, left: 25, right: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircularButton(
              pressAction: () =>
                  Navigator.of(context).pushReplacementNamed(screens.loginScreen),
              icon: Icons.navigate_before_outlined,
            ),
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(44),
          ),
          const Text(
            "Reset your password",
            style: MyFonts.textStyle32,
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(26),
          ),
          Text(
            "Enter your new password.",
            style: MyFonts.textStyle18.copyWith(color: primaryGrayColor),
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(56),
          ),
          const CustomTextFormField(
            hintText: "New Password",
            suffixIcon: Icons.visibility_off_outlined,
            prefixIcon: Icons.lock_open_outlined,
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(30),
          ),
          const CustomTextFormField(
            hintText: "New Password",
            suffixIcon: Icons.visibility_off_outlined,
            prefixIcon: Icons.lock_open_outlined,
          ),
          SizedBox(
            height: ResponsiveCalc().heightRatio(133),
          ),
          PrimaryButton(
              text: "Confirm",
              pressAction: () {

               Navigator.pushNamedAndRemoveUntil(context, screens.congratsScreen, (route) => false);
              }),
        ],
      ),
    );
  }
}
