import 'package:finalproject/features/profile/presentation/widgets/about_us_screen.dart';
import 'package:finalproject/features/profile/presentation/widgets/privacy_policy_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/linear_gradient_widget.dart';

class AccountCardProfileSection extends StatelessWidget {
  const AccountCardProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: whiteColor,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: ResponsiveCalc().widthRatio(315),
        height: ResponsiveCalc().heightRatio(150),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveCalc().widthRatio(20),
              vertical: ResponsiveCalc().heightRatio(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: MyFonts.textStyle16,
              ),
              Expanded(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsScreen()));
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const LinearGradientWidget(
                      iconData: Icons.mail_outline_rounded),
                  title: const Text(
                    'About Us',
                    style: MyFonts.textStyle14,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next_rounded,
                    color: primaryGrayColor,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen()));
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const LinearGradientWidget(iconData: Icons.privacy_tip),
                  title: const Text(
                    'Privacy Policy',
                    style: MyFonts.textStyle14,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next_rounded,
                    color: primaryGrayColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
