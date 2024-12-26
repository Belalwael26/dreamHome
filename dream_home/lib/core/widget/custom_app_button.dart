import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? containerColor;
  final String text;
  final Color? textColor;
  final double? width;
  final double? radius;
  final double? height;
  const CustomAppButton(
      {super.key,
      this.onPressed,
      this.containerColor,
      required this.text,
      this.textColor,
      this.width,
      this.radius,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 57,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
          color: containerColor ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 12)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.style20.copyWith(
            color: textColor ?? AppColor.black,
          ),
        ),
      ),
    );
  }
}
