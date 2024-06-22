import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/features/profile/presentation/widgets/about_us_body_screen.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whiteColor,
      body: AboutUsBodyScreen(),
    );
  }
}
