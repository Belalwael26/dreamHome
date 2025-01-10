import 'dart:developer';

import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/constant/constant.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/presentation/widgets/custom_customer_home_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/user_info_cache.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  UserModel? _user;
  Future<void> load() async {
    UserModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.name}");
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Scaffold(
        body: Column(
          children: [
            CustomCustomerHomeContainer(
              text: "Orders",
              name: _user?.name ?? "",
              image: image,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.lightblack),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColor.beanut,
                              backgroundImage: AssetImage(AppImages.vec1),
                            ),
                            width(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kareem",
                                  style: AppTextStyle.style16
                                      .copyWith(color: AppColor.lightblack),
                                ),
                                Text(
                                  "Naser City",
                                  style: AppTextStyle.style14
                                      .copyWith(color: AppColor.lightblack),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "010269984562",
                          style: AppTextStyle.style16
                              .copyWith(color: AppColor.lightblack),
                        ),
                      ],
                    ),
                  ),
                  itemCount: 5,
                  separatorBuilder: (context, index) => height(16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
