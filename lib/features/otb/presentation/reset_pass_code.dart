

import 'package:finalproject/features/otb/presentation/widgets/reset_pass_code_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordCode extends StatelessWidget {
  const ResetPasswordCode({super.key, required this.verficationMethod});
  final String verficationMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: ResetPasswordCodeBody(verficationMethod: verficationMethod)),
      ]),
    );
  }
}
