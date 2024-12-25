import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  @override
  void initState() {
    super.initState();
    animated();
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
        context.pushReplacement(Routes.onboarding);
      }
    });

    _controller.forward();
  }
}
