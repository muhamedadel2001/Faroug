import 'package:finalproject/features/profile/data/model/get_user_model.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/widgets/edit_profile_data.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_primary_button.dart';

class ListTileProfileInfo extends StatelessWidget {
  const ListTileProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ResponsiveCalc().heightRatio(35)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(1),
        trailing: SizedBox(
            width: ResponsiveCalc().widthRatio(83),
            height: ResponsiveCalc().heightRatio(30),
            child: PrimaryButton(
                text: 'Edit',
                pressAction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileData()));
                })),
        title: Text(
          '${ProfileCubit.get(context).getUserModel.user!.firstName!} ${ProfileCubit.get(context).getUserModel.user!.lastName}',
          style: MyFonts.textStyle16,
        ),
        subtitle: Text(
          ProfileCubit.get(context).getUserModel.user!.flockName!,
          style: MyFonts.textStyle14,
        ),
        leading: Container(
          width: ResponsiveCalc().widthRatio(55),
          height: ResponsiveCalc().heightRatio(55),
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2)),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profil_pic.png'),
          ),
        ),
      ),
    );
  }
}
