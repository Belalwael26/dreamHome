import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_customer_home_container.dart';
import '../widgets/custom_grid_view_item_builder.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(),
      child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          final cubit = CustomerHomeCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                CustomCustomerHomeContainer(),
                height(6),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CustomGridViewItemBuilder(
                        jobName: "Carpenter",
                        vectors: cubit.vectors[index],
                      );
                    },
                    itemCount: cubit.vectors.length,
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
