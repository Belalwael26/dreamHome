import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/custom_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/widget/dialogs/logout_dialog.dart';

class CustomerProfilScreen extends StatelessWidget {
  const CustomerProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerProfileCubit(logoutRepo: getIt()),
      child: BlocConsumer<CustomerProfileCubit, CustomerProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            showToast(
                message: "Logout Success", backgroundColor: AppColor.beanut);
            context.pushReplacement(Routes.login);
          } else if (state is LogoutFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          } else if (state is DeleteAccountSuccessState) {
            showToast(
                message: "Account Deleted", backgroundColor: AppColor.beanut);
            context.pushReplacement(Routes.login);
          } else if (state is DeleteAccountFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = CustomerProfileCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: FadeAnimationCustom(
                delay: 1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style:
                          AppTextStyle.style24.copyWith(color: AppColor.black),
                    ),
                    height(24),
                    CustomProfileItem(
                      textColor: AppColor.white,
                      onTap: () {
                        context.push(Routes.profileinfo);
                      },
                      vectorColor: AppColor.black,
                      svgIconPath: AppImages.profile,
                      text: "Profile",
                    ),
                    CustomProfileItem(
                      textColor: AppColor.white,
                      onTap: () {
                        context.push(Routes.changenumber);
                      },
                      vectorColor: AppColor.black,
                      svgIconPath: AppImages.number,
                      text: "Change Number ",
                    ),
                    CustomProfileItem(
                      textColor: AppColor.redED,
                      onTap: () {
                        logoutDialog(
                            textButton: "Delete Account",
                            textTitle:
                                "Are you sure you want to delete account?",
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
                        logoutDialog(context, onPressed: () {
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
                      style:
                          AppTextStyle.style24.copyWith(color: AppColor.black),
                    ),
                    height(24),
                    CustomProfileItem(
                      textColor: AppColor.white,
                      onTap: () {
                        context.push(Routes.aboutus);
                      },
                      vectorColor: AppColor.black,
                      svgIconPath: AppImages.aboutus,
                      text: "About us",
                    ),
                    CustomProfileItem(
                      textColor: AppColor.white,
                      onTap: () {
                        context.push(Routes.contactus);
                      },
                      vectorColor: AppColor.black,
                      svgIconPath: AppImages.contactus,
                      text: "Contact us",
                    ),
                    CustomProfileItem(
                      textColor: AppColor.white,
                      onTap: () {
                        context.push(Routes.complaintscreen);
                      },
                      vectorColor: AppColor.black,
                      svgIconPath: AppImages.comlaint,
                      text: "Complaint",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
