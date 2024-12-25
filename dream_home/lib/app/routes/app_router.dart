import 'package:dream_home/app/routes/routes.dart';
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
]);
