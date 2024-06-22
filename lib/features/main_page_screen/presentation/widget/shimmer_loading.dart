import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utilities/logic/responsive.dart';


Widget buildShimmerLoading() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    width: ResponsiveCalc().widthRatio(322),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 150,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: ResponsiveCalc().heightRatio(100),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}