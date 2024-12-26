import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/login_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/register_screen.dart';
import 'package:dream_home/feature/onborading/presentation/views/onboarding_screen.dart';
import 'package:dream_home/feature/splash/presentation/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.login,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: Routes.forgetpaswword,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: Routes.register,
    builder: (context, state) => RegisterScreen(),
  ),
]);
