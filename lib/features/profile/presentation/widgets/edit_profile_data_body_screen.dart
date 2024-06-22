import 'package:finalproject/core/utilities/statics.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:finalproject/core/widgets/custom_text_field.dart';
import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import 'app_bar_section.dart';

class EditProfileDataBodyScreen extends StatefulWidget {
  const EditProfileDataBodyScreen({super.key});

  @override
  State<EditProfileDataBodyScreen> createState() =>
      _EditProfileDataBodyScreenState();
}

class _EditProfileDataBodyScreenState extends State<EditProfileDataBodyScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).getProfile();
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdatedSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => NavBarCubit(),
                        child: Home(
                          index: 4,
                        ),
                      )));
        }
        if (state is GetProfileSuccess) {
          editFirstName.text =
              ProfileCubit.get(context).getUserModel.user!.firstName!;
          editLastName.text =
              ProfileCubit.get(context).getUserModel.user!.lastName!;
          editEmail.text = ProfileCubit.get(context).getUserModel.user!.email!;
          editFarm.text =
              ProfileCubit.get(context).getUserModel.user!.flockName!;
        }
      },
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: brandPrimaryColor,
          ));
        } else {
          return SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveCalc().widthRatio(25),
                      vertical: ResponsiveCalc().heightRatio(30)),
                  child: SingleChildScrollView(
                      child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBARSectionProfile(title: 'Profile Data'),
                        SizedBox(
                          height: ResponsiveCalc().heightRatio(22),
                        ),
                        CustomTextFormField(
                            controller: editFirstName,
                            validate: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'this field should not be empty !';
                              }
                              return null;
                            },
                            prefixIcon: Icons.person),
                        SizedBox(
                          height: ResponsiveCalc().heightRatio(20),
                        ),
                        CustomTextFormField(
                          validate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'this field should not be empty !';
                            }
                            return null;
                          },
                          controller: editLastName,
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: ResponsiveCalc().heightRatio(20),
                        ),
                        CustomTextFormField(
                          validate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'this field should not be empty !';
                            }
                            return null;
                          },
                          controller: editEmail,
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: ResponsiveCalc().heightRatio(20),
                        ),
                        CustomTextFormField(
                          validate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'this field should not be empty !';
                            }
                            return null;
                          },
                          controller: editFarm,
                          prefixIcon: Icons.home,
                        ),
                        SizedBox(
                          height: ResponsiveCalc().heightRatio(50),
                        ),
                        PrimaryButton(
                            text: 'Save',
                            pressAction: () {
                              if (formKey.currentState!.validate()) {
                                ProfileCubit.get(context).updateProfile();
                              }
                            })
                      ],
                    ),
                  ))));
        }
      },
    );
  }
}
