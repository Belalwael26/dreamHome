import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/Core/utils/app_images.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WhoAreYouScreen extends StatelessWidget {
  const WhoAreYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Who Are You ?!",
              style: AppTextStyle.style25,
            ),
            height(42),
            Image.asset(AppImages.vec10),
            height(42),
            CustomAppButton(
              text: "Worker ",
              containerColor: AppColor.beanut,
              textColor: AppColor.white,
              onPressed: () {
                context.pushReplacement(Routes.workernavbar);
              },
            ),
            height(24),
            CustomAppButton(
              text: "Customer ",
              containerColor: AppColor.lightblack,
              textColor: AppColor.white,
              onPressed: () {
                context.pushReplacement(Routes.customernavbar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
