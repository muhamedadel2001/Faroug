import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import 'new_item.dart';

class LatestNewsScreen extends StatefulWidget {
  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  int? highlightedIndex;

  void _onItemTap(int index) {
    setState(() {
      highlightedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            children: [
              Text(
                'Latest News',
                style: MyFonts.textStyle20,
              ),
              Spacer(),
              Text(
                'See more',
                style: MyFonts.textStyleForm12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: ResponsiveCalc().heightRatio(15),
        ),
        NewsItem(
          index: 0,
          image: 'assets/images/Vector.png',
          title: 'Global News',
          subtitle: 'Why farmers are protesting in Europe?',
          highlighted: highlightedIndex == 0,
          onTap: _onItemTap,
        ),
        NewsItem(
          index: 1,
          image: 'assets/images/image 3.png',
          title: 'Scientific News',
          subtitle: 'Protecting poultry from bird flu',
          highlighted: highlightedIndex == 1,
          onTap: _onItemTap,
        ),
        NewsItem(
          index: 2,
          image: 'assets/images/image 4.png',
          title: 'Local News',
          subtitle: 'Major production boost for Egypt’s Delta Masr Group',
          highlighted: highlightedIndex == 2,
          onTap: _onItemTap,
        ),
      ],
    );
  }
}
