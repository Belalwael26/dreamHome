import 'package:dream_home/feature/auth/data/repo/forgetpassword/forget_password_repo.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo.dart';
import 'package:dream_home/feature/auth/data/repo/login/login_repo_impl.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo.dart';
import 'package:dream_home/feature/auth/data/repo/register/register_repo_impl.dart';
import 'package:dream_home/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
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
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
}
