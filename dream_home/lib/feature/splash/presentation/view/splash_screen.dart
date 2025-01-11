import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/service/on_boarding_service.dart';
import '../../../auth/data/model/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;

  bool onboardingShown = false;
  UserModel? _user;
  @override
  void initState() {
    super.initState();
    load();
    animated();
  }

  Future<void> load() async {
    onboardingShown = await OnboardingService().isOnboardingShown();
    UserModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              _colorAnimation1.value ?? Colors.transparent,
              _colorAnimation2.value ?? Colors.transparent,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColor.transparent,
          body: Center(
            child: Image.asset(AppImages.logo),
          ),
        ),
      ),
    );
  }

  animated() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _colorAnimation1 = ColorTween(
      begin: AppColor.primaryColor,
      end: AppColor.greyD,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: AppColor.primaryColor,
      end: AppColor.greyD,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (onboardingShown) {
          if (_user?.token == null) {
            context.pushReplacement(Routes.login);
          } else {
            context.pushReplacement(Routes.customernavbar);
          }
        } else {
          context.pushReplacement(Routes.onboarding);
        }
      }
    });

    _controller.forward();
  }
}
