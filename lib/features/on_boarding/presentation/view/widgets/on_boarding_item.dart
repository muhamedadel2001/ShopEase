import 'package:flutter/material.dart';

import '../../../data/model/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
              child: Image.asset(
            model.image,
          )),
        ))),
        Text(model.title),
        const SizedBox(
          height: 10,
        ),
        Text(model.body),
      ],
    );
  }
}
