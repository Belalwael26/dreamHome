import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';

class CustomAuthText extends StatelessWidget {
  final bool isLoadgin;
  const CustomAuthText({super.key, required this.isLoadgin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            isLoadgin
                ? "Don’t have an account? "
                : "Already have an account ? ",
            style: AppTextStyle.style14),
        Text(isLoadgin ? "Sign Up Here" : "Login Here",
            style: AppTextStyle.style16.copyWith(
              color: AppColor.white,
            )).onTap(() {
          isLoadgin
              ? context.push(Routes.register)
              : context.push(Routes.login);
        })
      ],
    );
  }
}
