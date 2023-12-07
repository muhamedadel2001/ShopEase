part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}
class OnBoardingLastViewed extends OnBoardingState {}
class ChangingIndex extends OnBoardingState {}
class Test extends OnBoardingState {}
