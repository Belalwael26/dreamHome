import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/custom_profile_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/app_text_style.dart';

class CustomerProfilScreen extends StatelessWidget {
  const CustomerProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            height(24),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.profile,
              text: "Profile",
            ),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.lock,
              text: "Change Password",
            ),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.number,
              text: "Change Number ",
            ),
            CustomProfileItem(
              textColor: AppColor.redED,
              onTap: () {},
              vectorColor: AppColor.redED,
              svgIconPath: AppImages.deleteacc,
              text: "Delete Account",
              iconColor: AppColor.redED,
            ),
            CustomProfileItem(
              textColor: AppColor.redED,
              onTap: () {},
              vectorColor: AppColor.redED,
              svgIconPath: AppImages.logout,
              text: "Logout",
              iconColor: AppColor.redED,
            ),
            height(24),
            Text(
              "Help",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.aboutus,
              text: "About us",
            ),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.contactus,
              text: "Contact us",
            ),
            CustomProfileItem(
              textColor: AppColor.white,
              onTap: () {},
              vectorColor: AppColor.lightblack,
              svgIconPath: AppImages.comlaint,
              text: "Complaint",
            ),
          ],
        ),
      ),
    );
  }
}
