import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/cubit/customer_nav_bar_cubit.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/cubit/customer_nav_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerNavBarScreen extends StatelessWidget {
  const CustomerNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerNavBarCubit(),
      child: BlocBuilder<CustomerNavBarCubit, CustomerNavBarState>(
        builder: (context, state) {
          final cubit = CustomerNavBarCubit.get(context);
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
                    icon: Icon(Icons.search), label: "Search"),
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