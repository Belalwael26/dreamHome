import 'package:dream_home/feature/auth/data/repo/forgetpassword/forget_password_repo.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo_impl.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo_impl.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo.dart';
import 'package:dream_home/feature/customer_home/data/repo/customer_home_repo_impl.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_profile/data/repo/logout/logout_repo.dart';
import 'package:dream_home/feature/customer_profile/data/repo/logout/logout_repo_impl.dart';
import 'package:dream_home/feature/customer_profile/presentation/cubit/customer_profile_cubit/customer_profile_cubit.dart';
import 'package:dream_home/feature/worker_profile/data/repos/worker_profile_repo.dart';
import 'package:dream_home/feature/worker_profile/data/repos/worker_profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/data/repo/forgetpassword/forget_password_repo_impl.dart';
import 'feature/auth/presentation/cubit/forget_passowrd/forget_password_cubit.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();

  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerRepos() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl());
  getIt.registerSingleton<RegisterRepo>(RegisterRepoImpl());
  getIt.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepoImpl());
  getIt.registerSingleton<LogoutRepo>(LogoutRepoImpl());
  getIt.registerSingleton<CustomerHomeRepo>(CustomerHomeRepoImpl());
  getIt.registerSingleton<WorkerProfileRepo>(WorkerProfileRepoImpl());
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory<CustomerProfileCubit>(
      () => CustomerProfileCubit(logoutRepo: getIt()));
  getIt.registerFactory<CustomerHomeCubit>(() => CustomerHomeCubit(getIt()));
}
