import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/features/flock_details/concrets/concrete_income.dart';
import 'package:finalproject/features/flock_details/screens/main_screen.dart';
import 'package:flutter/material.dart';


class RecordsFlocks extends StatelessWidget {
  const RecordsFlocks({super.key});

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MainScreen(myItem: ConcreteIncome())));
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: blueLinear)),
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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: blueLinear)),
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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: blueLinear)),
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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: blueLinear)),
                  child: Image.asset('assets/images/menu (1) 16.png')),
              title: const Text(
                'Vaccination and Medicine',
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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerRight, colors: blueLinear)),
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
