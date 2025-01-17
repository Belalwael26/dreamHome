import 'package:dream_home/feature/worker_nav_bar/presentation/cubit/worker_nav_bar_cubit.dart';
import 'package:dream_home/feature/worker_nav_bar/presentation/cubit/worker_nav_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';

class WorkerNavBarScreen extends StatelessWidget {
  const WorkerNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerNavBarCubit(),
      child: BlocBuilder<WorkerNavBarCubit, WorkerNavBarState>(
        builder: (context, state) {
          final cubit = WorkerNavBarCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeIndex(index);
              },
              selectedItemColor: AppColor.beanut,
              unselectedItemColor: AppColor.primaryColor,
              currentIndex: cubit.currentIndex,
              selectedFontSize: 16,
              selectedIconTheme: IconThemeData(size: 30),
              unselectedIconTheme: IconThemeData(size: 24),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.request_page), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_3), label: "Profile"),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
