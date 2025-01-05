import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';

class CustomWorkerInfoContainer extends StatelessWidget {
  final String name;
  final String phone;
  final String image;
  const CustomWorkerInfoContainer(
      {super.key,
      required this.name,
      required this.phone,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.beanut),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.beanut,
            backgroundImage: NetworkImage(image),
          ),
          width(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toBeginningOfSentenceCase(name),
                style: AppTextStyle.style18.copyWith(
                  color: AppColor.lightblack,
                ),
              ),
              Text(phone,
                  style: AppTextStyle.style18.copyWith(
                    color: AppColor.lightblack,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
