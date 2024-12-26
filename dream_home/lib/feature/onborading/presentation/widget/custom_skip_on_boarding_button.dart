import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';

class CustomVisibleSkipButton extends StatelessWidget {
  const CustomVisibleSkipButton({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: pageController.hasClients
          ? (pageController.page == 3 ? false : true)
          : true,
      child: TextButton(
        onPressed: () {
          context.pushReplacement(Routes.login);
        },
        child: Text(
          "Skip",
          style: AppTextStyle.style16,
        ),
      ),
      //  CustomSkipButton(
      //   text: 'Skip',
      //   onPressed: () {
      //     context.pushReplacement(Routes.login);
      //   },
      // ),
    );
  }
}
