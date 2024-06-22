import 'package:finalproject/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:finalproject/features/on_boarding/presentation/widgets/on_boarding_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainOnBoardingScreen extends StatelessWidget {
  const MainOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const OnBoardingBodyScreen(),
      ),
    );
  }
}
