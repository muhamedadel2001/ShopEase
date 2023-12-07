import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:shop_aoo/features/on_boarding/presentation/view/widgets/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  @override
  late OnBoardingCubit cubit;

  @override
  void initState() {
    cubit = OnBoardingCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {

                  return OnBoardingItem(model: cubit.list[index]);
                },
                controller: cubit.pageController,
                itemCount: cubit.list.length,
                onPageChanged: (index) {
                  if (index == cubit.list.length - 1) {
                    setState(() {
                      cubit.isLast = true;
                    });
                  } else {
                    setState(() {
                      cubit.isLast = false;
                    });
                  }
                }),
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: cubit.isLast,
            replacement: Center(
              child: SmoothPageIndicator(
                controller: cubit.pageController,
                count: cubit.list.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: cubit.pageController,
                  count: cubit.list.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () async {
                    await cubit.finishOnBoarding();
                    Navigator.pushNamedAndRemoveUntil(
                        context, screens.loginScreen, (route) => false);
                  },
                  child: const Text(
                    'Get Start',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
