import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widget/custom_app_button.dart';

class CustomLogoutDialog extends StatelessWidget {
  final void Function()? onPressed;
  const CustomLogoutDialog({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.yellowColor,
        ),
        height: heightSize(context) * .46,
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Image.asset(AppImages.logoutLogo),
            Text(
              "اوه لا ,انت تغادر",
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "هل انت متاكد من تسجيل الخروج ؟",
              style: AppTextStyle.style14.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.redED,
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: CustomAppButton(
                    height: 48,
                    text: "لا",
                    containerColor: AppColor.black,
                    textColor: AppColor.white,
                    onPressed: () => context.pop(),
                  ),
                ),
                Flexible(
                    child: CustomAppButton(
                  text: "نعم",
                  onPressed: onPressed,
                  containerColor: AppColor.redED,
                  height: 48,
                  textColor: AppColor.white,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
