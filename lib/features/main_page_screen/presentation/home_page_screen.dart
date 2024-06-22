import 'package:finalproject/features/main_page_screen/presentation/widget/home_page_screen_body.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(child: HomePageScreenBody()),
      ),
    );
  }
}
