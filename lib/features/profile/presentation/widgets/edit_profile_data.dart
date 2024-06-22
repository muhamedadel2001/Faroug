import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/widgets/edit_profile_data_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileData extends StatelessWidget {
  const EditProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: EditProfileDataBodyScreen(),

      ),
    );
  }
}
