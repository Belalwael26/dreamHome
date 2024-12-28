import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/constant/const_image_list.dart';
import 'package:dream_home/feature/worker_profile/presentation/widget/custom_our_works_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../customer_profile/presentation/widget/custom_add_profile_stack.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAddProfileStack(
              containerColor: AppColor.beanut,
              borderColor: AppColor.greyD,
              iconColor: AppColor.lightblack,
              iconBorderColor: AppColor.transparent,
            ),
            height(8),
            Text(
              "Kareem",
              style:
                  AppTextStyle.styleBold18.copyWith(color: AppColor.lightblack),
            ),
            height(8),
            Text(
              "Carpenter",
              style:
                  AppTextStyle.styleBold18.copyWith(color: AppColor.lightblack),
            ),
            height(24),
            Text(
              "Some Of Our Work ",
              style: AppTextStyle.style22.copyWith(color: AppColor.lightblack),
            ),
            SizedBox(
              width: widthSize(context),
              child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    autoPlay: true,
                    viewportFraction: 0.67,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeFactor: 0.45,
                  ),
                  items: images
                      .map((e) => CustomOurWorksContainer(images: e))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
