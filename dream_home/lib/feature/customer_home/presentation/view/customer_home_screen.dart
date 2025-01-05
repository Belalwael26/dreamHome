import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/customer_home/presentation/data/models/worker_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_customer_home_container.dart';
import '../widgets/custom_grid_view_item_builder.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(getIt()),
      child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          //final cubit = CustomerHomeCubit.get(context);
          final userCubit = BlocProvider.of<LoginCubit>(context, listen: true);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                CustomCustomerHomeContainer(
                  name: userCubit.user.name ?? "",
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
