import 'dart:developer';

import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/cache/user_info_cache.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/constant/constant.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/user_model.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/customer_home/presentation/data/models/worker_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_customer_home_container.dart';
import '../widgets/custom_grid_view_item_builder.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  UserModel? _user;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    UserModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.name}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(getIt()),
      child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                CustomCustomerHomeContainer(
                  name: _user?.name ?? "",
                  image: image,
                ),
                height(6),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 8, top: 4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CustomGridViewItemBuilder(
                        jobName: worker[index].jobName,
                        vectors: worker[index].image,
                        onTap: () => context.pushNamed(
                          Routes.workerCategory,
                          extra: worker[index].jobName,
                        ),
                      );
                    },
                    itemCount: worker.length,
                  ),
                ))
              ],
            ),
          ));
        },
      ),
    );
  }
}
