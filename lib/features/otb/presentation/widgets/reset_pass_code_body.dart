import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/hint_actio_widget.dart';
import 'otp.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;

class ResetPasswordCodeBody extends StatefulWidget {
  const ResetPasswordCodeBody({super.key, required this.verficationMethod});
  final String verficationMethod;
  @override
  State<ResetPasswordCodeBody> createState() => _ResetPasswordCodeBodyState();
}

class _ResetPasswordCodeBodyState extends State<ResetPasswordCodeBody> {
  final TextEditingController firstController = TextEditingController();

  final TextEditingController secondController = TextEditingController();

  final TextEditingController thirdController = TextEditingController();

  final TextEditingController forthController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    forthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: ResponsiveCalc().heightRatio(63),
                left: ResponsiveCalc().widthRatio(26)),
            alignment: Alignment.centerLeft,
            child: CircularButton(
              pressAction: () => Navigator.of(context).pop(),
              icon: Icons.arrow_back_ios_rounded,
            ),
          ),
          SizedBox(height: ResponsiveCalc().heightRatio(44)),
          const Text(
            'Reset your password',
            style: MyFonts.textStyle32,
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: ResponsiveCalc().widthRatio(338),
            child: Text(
              'Enter the code we just sent to your ${widget.verficationMethod}.',
              style: MyFonts.textStyle14,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: ResponsiveCalc().heightRatio(44)),
          Form(
              key: _formKey,
              child: Otp(
                firstController: firstController,
                secondController: secondController,
                thirdController: thirdController,
                forthController: forthController,
              )),
          SizedBox(height: ResponsiveCalc().heightRatio(208)),
          PrimaryButton(text: 'Verify', pressAction: verifyAction),
          const SizedBox(height: 134),
          HintActionLine(
              hintText: 'Didn’t receive code?',
              buttonText: 'Resend',
              lineAction: () {})
        ],
      ),
    );
  }

  void verifyAction() {
    bool valid = _formKey.currentState!.validate();
    if (valid) {
      //still uncompleted
      //................
      checkMethod();
      Navigator.of(context).pushReplacementNamed(screens.newPassScreen);
    }
    return;
  }

  void checkMethod() {
    if (widget.verficationMethod == 'email') {
    } else {}
  }
}
