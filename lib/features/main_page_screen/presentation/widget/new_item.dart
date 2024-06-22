import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';

class NewsItem extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String subtitle;
  final bool highlighted;
  final ValueChanged<int> onTap;

  const NewsItem({
    required this.index,
    required this.image,
    required this.title,
    required this.subtitle,
    this.highlighted = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Card(
        color: highlighted ? const Color(0xFFF5F5F5) : Colors.white,
        elevation: highlighted ? 5 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(
                width: ResponsiveCalc().widthRatio(10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: MyFonts.textStyle12
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: ResponsiveCalc().heightRatio(5)),
                    Text(
                      subtitle,
                      style: MyFonts.textStyle10,
                    ),
                  ],
                ),
              ),
              Container(
                width: ResponsiveCalc().heightRatio(30),
                height: ResponsiveCalc().heightRatio(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryPurple, width: 2),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: primaryPurple,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}