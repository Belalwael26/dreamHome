import 'package:dream_home/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

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
            Text(
              "Send us Your Complaint",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
            Spacer(),
            TextFormField(
              maxLines: 10,
              decoration: InputDecoration(hintText: "Your Complaint....."),
            ),
            Spacer(),
            CustomAppButton(
              text: "Send",
              containerColor: AppColor.beanut,
              textColor: AppColor.white,
            )
          ],
        ),
      ),
    );
  }
}
