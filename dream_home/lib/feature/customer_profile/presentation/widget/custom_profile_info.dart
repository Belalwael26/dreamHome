import 'dart:developer';

import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';
import 'custom_add_profile_stack.dart';

class CustomProfileInfo extends StatefulWidget {
  const CustomProfileInfo({super.key});

  @override
  State<CustomProfileInfo> createState() => _CustomProfileInfoState();
}

class _CustomProfileInfoState extends State<CustomProfileInfo> {
  UserModel? _user;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    UserModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.name}");
  }

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
            CustomAddProfileStack(
              containerColor: AppColor.beanut,
              borderColor: AppColor.greyD,
              iconColor: AppColor.lightblack,
              iconBorderColor: AppColor.transparent,
            ),
            height(50),
            CustomTextFormFiled(
                controller: TextEditingController(text: _user?.name)),
            height(16),
            CustomTextFormFiled(
                controller: TextEditingController(text: _user?.phone)),
            height(16),
            CustomTextFormFiled(
                controller: TextEditingController(text: _user?.email)),
          ],
        ),
      ),
    );
  }
}
