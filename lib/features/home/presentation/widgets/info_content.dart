import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  const InfoContent(
      {super.key,
      required this.flockNom,
      required this.dateTime,
      required this.dead});
  final int flockNom;
  final DateTime dateTime;
  final int dead;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTime.now().difference(dateTime).inDays != 0
                ? '${DateTime.now().difference(dateTime).inDays} day ago'
                : 'Today',
            style: MyFonts.textStyle10,
          ),
          Text(
            'Number of Birds: $flockNom',
            style: MyFonts.textStyle10,
          ),
          Text(
            'Alive : ${flockNom - dead}',
            style: MyFonts.textStyle10,
          ),
          Text(
            'Dead : $dead',
            style: MyFonts.textStyle10,
          ),
        ],
      ),
    );
  }
}
