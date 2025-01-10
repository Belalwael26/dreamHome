import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/notifications/presentation/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt())..notification(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          final cubit = context.read<NotificationCubit>();
          return Scaffold(
            body: state is NotificationLoadingState
                ? CustomLoader()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                              .onTap(context.pop),
                          height(24),
                          Text(
                            "Notifications",
                            style: AppTextStyle.style24
                                .copyWith(color: AppColor.lightblack),
                          ),
                          height(24),
                          ...List.generate(
                              cubit.notificationList.length,
                              (index) => NotificationItem(
                                    body: cubit.notificationList[index].title ??
                                        "",
                                    title: cubit.notificationList[index].body ??
                                        "",
                                  ))
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
