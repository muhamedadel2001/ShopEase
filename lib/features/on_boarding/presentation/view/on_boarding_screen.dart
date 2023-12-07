import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/widgets/defaultTextButton.dart';
import 'package:shop_aoo/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:shop_aoo/features/on_boarding/presentation/view/widgets/on_boarding_body_screen.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DefaultTextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, screens.loginScreen, (route) => false);
            },
            text: 'Skip',
          )
        ],
      ),
      body: const OnBoardingScreenBody(),
    );
  }
}
