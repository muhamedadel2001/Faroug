import 'package:finalproject/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'on_boarding_item.dart';

class OnBoardingBodyScreen extends StatefulWidget {
  const OnBoardingBodyScreen({super.key});
  @override
  State<OnBoardingBodyScreen> createState() => _OnBoardingBodyScreenState();
}
class _OnBoardingBodyScreenState extends State<OnBoardingBodyScreen> {
  late OnBoardingCubit cubit;
  @override
  void initState() {
    cubit = OnBoardingCubit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OnBoardingItem(model: cubit.list[index]);
              },
              controller: OnBoardingCubit.get(context).pageController,
              itemCount: cubit.list.length,
              onPageChanged: (index) {
                cubit.checkLast(index,);
              }),
        ),
      ]),
    );
  }
}
