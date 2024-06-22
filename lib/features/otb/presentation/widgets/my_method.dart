import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/linear_gradient_widget.dart';

class MyMethod extends StatelessWidget {
  const MyMethod(
      {super.key,
      required this.userData,
      required this.methodAction,
      required this.methodName});
  final String methodName;
  final String userData;
  final void Function() methodAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ResponsiveCalc().heightRatio(27),
          bottom: ResponsiveCalc().heightRatio(10),
          left: ResponsiveCalc().widthRatio(27)),
      child: ListTile(
        onTap: methodAction,
        title: Text(methodName,
            style: MyFonts.textStyle18
                .copyWith(color: darkGrayColor, fontWeight: FontWeight.w900)),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              bulletSymbols(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            Text(secureData(),
                style:
                    MyFonts.textStyle16.copyWith(fontWeight: FontWeight.w400))
          ],
        ),
        leading: LinearGradientWidget(
          iconData: checkIcon(),
          // iconData: Icons.sms_rounded,
        ),
      ),
    );
  }

  String secureData() {
    String userDataSecure = '';
    if (userData.contains('@')) {
      int start = userData.indexOf('@');
      userDataSecure = userData.substring(start);
    } else {
      int start = userData.length - 4;
      userDataSecure = userData.substring(start);
    }
    return userDataSecure;
  }

  String bulletSymbols() {
    if (userData.contains('@')) {
      return '••••  ';
    }
    return '••••  ••••  ';
  }

  IconData checkIcon() {
    if (userData.contains('@')) {
      return Icons.mail;
    }
    return Icons.sms;
  }
}
