import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/widgets/profile_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProfileCubit(),
      child:  const Scaffold(
        backgroundColor: Colors.white,
        body: ProfileBodyScreen(),

      ),
    );
  }
}
