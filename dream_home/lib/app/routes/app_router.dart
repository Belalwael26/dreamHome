import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/login_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/register_screen.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/view/customer_nav_bar_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/about_us_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/change_number_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/change_password_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/complaint_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/contact_us_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/custom_profile_info.dart';
import 'package:dream_home/feature/onborading/presentation/views/onboarding_screen.dart';
import 'package:dream_home/feature/splash/presentation/view/splash_screen.dart';
import 'package:dream_home/feature/who_are_you/presentation/views/who_are_you_screen.dart';
import 'package:dream_home/feature/worker_nav_bar/presentation/views/worker_nav_bar_screen.dart';
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
  GoRoute(
    path: Routes.whoareyou,
    builder: (context, state) => WhoAreYouScreen(),
  ),
  GoRoute(
    path: Routes.workernavbar,
    builder: (context, state) => WorkerNavBarScreen(),
  ),
  GoRoute(
    path: Routes.customernavbar,
    builder: (context, state) => CustomerNavBarScreen(),
  ),
  GoRoute(
    path: Routes.profileinfo,
    builder: (context, state) => CustomProfileInfo(),
  ),
  GoRoute(
    path: Routes.changepassword,
    builder: (context, state) => ChangePasswordScreen(),
  ),
  GoRoute(
    path: Routes.changenumber,
    builder: (context, state) => ChangeNumberScreen(),
  ),
  GoRoute(
    path: Routes.aboutus,
    builder: (context, state) => AboutUsScreen(),
  ),
  GoRoute(
    path: Routes.contactus,
    builder: (context, state) => ContactUsScreen(),
  ),
  GoRoute(
    path: Routes.complaintscreen,
    builder: (context, state) => ComplaintScreen(),
  ),
]);
