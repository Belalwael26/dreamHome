import 'dart:developer';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/constant/constant.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/presentation/widgets/custom_customer_home_container.dart';
import 'package:dream_home/feature/worker_home/presentation/cubit/worker_home_cubit.dart';
import 'package:dream_home/feature/worker_home/presentation/widget/custom_order_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<WorkerHomeCubit, WorkerHomeState>(
        builder: (context, state) {
          final cubit = context.read<WorkerHomeCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Scaffold(
              body: Column(
                children: [
                  CustomCustomerHomeContainer(
                    text: "Orders",
                    name: _user?.name ?? "",
                    image: image,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        itemBuilder: (context, index) => CustomOrderDataBody(
                          userName: cubit.order[index].userName ?? "",
                          userLoation: cubit.order[index].userLocation ?? "",
                          phone: cubit.order[index].userphone ?? "",
                        ),
                        itemCount: cubit.order.length,
                        separatorBuilder: (context, index) => height(16),
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
