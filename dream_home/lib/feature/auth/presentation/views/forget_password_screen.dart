import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/validation.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/function/show_toast.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../cubit/forget_passowrd/forget_password_cubit.dart';
import '../widget/custom_text_form_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt()),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            showToast(
              message: "Email Send Success",
              backgroundColor: AppColor.beanut,
            );
            context.pushReplacement(Routes.login);
          } else if (state is ForgetPasswordFailureState) {
            showToast(
              message: state.message,
              backgroundColor: AppColor.redED,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          return Scaffold(
            appBar: appBar(context,
                title: "Forget Password",
                automaticallyImplyLeading: false,
                leading: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.beanut,
                ).onTap(() {
                  context.pop();
                })),
            body: state is ForgetPasswordLoadindState
                ? CustomLoader()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height(heightSize(context) * 0.2),
                            Text(
                              "Email",
                              style: AppTextStyle.style14,
                            ),
                            height(4),
                            CustomTextFormFiled(
                              hintText: "demo@mail.com",
                              controller: cubit.emailController,
                              validator: (val) => AppValidation.emailValidator(
                                  cubit.emailController.text),
                            ),
                            height(heightSize(context) * 0.2),
                            CustomAppButton(
                              text: "Submit",
                              onPressed: () {
                                cubit.forgetpassword();
                              },
                              containerColor: AppColor.beanut,
                              textColor: AppColor.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
