import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomSearchTextFormFiled extends StatelessWidget {
  const CustomSearchTextFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: AppTextStyle.style16.copyWith(color: AppColor.beanut),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.redED),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.beanut),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.beanut),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.beanut),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.beanut),
        ),
      ),
    );
  }
}
