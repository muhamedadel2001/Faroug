import 'package:finalproject/features/profile/presentation/widgets/privacy_plicy_body_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whiteColor,
      body: PrivacyPolicyBodyScreen(),
    );
  }
}
