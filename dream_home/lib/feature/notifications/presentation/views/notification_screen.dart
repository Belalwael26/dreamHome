import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/notifications/presentation/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/function/show_toast.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt())..notification(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is DeleteNotificationSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
            context.read<NotificationCubit>().notification();
          } else if (state is DeleteNotificationFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          } else if (state is ChangeNotificationStatusSuccessState) {
            context.read<NotificationCubit>().notification();
          } else if (state is ChangeNotificationStatusFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
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
                          Icon(Icons.arrow_back_ios,
                                  color: AppColor.yellowColor)
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
                            (index) => Dismissible(
                              background: Container(
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: AppColor.redED,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                cubit.deleteNotification(
                                    id: cubit.notificationList[index].id ?? "");
                              },
                              child: NotificationItem(
                                color:
                                    cubit.notificationList[index].isOpen == true
                                        ? AppColor.yellowColor
                                            .withValues(alpha: 0.3)
                                        : AppColor.transparent,
                                body: cubit.notificationList[index].title ?? "",
                                title: cubit.notificationList[index].body ?? "",
                              ).onTap(() {
                                cubit.changeNotificationStatus(
                                    id: cubit.notificationList[index].id ?? "");
                              }),
                            ),
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
