import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/on_boarding_model.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context) =>
      BlocProvider.of<OnBoardingCubit>(context);
  PageController pageController = PageController();
  bool isLast = false;
  List<OnBoardingModel> list = [
    OnBoardingModel(
        image: 'assets/images/Frame.png',
        title: 'Track Your Farm',
        description:
            'Dont worry if you have trouble determining your goals, We can help you determine your goals.',
        size: 25),
    OnBoardingModel(
        image: 'assets/images/Framee.png',
        title: 'Easily Organized',
        description:
            'Let’s organize your needs to achieve your goals, smooth data means fast success.',
        size: 50),
    OnBoardingModel(
        image: 'assets/images/Frame (2).png',
        title: 'Quality Production',
        description:
            'Improve the quality of your farm with us, good quality production can bring best result.',
        size: 75),
    OnBoardingModel(
        image: 'assets/images/Frame (3).png',
        title: 'Compare Results',
        description:
            'Track your progress to see how well you are doing and update your goals.',
        size: 100),
  ];
  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
  checkLast(int index,) {
    if (index == list.length - 2) {
      isLast = true;
      emit(OnBoardingLastPage());

    } else {
      isLast = false;
    }
  }
}
