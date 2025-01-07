import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/function/validation.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/widget/custom_text_form_filed.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/custom_app_button.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerProfileCubit(logoutRepo: getIt()),
      child: BlocConsumer<CustomerProfileCubit, CustomerProfileState>(
        listener: (context, state) {
          if (state is AddphoneNumberSuccessState) {
            context.pop();
            showToast(message: state.message, backgroundColor: AppColor.beanut);
          } else if (state is AddPhoneNumberFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CustomerProfileCubit>();
          LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                        .onTap(context.pop),
                    height(24),
                    Text(
                      "Change Phone Number",
                      style: AppTextStyle.style24
                          .copyWith(color: AppColor.lightblack),
                    ),
                    height(50),
                    CustomTextFormFiled(
                      controller: cubit.phoneController,
                      hintText: loginCubit.user.phone ?? "Phone Number",
                      validator: (val) {
                        return AppValidation.phoneNumberVaildtor(
                            cubit.phoneController.text);
                      },
                    ),
                    Spacer(),
                    CustomAppButton(
                      text: "Send",
                      containerColor: AppColor.beanut,
                      textColor: AppColor.white,
                      onPressed: () {
                        cubit.phone();
                      },
                    )
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
