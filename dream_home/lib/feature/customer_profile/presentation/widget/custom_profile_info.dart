import 'dart:developer';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/widget/dialogs/dialog.dart';
import '../../../auth/presentation/widget/custom_choose_account_type.dart';
import '../../../auth/presentation/widget/custom_choose_your_job.dart';
import '../../../customer_home/presentation/data/models/worker_data_model.dart';
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
                spacing: 16,
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                      .onTap(context.pop),
                  height(24),
                  CustomAddProfileStack(
                    containerColor: AppColor.yellowColor,
                    personIcon: Image.asset(
                      _user!.user!.role == "customer"
                          ? AppImages.per2
                          : AppImages.craft2,
                    ),
                    borderColor: AppColor.greyD,
                    iconColor: AppColor.lightblack,
                    iconBorderColor: AppColor.transparent,
                  ),
                  height(30),
                  //! Name
                  FadeAnimationCustom(
                    delay: 1.2,
                    child: CustomTextFormFiled(
                      borderColor: AppColor.yellowColor,
                      hintText: _user?.user?.firstName,
                      hintColor: AppColor.black,
                      controller: TextEditingController(),
                    ),
                  ),
                  //! Email
                  FadeAnimationCustom(
                    delay: 1.2,
                    child: CustomTextFormFiled(
                        borderColor: AppColor.yellowColor,
                        hintText: _user?.user?.email,
                        hintColor: AppColor.black,
                        controller: TextEditingController()),
                  ),
                  //! Phone Number
                  FadeAnimationCustom(
                    delay: 1.2,
                    child: CustomTextFormFiled(
                        borderColor: AppColor.yellowColor,
                        hintText: _user?.user?.contactNumber,
                        hintColor: AppColor.black,
                        controller: TextEditingController()),
                  ),
                  //! Account Type
                  FadeAnimationCustom(
                    delay: 1.2,
                    child: CustomTextFormFiled(
                      hintColor: AppColor.black,
                      controller: TextEditingController(),
                      borderColor: AppColor.yellowColor,
                      hintText: cubit.selectedItem == ""
                          ? _user!.user!.role
                          : cubit.selectedItem,
                      enabled: false,
                    ).onTap(
                      () {
                        popupDropDownDialogs(
                            context: context,
                            height: heightSize(context) * 0.25,
                            children: [
                              SizedBox(
                                  height: heightSize(context) * 0.25,
                                  width: double.maxFinite,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      color: AppColor.yellowColor,
                                      thickness: 3,
                                    ),
                                    itemCount: cubit.items.length,
                                    itemBuilder: (context, index) {
                                      return CustomChooseAccountType(
                                        image: cubit.images[index],
                                        text: cubit.items[index],
                                      ).onTap(() {
                                        setState(() {
                                          cubit.selectedItem =
                                              cubit.items[index];
                                        });
                                        context.pop();
                                      });
                                    },
                                  ))
                            ]);
                      },
                    ),
                  ),
                  //! Job Title
                  Visibility(
                    visible: cubit.selectedItem == "employee",
                    child: FadeAnimationCustom(
                      delay: 1.2,
                      child: CustomTextFormFiled(
                        hintColor: AppColor.black,
                        controller: TextEditingController(),
                        borderColor: AppColor.yellowColor,
                        hintText: cubit.selectedJob == ""
                            ? "اختار نوع الوظيفة"
                            : cubit.selectedJob,
                        enabled: false,
                      ).onTap(
                        () {
                          popupDropDownDialogs(
                              context: context,
                              height: heightSize(context) * 0.7,
                              children: [
                                SizedBox(
                                  height: heightSize(context) * 0.7,
                                  width: double.maxFinite,
                                  child: GridView.builder(
                                    padding: EdgeInsets.only(bottom: 8),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return CustomChooseYourJob(
                                        image: worker[index].image,
                                        text: worker[index].jobName,
                                      ).onTap(() {
                                        setState(() {
                                          cubit.selectedJob =
                                              worker[index].jobName;
                                        });
                                        context.pop();
                                      });
                                    },
                                    itemCount: worker.length,
                                  ),
                                )
                              ]);
                        },
                      ),
                    ),
                  ),
                  CustomAppButton(
                    text: "Update",
                    containerColor: AppColor.yellowColor,
                    textColor: AppColor.white,
                    onPressed: () {
                      cubit.job(_user!);
                    },
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
