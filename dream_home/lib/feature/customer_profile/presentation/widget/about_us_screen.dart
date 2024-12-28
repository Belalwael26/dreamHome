import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                .onTap(context.pop),
            height(24),
            Text(
              "About Dream Home ",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            height(8),
            Text(
              "Our platform connects skilled craft workers with clients who need their services. We bridge the gap by providing an easy-to-use application where users can find reliable professionals for any task, big or small. Whether you need repairs, custom projects, or maintenance, we’ve got the right expert for the job.",
              style: AppTextStyle.style16.copyWith(color: AppColor.lightblack),
            ),
            height(24),
            Text(
              "Our Vision",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            height(8),
            Text(
              "To become the go-to platform for clients and craft workers alike, fostering trust, reliability, and convenience. We aim to create an ecosystem where craftsmanship meets demand seamlessly, empowering professionals while ensuring top-quality services for users.",
              style: AppTextStyle.style16.copyWith(color: AppColor.lightblack),
            ),
            height(24),
            Text(
              "Our Mission",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            height(8),
            Text(
              "To simplify the process of finding skilled craft workers while providing professionals with opportunities to grow their businesses. We are committed to enhancing access, ensuring quality, and building a community based on transparency and mutual respect.",
              style: AppTextStyle.style16.copyWith(color: AppColor.lightblack),
            )
          ],
        ),
      ),
    );
  }
}
