import 'package:dream_home/core/function/show_toast.dart';
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
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../cubit/register/register_cubit.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_text_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(getIt()),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              showToast(
                message: "Register Success",
                backgroundColor: AppColor.beanut,
              );
              context.pushReplacement(Routes.whoareyou);
            } else if (state is RegisterError) {
              showToast(
                message: state.message,
                backgroundColor: AppColor.redED,
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();
            return Scaffold(
                appBar: appBar(
                  context,
                  title: "Sign UP",
                  automaticallyImplyLeading: false,
                ),
                body: state is RegisterLoading
                    ? CustomLoader()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height(heightSize(context) * 0.1),
                                Text(
                                  "FullName ",
                                  style: AppTextStyle.style14,
                                ),
                                height(4),
                                CustomTextFormFiled(
                                  hintText: "name",
                                  controller: cubit.userNameController,
                                  validator: (val) =>
                                      AppValidation.displayNameValidator(
                                          cubit.userNameController.text),
                                ),
                                height(16),
                                Text(
                                  "Email",
                                  style: AppTextStyle.style14,
                                ),
                                height(4),
                                CustomTextFormFiled(
                                  hintText: "demo@mail.com",
                                  controller: cubit.emailController,
                                  validator: (val) =>
                                      AppValidation.emailValidator(
                                          cubit.emailController.text),
                                ),
                                height(16),
                                Text(
                                  "Password",
                                  style: AppTextStyle.style14,
                                ),
                                height(4),
                                CustomTextFormFiled(
                                  hintText: "**********************",
                                  controller: cubit.passwordController,
                                  obscureText: cubit.passwordObsecureText,
                                  validator: (val) =>
                                      AppValidation.passwordVaildtor(
                                          cubit.passwordController.text),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.passwordObsecureText
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColor.beanut,
                                    ),
                                    onPressed: () {
                                      cubit.changepasswordObsecureText();
                                    },
                                  ),
                                ),
                                height(16),
                                Text(
                                  "Confirm Password",
                                  style: AppTextStyle.style14,
                                ),
                                height(4),
                                CustomTextFormFiled(
                                  validator: (val) =>
                                      AppValidation.confirmPasswordVaildtor(
                                    password:
                                        cubit.confirmPasswordController.text,
                                    value: cubit.passwordController.text,
                                  ),
                                  hintText: "**********************",
                                  controller: cubit.confirmPasswordController,
                                  obscureText:
                                      cubit.confirmPasswordObsecureText,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.confirmPasswordObsecureText
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColor.beanut,
                                    ),
                                    onPressed: () {
                                      cubit.changeconfirmPasswordObsecureText();
                                    },
                                  ),
                                ),
                                height(16),
                                CustomAppButton(
                                  text: "Sign UP ",
                                  containerColor: AppColor.beanut,
                                  textColor: AppColor.white,
                                  onPressed: () {
                                    cubit.register();
                                  },
                                ),
                                height(heightSize(context) * 0.05),
                                const CustomAuthText(isLoadgin: false),
                              ],
                            ),
                          ),
                        ),
                      ));
          },
        ));
  }
}
