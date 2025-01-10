import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              "Notifications",
              style: AppTextStyle.style24.copyWith(color: AppColor.lightblack),
            ),
          ],
        ),
      ),
    );
  }
}
