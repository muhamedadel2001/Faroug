
import 'package:finalproject/features/otb/presentation/widgets/account_verfication_code_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/logic/responsive.dart';




class AccountVerficationCode extends StatelessWidget {
  const AccountVerficationCode({super.key, required this.verficationMethod});
  final String verficationMethod;
  @override
  Widget build(BuildContext context) {
    ResponsiveCalc.getInstance(context);
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: AccountVerficationCodeBody(
                verficationMethod: verficationMethod)),
      ]),
    );
  }
}
