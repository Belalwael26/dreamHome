import 'dart:developer';
import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/constant/constant.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/presentation/widgets/custom_customer_home_container.dart';
import 'package:dream_home/feature/worker_home/presentation/cubit/worker_home_cubit.dart';
import 'package:dream_home/feature/worker_home/presentation/widget/custom_accept_or_declin_order.dart';
import 'package:dream_home/feature/worker_home/presentation/widget/custom_order_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  UserModel? _user;
  Future<void> load() async {
    UserModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.name}");
    log("${_user!.job}");
    log("=======================================${_user!.id}");
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerHomeCubit(getIt())..orders(),
      child: BlocConsumer<WorkerHomeCubit, WorkerHomeState>(
        listener: (context, state) {
          if (state is ChangeOrderStatusSuccessState) {
            showToast(message: state.message, backgroundColor: AppColor.beanut);
            context.read<WorkerHomeCubit>().orders();
          } else if (state is ChangeOrderStatusFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<WorkerHomeCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Scaffold(
              body: state is WorkerHomeLoadingState
                  ? CustomLoader()
                  : Column(
                      children: [
                        CustomCustomerHomeContainer(
                          text: "Orders",
                          name: _user?.name ?? "",
                          image: image,
                        ),
                        height(cubit.order.isEmpty
                            ? heightSize(context) * 0.3
                            : 0),
                        cubit.order.isEmpty
                            ? Text(
                                "You Don't Have Any Orders Yet",
                                style: AppTextStyle.style20
                                    .copyWith(color: AppColor.lightblack),
                              )
                            : Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        CustomOrderDataBody(
                                      userName:
                                          cubit.order[index].userName ?? "",
                                      userLoation:
                                          cubit.order[index].userLocation ?? "",
                                      phone: cubit.order[index].userphone ?? "",
                                      orderStatus:
                                          cubit.order[index].orderStatus ?? "",
                                    ).onTap(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CustomAcceptOrDeclinOrder(
                                                name: cubit.order[index]
                                                        .userName ??
                                                    " ",
                                                acceptonPressed: () {
                                                  context.pop();
                                                  cubit.changeOrderStatus(
                                                    orderStatus: "Accepted",
                                                    orderId: cubit.order[index]
                                                            .orderid ??
                                                        "",
                                                  );
                                                },
                                                declineonPressed: () {
                                                  context.pop();
                                                  cubit.changeOrderStatus(
                                                    orderStatus: "Decline",
                                                    orderId: cubit.order[index]
                                                            .orderid ??
                                                        "",
                                                  );
                                                },
                                              ));
                                    }),
                                    itemCount: cubit.order.length,
                                    separatorBuilder: (context, index) =>
                                        height(16),
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
