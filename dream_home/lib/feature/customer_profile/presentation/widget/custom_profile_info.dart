import 'dart:developer';

import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/widget/custom_drop_down_container.dart';
import 'custom_add_profile_stack.dart';

class CustomProfileInfo extends StatefulWidget {
  const CustomProfileInfo({super.key});

  @override
  State<CustomProfileInfo> createState() => _CustomProfileInfoState();
}

class _CustomProfileInfoState extends State<CustomProfileInfo> {
  LoginModel? _user;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    // log("${user!.name}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerProfileCubit(logoutRepo: getIt()),
      child: BlocConsumer<CustomerProfileCubit, CustomerProfileState>(
        listener: (context, state) {
          if (state is AddJobSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
          } else if (state is AddJobFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CustomerProfileCubit>();
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
                      controller:
                          TextEditingController(text: _user?.user?.firstName)),
                  height(16),
                  CustomTextFormFiled(
                      controller: TextEditingController(
                          text: _user?.user?.contactNumber)),
                  height(16),
                  CustomTextFormFiled(
                      controller:
                          TextEditingController(text: _user?.user?.email)),
                  height(16),
                  // CustomTextFormFiled(
                  //     controller: TextEditingController(text: _user?.user?.firstName)),
                  // height(16),
                  // CustomTextFormFiled(
                  //     controller: TextEditingController(text: _user?.location)),
                  //  height(16),
                  // Visibility(
                  //   visible: _user?.isWorker ?? true,
                  //   child: CustomDropDownContainer(
                  //     onChanged: (val) {
                  //       setState(() {
                  //         cubit.selectedItem = val;
                  //       });
                  //     },
                  //     hint: cubit.selectedItem.isNotEmpty
                  //         ? cubit.selectedItem
                  //         : (_user?.job?.isNotEmpty == true
                  //             ? _user!.job!
                  //             : "Select Your Job"),
                  //     items: cubit.jobs
                  //         .map((e) => DropdownMenuItem(
                  //               value: e,
                  //               child: Text(e.toString()),
                  //             ))
                  //         .toList(),
                  //   ),
                  // ),
                  height(16),
                  Visibility(
                    visible: _user?.user?.job?.isEmpty ?? true,
                    child: CustomAppButton(
                      text: "Add",
                      containerColor: AppColor.beanut,
                      textColor: AppColor.white,
                      onPressed: () {
                        cubit.job(_user!);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
