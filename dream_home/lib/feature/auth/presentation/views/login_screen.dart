import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../Core/utils/app_images.dart';
import '../../../../app/routes/routes.dart';
import '../../../../core/function/show_toast.dart';
import '../../../../core/function/validation.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../../di.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // if (state is LoginSuccessState) {
          //   showToast(
          //       message: state.user.message!, backgroundColor: AppColor.green);
          //   context.pushReplacement(Routes.whoareyou);
          // } else if (state is LoginFailedState) {
          //   showToast(message: state.message, backgroundColor: AppColor.redED);
          // }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Expanded(flex: 2, child: Image.asset(AppImages.logo)),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: AppColor.yellowColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          spacing: 16,
                          children: [
                            Text(
                              "مرحبا مجددا",
                              style: AppTextStyle.style20,
                            ),
                            Text(
                              "من فضلك قم بتسجيل الدخول",
                              style: AppTextStyle.style16
                                  .copyWith(color: AppColor.white),
                            ),
                            CustomTextFormFiled(
                              borderColor: AppColor.black,
                              controller: cubit.emailController,
                              hintText: "ادخل البريد الالكتروني الخاص بك",
                              validator: (valu) => AppValidation.emailValidator(
                                  cubit.emailController.text),
                            ),
                            CustomTextFormFiled(
                              borderColor: AppColor.black,
                              controller: cubit.passwordController,
                              hintText: "ادخل كلمة المرور الخاصة بك",
                              validator: (valu) =>
                                  AppValidation.passwordVaildtor(
                                      cubit.passwordController.text),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "نسيت كلمة المرور؟",
                                style: AppTextStyle.style16
                                    .copyWith(color: AppColor.redED),
                              ).onTap(() {
                                context.push(Routes.forgetpaswword);
                              }),
                            ),
                            CustomAppButton(
                              text: "تسجيل الدخول",
                              containerColor: AppColor.white,
                              textColor: AppColor.black,
                              onPressed: () {
                                cubit.login();
                              },
                            ),
                            CustomAuthText(
                              isLoadgin: true,
                            ),
                          ],
                        ),
                      ),
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
