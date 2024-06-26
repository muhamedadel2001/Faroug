import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/features/login/data/login_api.dart';
import 'package:finalproject/features/login/manager/cubit/cubit/login_cubit_cubit.dart';
import 'package:finalproject/features/login/presentation/login_screen.dart';
import 'package:finalproject/features/on_boarding/data/on_boarding_model.dart';
import 'package:finalproject/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/paint.dart';
import '../../../../core/utilities/logic/responsive.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            model.image,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
        SizedBox(
          height: ResponsiveCalc().heightRatio(30),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 5),
          child: Text(
            model.title,
            style: MyFonts.textStyle24,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.009,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 5),
          child: Text(
            model.description,
            style: MyFonts.textStyle14,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ResponsiveCalc().heightRatio(125),
              left: ResponsiveCalc().widthRatio(280)),
          child: ProgressButton(
              onNext: () {
                if (model.size == 100) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => LoginCubit(LoginApi()),
                              child: const LoginScreen(),
                            )),
                    (route) => false,
                  );
                } else {
                  OnBoardingCubit.get(context).nextPage();
                }
              },
              num4: model.size),
        )
      ],
    ));
  }
}
