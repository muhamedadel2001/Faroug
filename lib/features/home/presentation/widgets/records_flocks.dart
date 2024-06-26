import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';

class RecordsFlocks extends StatelessWidget {
  const RecordsFlocks({super.key, required this.flockModel});
  final FlockModel flockModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: ResponsiveCalc().heightRatio(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(incomeCatrgory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/menu (1) 45.png')),
              title: const Text(
                'Income',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(expensesCategory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/menu (1) 22.png')),
              title: const Text(
                'Expenses',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(feedServedCategory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/menu (1) 25.png')),
              title: const Text(
                'Feed Served',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(vaccinationCategory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/menu (1) 16.png')),
              title: const Text(
                'Vaccination',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(medicineCategory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/menu (1) 16.png')),
              title: const Text(
                'Medicine',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(mortalityCategory, arguments: {
                  'flock_model': flockModel,
                });
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: opacityLinear)),
                  child: Image.asset('assets/images/heart-rate 1.png')),
              title: const Text(
                'Mortality',
                style: MyFonts.textStyle16,
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.navigate_next,
                  color: primaryPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
