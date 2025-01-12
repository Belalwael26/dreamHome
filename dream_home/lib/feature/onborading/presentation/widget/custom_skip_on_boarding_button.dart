import 'dart:developer';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';
import '../../../../core/service/on_boarding_service.dart';

class CustomVisibleSkipButton extends StatelessWidget {
  const CustomVisibleSkipButton({
    super.key,
    required this.pageController,
    this.onTap,
  });

  final PageController pageController;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: pageController.hasClients
          ? (pageController.page == 3 ? false : true)
          : true,
      child: TextButton(
        onPressed: () async {
          await OnboardingService().markOnboardingAsShown();
          log("OnBording Status Save");
          context.pushReplacement(Routes.login);
        },
        child: Text(
          "Skip",
          style: AppTextStyle.style16,
        ),
      ),
    );
  }
}
