import 'package:finalproject/features/sign_up/presentation/widget/text_form_field_nubers_of_birds.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'country_form_filed.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/Vector-Section.png",
              width: ResponsiveCalc().widthRatio(375),
              height: ResponsiveCalc().heightRatio(350),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(19),
            ),
            const Text(
              "Let’s complete your profile",
              style: MyFonts.textStyle20,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "It will help us to know more about your farm!",
              style: MyFonts.textStyle12,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(34),
            ),
            const CustomTextFormField(
              hintText: "Farm Name",
              prefixIcon: Icons.home_outlined,
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(9),
            ),
            CountryFormField(),
            SizedBox(
              height: ResponsiveCalc().heightRatio(9),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: ResponsiveCalc().widthRatio(142),
                    height: ResponsiveCalc().heightRatio(48),
                    child: const CustomTextFormField(
                      hintText: "City",
                      prefixIcon: Icons.location_on_outlined,
                    )),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(31),
                ),
                SizedBox(
                    width: ResponsiveCalc().widthRatio(142),
                    height: ResponsiveCalc().heightRatio(48),
                    child: const CustomTextFormField(
                      hintText: "Village",
                      prefixIcon: Icons.location_on_outlined,
                    )),
              ],
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(9),
            ),
            const BirdCounterFormField(),
            SizedBox(
              height: ResponsiveCalc().heightRatio(24),
            ),
            PrimaryButton(
              text: "Next",
              pressAction: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, screens.successScreen, (route) => false);
                //go home....
              },
            )
          ],
        ),
      ),
    );
  }
}
