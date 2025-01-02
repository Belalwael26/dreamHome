import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/function/validation.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../../core/widget/custom_loader.dart';
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
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
              message: "Login Success",
              backgroundColor: AppColor.beanut,
            );
            context.pushReplacement(Routes.whoareyou);
          } else if (state is LoginFailureState) {
            showToast(
              message: state.message,
              backgroundColor: AppColor.redED,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: state is LoginLoadingState
                ? CustomLoader()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: cubit.formKey,
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
                              validator: (val) => AppValidation.emailValidator(
                                  cubit.emailController.text),
                            ),
                            height(36),
                            Text("Password", style: AppTextStyle.style14),
                            height(4),
                            CustomTextFormFiled(
                              hintText: "**********************",
                              controller: cubit.passwordController,
                              obscureText: cubit.obsecureText,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  cubit.obsecureText
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColor.beanut,
                                ),
                                onPressed: () {
                                  cubit.changeObsecureText();
                                },
                              ),
                              validator: (val) =>
                                  AppValidation.passwordVaildtor(
                                      cubit.passwordController.text),
                            ),
                            height(4),
                            const CustomForgetPasswordWidget(),
                            height(16),
                            CustomAppButton(
                              text: "Login",
                              textColor: AppColor.white,
                              containerColor: AppColor.beanut,
                              onPressed: () {
                                cubit.login();
                              },
                            ),
                            height(heightSize(context) * 0.2),
                            const CustomAuthText(
                              isLoadgin: true,
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
