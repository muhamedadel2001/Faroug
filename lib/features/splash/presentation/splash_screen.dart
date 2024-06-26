import 'dart:async';

import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/login/data/login_api.dart';
import 'package:finalproject/features/login/manager/cubit/cubit/login_cubit_cubit.dart';
import 'package:finalproject/features/login/presentation/login_screen.dart';
import 'package:finalproject/features/on_boarding/presentation/main_on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () {
      if (SharedPrefUtil().getToken() != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => NavBarCubit(),
                    child: Home(),
                  )),
          (route) => false,
        );
      } else {
        if (SharedPrefUtil().getLastOnBoarding() != true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => NavBarCubit(),
                      child: const MainOnBoardingScreen(),
                    )),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => LoginCubit(LoginApi()),
                      child: const LoginScreen(),
                    )),
            (route) => false,
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset('assets/images/logo (1).svg')),
                const Text(
                  'Faroug',
                  style: MyFonts.textStyle40,
                ),
                const Text(
                  'Track your farm',
                  style: MyFonts.textStyle14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
