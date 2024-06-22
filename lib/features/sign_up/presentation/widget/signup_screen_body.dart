import 'package:finalproject/core/utilities/logic/email_validation.dart';
import 'package:finalproject/core/utilities/logic/password_confirmation_validation.dart';
import 'package:finalproject/core/utilities/logic/password_validation.dart';
import 'package:finalproject/core/utilities/statics.dart';
import 'package:finalproject/core/widgets/custom_dropdownfield.dart';
import 'package:finalproject/features/sign_up/manager/registration_cubit/registration_cubit.dart';
import 'package:finalproject/features/sign_up/presentation/widget/privacy_policy_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/hint_actio_widget.dart';
import '../../../login/presentation/widgets/divider_with_text.dart';
import '../../../login/presentation/widgets/signin_button_with_google.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({Key? key}) : super(key: key);

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegistrationCubit>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Hey there,",
                  style: MyFonts.textStyle16,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Text(
                  "Create an Account",
                  style: MyFonts.textStyle20,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(30),
                ),
                CustomTextFormField(
                  hintText: "First Name",
                  prefixIcon: Icons.person_3_outlined,
                  controller: cubit.firstNameController,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(14),
                ),
                CustomTextFormField(
                  hintText: "Last Name",
                  prefixIcon: Icons.person_3_outlined,
                  controller: cubit.lastNameController,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(14),
                ),
                CustomTextFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                  controller: cubit.emailController,
                  validate: EmailValidation().validation,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(14),
                ),
                CustomTextFormField(
                  hintText: "Farm Name",
                  prefixIcon: Icons.home,
                  controller: cubit.farmNameController,
                  validate: (val) {
                    if (val!.isEmpty || val == null) {
                      return 'this field is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(14),
                ),
                CustomDropDownField(
                    validate: (val) {
                      if (val!.isEmpty || val == null) {
                        return 'this field is required';
                      }
                      return null;
                    },
                    text: 'City',
                    list: listCity,
                    textEditingController: cubit.cityController),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(14),
                ),
                CustomTextFormField(
                  hintText: "Password",
                  suffixIcon: Icons.visibility_off_outlined,
                  prefixIcon: Icons.lock_open_outlined,
                  controller: cubit.passwordController,
                  validate: PasswordValidation().validation,
                ),
                SizedBox(height: ResponsiveCalc().heightRatio(14)),
                CustomTextFormField(
                  hintText: "Confirm Password",
                  suffixIcon: Icons.visibility_off_outlined,
                  prefixIcon: Icons.lock_open_outlined,
                  controller: cubit.confirmPasswordController,
                  validate: ConfirmPasswordValidation(context).validation,
                ),
                SizedBox(height: ResponsiveCalc().heightRatio(29)),
                const Center(child: PrivacyPolicyCheckbox()),
                SizedBox(height: ResponsiveCalc().heightRatio(14)),
                BlocConsumer<RegistrationCubit, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)));
                      cubit.regText = 'Register';
                    } else if (state is RegistrationLoading) {
                      cubit.regText = 'Loading..';
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(screens.congratsScreen);
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      text: cubit.regText,
                      pressAction: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegistrationCubit>(context)
                              .registrationRequest();
                        }
                      },
                    );
                  },
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(10),
                ),
                const DividerWithText(text: "Or"),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(10),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SignInButton(
                      imagePath:
                          "assets/images/google-logo-png-suite-everything-you-need-know-about-google-newest-0 2.png"),
                  SizedBox(
                    width: ResponsiveCalc().widthRatio(30),
                  ),
                  const SignInButton(imagePath: "assets/images/facebook 1.png"),
                ]),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(30),
                ),
                HintActionLine(
                  hintText: "Already have an account?",
                  buttonText: "Login",
                  lineAction: () => Navigator.of(context)
                      .pushReplacementNamed(screens.loginScreen),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
