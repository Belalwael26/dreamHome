import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:dream_home/feature/customer_home/presentation/widgets/custom_worker_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_color.dart';

class WorkerCaregoryScreen extends StatelessWidget {
  final String category;
  const WorkerCaregoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerHomeCubit(getIt())..getworker(category: category),
      child: Scaffold(
        body: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
          builder: (context, state) {
            final cubit = context.read<CustomerHomeCubit>();
            return state is GetWorkersLoadingState
                ? CustomLoader()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                            .onTap(context.pop),
                        height(24),
                        Text(
                          "The Most $category in Your Area",
                          style: AppTextStyle.style22.copyWith(
                            color: AppColor.lightblack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height(24),
                        ...List.generate(
                          cubit.users?.employees?.length ?? 0,
                          (index) => CustomWorkerInfoContainer(
                            name:
                                cubit.users?.employees?[index].firstName ?? "",
                            phone:
                                cubit.users?.employees?[index].contactNumber ??
                                    "01000000000",
                          ).onTap(() {
                            context.pushNamed(Routes.workerdetails,
                                extra: cubit.users?.employees?[index]);
                          }),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
