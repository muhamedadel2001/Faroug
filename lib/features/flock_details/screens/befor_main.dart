import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';

import '../concrets/concrete_expense.dart';
import '../concrets/concrete_feed_serve.dart';
import '../concrets/concrete_income.dart';
import '../concrets/concrete_medicine.dart';
import '../concrets/concrete_mortality.dart';
import '../concrets/concrete_vaccination.dart';

class BeforeMain extends StatelessWidget {
  const BeforeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteIncome()});
              },
              child: const Center(
                  child: Text(
                'Go to income',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteExpense()});
              },
              child: const Center(
                  child: Text(
                'Go to expenses',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteFeedServed()});
              },
              child: const Center(
                  child: Text(
                'Go to Feed Served',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteMortality()});
              },
              child: const Center(
                  child: Text(
                'Go to Mortality',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteVaccination()});
              },
              child: const Center(
                  child: Text(
                'Go to Vaccnation',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal.withOpacity(.5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/main_screen',
                    arguments: {'myItem': ConcreteMedicine()});
              },
              child: const Center(
                  child: Text(
                'Go to Medicine',
                style: MyFonts.textStyle32,
              )),
            ),
          ),
        ],
      )),
    );
  }
}
