import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:finalproject/core/widgets/linear_gradient_widget.dart';
import 'package:finalproject/features/profile/data/profile_api.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/widgets/account_card_profile_section.dart';
import 'package:finalproject/features/profile/presentation/widgets/app_bar_section.dart';
import 'package:finalproject/features/profile/presentation/widgets/cards_info_profile_section.dart';
import 'package:finalproject/features/profile/presentation/widgets/list_tile_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProfileBodyScreen extends StatefulWidget {
  const ProfileBodyScreen({super.key});

  @override
  State<ProfileBodyScreen> createState() => _ProfileBodyScreenState();
}

class _ProfileBodyScreenState extends State<ProfileBodyScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).getProfile();
    super.initState();
  }

  bool change = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15)),
              behavior: SnackBarBehavior.floating,
              content: const Text('Server Error Occured ! !')));
        }
      },
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: brandPrimaryColor,
          ));
        } else {
          if (state is GetProfileFailed) {
            return  Center(
              child: InkWell(
                onTap: (){
                  ProfileCubit.get(context).getProfile();
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color:brandPrimaryColor,
                      size: 50,
                    ),
                    Text(
                      'Click to Reload',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ],
                ),
              ),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveCalc().widthRatio(25),
                    vertical: ResponsiveCalc().heightRatio(30)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBARSectionProfile(title: 'Profile'),
                      const ListTileProfileInfo(),
                      SizedBox(
                        height: ResponsiveCalc().heightRatio(10),
                      ),
                      const CardsInfoProfileSection(),
                      SizedBox(
                        height: ResponsiveCalc().heightRatio(25),
                      ),
                      const AccountCardProfileSection(),
                      SizedBox(
                        height: ResponsiveCalc().heightRatio(25),
                      ),
                      Material(
                        elevation: 2,
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: ResponsiveCalc().widthRatio(315),
                          height: ResponsiveCalc().heightRatio(99),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveCalc().widthRatio(20),
                                vertical: ResponsiveCalc().heightRatio(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Notification',
                                  style: MyFonts.textStyle16,
                                ),
                                Expanded(
                                  child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: const LinearGradientWidget(
                                          iconData: Icons.mail_outline_rounded),
                                      title: const Text(
                                        'Pop-Up Notification',
                                        style: MyFonts.textStyle14,
                                      ),
                                      trailing: Switch(
                                          activeColor: primaryPurple,
                                          thumbColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.white),
                                          inactiveThumbColor: Colors.white,
                                          value: change,
                                          onChanged: (val) {
                                            setState(() {
                                              change = val;
                                            });
                                          })),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
