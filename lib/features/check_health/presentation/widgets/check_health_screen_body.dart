import 'package:finalproject/core/utilities/screens.dart' as screens;
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/features/check_health/manager/vision_cubit.dart';
import 'package:finalproject/features/check_health/presentation/infected_salmo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../healthy_chicken_screen.dart';
import '../infected_chicken_screen.dart';
import 'image_picker_helper.dart';

class CheckHealthScreenBody extends StatefulWidget {
  const CheckHealthScreenBody({Key? key}) : super(key: key);

  @override
  State<CheckHealthScreenBody> createState() => _CheckHealthScreenBodyState();
}

class _CheckHealthScreenBodyState extends State<CheckHealthScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisionCubit, VisionState>(
      listener: (context, state) {
        if (state is Failed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15)),
              behavior: SnackBarBehavior.floating,
              content: const Text('Server Error Occured ! !')));
        }
        if (state is SelectAndUplaoded) {
          VisionCubit.get(context).imagesModel.type == 'Coccidiosis'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfectedChickenScreen(),
                  ))
              : VisionCubit.get(context).imagesModel.type == 'Salmonilla'
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfectedChickenSalmo(),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HealthyChickenScreen(),
                      ),
                    );
        }
      },
      builder: (context, state) {
        if (state is PathSaved) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Petbarn-visual-identity-by-Lan-unscreen 1.png',
                  width: ResponsiveCalc().widthRatio(98),
                  height: ResponsiveCalc().heightRatio(132),
                ),
                SizedBox(height: ResponsiveCalc().heightRatio(29)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                    color: brandPrimaryColor,
                  ),
                ),
                SizedBox(height: ResponsiveCalc().heightRatio(28)),
                const Text(
                  'Loading',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, left: 25, right: 25, bottom: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(25),
                    ),
                    const Text(
                      "Check Chicken Health",
                      style: MyFonts.textStyle24,
                    ),
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(6),
                    ),
                    const Text(
                      "Choose a way to upload an image",
                      style: MyFonts.textStyle14,
                    ),
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(11),
                    ),
                    Image.asset(
                      'assets/images/chicken.jpg',
                      width: ResponsiveCalc().widthRatio(196),
                      height: ResponsiveCalc().heightRatio(356),
                    ),
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(11),
                    ),
                    PrimaryButton(
                      text: 'Take a photo',
                      pressAction: () {
                        ImagePickerHelper.pickImage(ImageSource.camera);
                      },
                    ),
                    SizedBox(
                      height: ResponsiveCalc().heightRatio(25),
                    ),
                    PrimaryButton(
                      text: 'Choose from Gallery',
                      pressAction: () {
                        VisionCubit.get(context).selectAndUpload();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
