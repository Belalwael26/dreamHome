import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: appBar(
        context,
        title: "Sign UP",
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      controller: cubit.emailController,
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
                    ),
                    height(16),
                    Text(
                      "Confirm Password",
                      style: AppTextStyle.style14,
                    ),
                    height(4),
                    CustomTextFormFiled(
                      hintText: "**********************",
                      controller: cubit.passwordController,
                    ),
                    height(16),
                    const CustomAppButton(
                      text: "Sign UP ",
                      containerColor: AppColor.beanut,
                      textColor: AppColor.white,
                    ),
                    height(heightSize(context) * 0.05),
                    const CustomAuthText(isLoadgin: false),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
