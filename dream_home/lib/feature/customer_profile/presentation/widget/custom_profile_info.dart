import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_add_profile_stack.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                .onTap(context.pop),
            height(24),
            CustomAddProfileStack(
              containerColor: AppColor.beanut,
              borderColor: AppColor.greyD,
              iconColor: AppColor.lightblack,
              iconBorderColor: AppColor.transparent,
            ),
            height(50),
            CustomTextFormFiled(
                controller: TextEditingController(text: "Name")),
            height(16),
            CustomTextFormFiled(
                controller: TextEditingController(text: "Phone ")),
            height(16),
            CustomTextFormFiled(
                controller: TextEditingController(text: "Email")),
          ],
        ),
      ),
    );
  }
}
