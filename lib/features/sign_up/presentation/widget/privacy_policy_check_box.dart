import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/fonts.dart';

class PrivacyPolicyCheckbox extends StatefulWidget {
  const PrivacyPolicyCheckbox({super.key});

  @override
  PrivacyPolicyCheckboxState createState() => PrivacyPolicyCheckboxState();
}

class PrivacyPolicyCheckboxState extends State<PrivacyPolicyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        const Text(
          'By continuing you accept our Privacy Policy and\n Term of Use',
          style: MyFonts.textStyle10,
        ),
      ],
    );
  }
}
