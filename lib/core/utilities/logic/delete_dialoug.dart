import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String image;
  final String description;
  final VoidCallback? onCancelPressed;
  final void Function() onConfirmPressed;

  const CustomDialog({
    Key? key,
    required this.image,
    required this.description,
    this.onCancelPressed,
    required this.onConfirmPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.only(top: ResponsiveCalc().heightRatio(33)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(image),
            const SizedBox(height: 16.0),
            Text(
              description,
              style: MyFonts.textStyle16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: MyFonts.textStyle16.copyWith(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirmPressed();
            Navigator.of(context).pop();
          },
          child: Text(
            'Confirm',
            style: MyFonts.textStyle16.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
