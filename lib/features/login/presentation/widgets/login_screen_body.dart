import 'package:finalproject/core/utilities/logic/email_validation.dart';
import 'package:finalproject/core/utilities/logic/password_validation.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/login/manager/cubit/cubit/login_cubit_cubit.dart';
import 'package:finalproject/features/login/presentation/widgets/signin_button_with_google.dart';
import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/core/utilities/screens.dart' as screens;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/hint_actio_widget.dart';
import 'divider_with_text.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
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
                  "Welcome Back",
                  style: MyFonts.textStyle20,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(30),
                ),
                CustomTextFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                  controller: cubit.emailController,
                  validate: EmailValidation().validation,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(15),
                ),
                CustomTextFormField(
                  hintText: "Password",
                  suffixIcon: Icons.visibility_off_outlined,
                  prefixIcon: Icons.lock_open_outlined,
                  controller: cubit.passwordController,
                  validate: PasswordValidation().validation,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(10),
                ),
                InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, screens.passMethodScreen),
                    child: const Text(
                      "Forgot your password?",
                      style: MyFonts.textStyleForm12,
                    )),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(10),
                ),
                SizedBox(
                    width: ResponsiveCalc().widthRatio(291),
                    height: ResponsiveCalc().heightRatio(279),
                    child: Image.asset("assets/images/Illustartion.png")),
                const SizedBox(height: 1),
                BlocConsumer<LoginCubit, LoginCubitState>(
                  listener: (context, state) {
                    if (state is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)));
                      cubit.loginText = 'Login';
                    } else if (state is LoginLoading) {
                      cubit.loginText = 'Loading..';
                    } else if (state is LoginSuccessed) {
                      state.saveToken();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) =>
                              BlocProvider(
                                create: (context) => NavBarCubit(),
                                child:  Home(),
                              )));
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      text: cubit.loginText,
                      pressAction: () {
                        if (formKey.currentState!.validate()) {
                          cubit.loginRequest();
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
                  height: ResponsiveCalc().heightRatio(20),
                ),
                HintActionLine(
                    hintText: "Don't have an account?",
                    buttonText: "Register Now",
                    lineAction: () =>
                        Navigator.of(context)
                            .pushReplacementNamed(screens.registerScreen)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
