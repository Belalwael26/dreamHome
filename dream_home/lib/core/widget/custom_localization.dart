import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization/localization.dart';

class CustomLocalization extends StatelessWidget {
  const CustomLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, currentLocale) {
        final cubit = context.read<LocaleCubit>();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.yellowColor),
          ),
          child: DropdownButton<Locale>(
            value: currentLocale,
            elevation: 0,
            borderRadius: BorderRadius.circular(16),
            underline: height(0),
            items: const [
              DropdownMenuItem(
                value: Locale('en'),
                child: Row(
                  spacing: 8,
                  children: [
                    Text('English'),
                    Icon(
                      Icons.translate_outlined,
                      color: AppColor.yellowColor,
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: Locale('ar'),
                child: Row(
                  spacing: 8,
                  children: [
                    Text('العربيه'),
                    Icon(
                      Icons.translate_outlined,
                      color: AppColor.yellowColor,
                    ),
                  ],
                ),
              ),
            ],
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                cubit.changeLocale(newLocale);
                context.setLocale(newLocale);
              }
            },
          ),
        );
      },
    );
  }
}
