import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String body;
  const NotificationItem({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.maxFinite,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.beanut)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.style20.copyWith(color: AppColor.lightblack),
          ),
          height(4),
          Text(
            body,
            style: AppTextStyle.style16.copyWith(color: AppColor.lightblack),
          ),
        ],
      ),
    );
  }
}
