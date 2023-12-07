import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utilits/my_cashe.dart';
import '../../../core/utilits/my_cashe_keys.dart';
import '../data/model/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context) =>
      BlocProvider.of<OnBoardingCubit>(context);
  PageController pageController = PageController();
  bool isLast = false;
  final List<OnBoardingModel> list = [
    OnBoardingModel(
        image: 'assets/firstOnBoarding.png', title: 'hi', body: 'hello'),
    OnBoardingModel(
        image: 'assets/secondOnBoarding.png', title: 'hi', body: 'hello'),
    OnBoardingModel(
        image: 'assets/thirdOnBoarding.png', title: 'hi', body: 'hello'),
  ];
  finishOnBoarding() {
    if (isLast == true) {
      MyCache.setBool(key: MyCacheKeys.onBoardingView, value: isLast);
    }
  }
}
