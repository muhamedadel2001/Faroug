import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/poultry_exchange.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/waterintake_wind.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/weather_screen.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/widgets/custom_tab_bar_button.dart';
import 'farm_revenue_sources.dart';
import 'latest_news_screen.dart';

class HomePageScreenBody extends StatelessWidget {
  const HomePageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "welcome back",
                style: MyFonts.textStyle12,
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(5.0),
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is GetProfileSuccess) {
                    return Text(
                      ' ${ProfileCubit.get(context).getUserModel.user!.firstName!} ${ProfileCubit.get(context).getUserModel.user!.lastName!}',
                      style: MyFonts.textStyle30,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ]),
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                ProfileCubit.get(context).signOut(context);
                // Action to perform when the notification button is pressed
              },
            ),
          ],
        ),
        SizedBox(
          height: ResponsiveCalc().heightRatio(30.0),
        ),
        BlocBuilder<InventoryProdCubit, InventoryProdState>(
          builder: (context, state) {
            if (state is GetPercentageSuccess) {
              return FarmRevenueCard(
                percentage: InventoryProdCubit.get(context).sumForEggs /
                    InventoryProdCubit.get(context).sumForAll *
                    100,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        // Slider(value: value, onChanged: onChanged)
        SizedBox(
          height: ResponsiveCalc().heightRatio(30.0),
        ),

        SizedBox(
          height: ResponsiveCalc().heightRatio(10.0),
        ),

        const Text(
          "Weather Status",
          style: MyFonts.textStyle20,
        ),
        SizedBox(
          height: ResponsiveCalc().heightRatio(19.0),
        ),
        SizedBox(width: double.infinity, child: WeatherScreen()),
        SizedBox(
          height: ResponsiveCalc().heightRatio(27.0),
        ),
        const HomeScreenCards(),
        SizedBox(
          height: ResponsiveCalc().heightRatio(30.0),
        ),
        const PoultryExchangeScreen(),
        SizedBox(
          height: ResponsiveCalc().heightRatio(16.0),
        ),
        /*  LatestNewsScreen(),*/
        SizedBox(
          height: ResponsiveCalc().heightRatio(20.0),
        ),
        // const HomePageScreenBodyCard(),
        LatestNewsScreen(),
      ],

    )


    );
  }
}
