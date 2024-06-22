import 'package:finalproject/features/sign_up/presentation/widget/signup_screen_body.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupScreenBody(),
    );
  }
}
