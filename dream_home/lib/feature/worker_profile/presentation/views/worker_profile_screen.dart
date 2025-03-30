import 'dart:developer';

import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/worker_profile/presentation/cubit/worker_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/routes.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widget/dialogs/logout_dialog.dart';
import '../../../customer_profile/presentation/widget/custom_logout_dialog.dart';
import '../../../customer_profile/presentation/widget/custom_profile_item.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerProfileCubit(getIt()),
      child: BlocConsumer<WorkerProfileCubit, WorkerProfileState>(
        listener: (context, state) {
          if (state is LogoutFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          } else if (state is LogoutSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
            context.pushReplacement(Routes.login);
          } else if (state is DeleteAccountFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          } else if (state is DeleteAccountSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
            context.pushReplacement(Routes.login);
          }
        },
        builder: (context, state) {
          final cubit = context.read<WorkerProfileCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: AppTextStyle.style24
                        .copyWith(color: AppColor.lightblack),
                  ),
                  height(24),
                  CustomProfileItem(
                    textColor: AppColor.white,
                    onTap: () {
                      context.push(Routes.profileinfo);
                    },
                    vectorColor: AppColor.lightblack,
                    svgIconPath: AppImages.profile,
                    text: "Profile",
                  ),
                  CustomProfileItem(
                    textColor: AppColor.white,
                    onTap: () {
                      context.push(Routes.changenumber);
                    },
                    vectorColor: AppColor.lightblack,
                    svgIconPath: AppImages.number,
                    text: "Change Number ",
                  ),
                  CustomProfileItem(
                    textColor: AppColor.redED,
                    onTap: () {
                      logoutDialog(
                          textButton: "Delete Account",
                          textTitle: "Are you sure you want to delete account?",
                          context, onPressed: () {
                        cubit.deleteAccount();
                      });
                    },
                    vectorColor: AppColor.redED,
                    svgIconPath: AppImages.deleteacc,
                    text: "Delete Account",
                    iconColor: AppColor.redED,
                  ),
                  CustomProfileItem(
                    textColor: AppColor.redED,
                    onTap: () {
                      logoutDialog(
                          widget: CustomLogoutDialog(
                            onPressed: () async {
                              await clearUserData();
                              context.pushReplacement(Routes.login);
                              log("Logout and Clear User Data");
                            },
                          ),
                          context,
                          onPressed: () {
                            cubit.logout();
                          });
                    },
                    vectorColor: AppColor.redED,
                    svgIconPath: AppImages.logout,
                    text: "Logout",
                    iconColor: AppColor.redED,
                  ),
                  height(24),
                  Text(
                    "Help",
                    style: AppTextStyle.style24
                        .copyWith(color: AppColor.lightblack),
                  ),
                  height(24),
                  CustomProfileItem(
                    textColor: AppColor.white,
                    onTap: () {
                      context.push(Routes.aboutus);
                    },
                    vectorColor: AppColor.lightblack,
                    svgIconPath: AppImages.aboutus,
                    text: "About us",
                  ),
                  CustomProfileItem(
                    textColor: AppColor.white,
                    onTap: () {
                      context.push(Routes.contactus);
                    },
                    vectorColor: AppColor.lightblack,
                    svgIconPath: AppImages.contactus,
                    text: "Contact us",
                  ),
                  CustomProfileItem(
                    textColor: AppColor.white,
                    onTap: () {
                      context.push(Routes.complaintscreen);
                    },
                    vectorColor: AppColor.lightblack,
                    svgIconPath: AppImages.comlaint,
                    text: "Complaint",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
