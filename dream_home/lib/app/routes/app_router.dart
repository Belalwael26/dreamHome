import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/login_screen.dart';
import 'package:dream_home/feature/auth/presentation/views/register_screen.dart';
import 'package:dream_home/feature/customer_home/presentation/view/worker_caregory_screen.dart';
import 'package:dream_home/feature/customer_home/presentation/view/worker_details_screen.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/view/customer_nav_bar_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/about_us_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/change_number_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/change_password_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/complaint_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/contact_us_screen.dart';
import 'package:dream_home/feature/customer_profile/presentation/widget/custom_profile_info.dart';
import 'package:dream_home/feature/notifications/presentation/views/notification_screen.dart';
import 'package:dream_home/feature/onborading/presentation/views/onboarding_screen.dart';
import 'package:dream_home/feature/splash/presentation/view/splash_screen.dart';
import 'package:dream_home/feature/worker_nav_bar/presentation/views/worker_nav_bar_screen.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/constant.dart';

final router = GoRouter(navigatorKey: navigatorKey, routes: [
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
  GoRoute(
    path: "/${Routes.workerCategory}",
    name: Routes.workerCategory,
    builder: (context, state) {
      final jobName = state.extra;
      return WorkerCaregoryScreen(
        category: jobName.toString(),
      );
    },
  ),
  GoRoute(
    path: Routes.notification,
    builder: (context, state) => NotificationScreen(),
  ),
  GoRoute(
      path: "/${Routes.workerdetails}",
      name: Routes.workerdetails,
      builder: (context, state) {
        final user = state.extra as LoginModel;
        return WorkerDetailsScreen(
          user: user,
        );
      }),
]);
