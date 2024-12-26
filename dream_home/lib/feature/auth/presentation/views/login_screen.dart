import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_forget_password_text.dart';
import '../widget/custom_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppImages.logo,
                        width: 250,
                        height: 250,
                      ),
                    ),
                    Text("Email", style: AppTextStyle.style14),
                    height(4),
                    CustomTextFormFiled(
                      hintText: "demo@mail.com",
                      controller: cubit.emailController,
                    ),
                    height(64),
                    Text("Password", style: AppTextStyle.style14),
                    height(4),
                    CustomTextFormFiled(
                      hintText: "**********************",
                      controller: cubit.passwordController,
                    ),
                    height(4),
                    const CustomForgetPasswordWidget(),
                    height(16),
                    const CustomAppButton(
                      text: "Login",
                      textColor: AppColor.white,
                      containerColor: AppColor.beanut,
                    ),
                    height(heightSize(context) * 0.2),
                    const CustomAuthText(
                      isLoadgin: true,
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
