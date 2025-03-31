import 'package:dream_home/app/dream_home_app.dart';
import 'package:dream_home/core/service/notifications.dart';
import 'package:dream_home/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencyInjection();
  await NotificationService.instance.initialize();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translate',
      startLocale: null,
      fallbackLocale: const Locale('en'),
      child: const DreamHomeApp()));
}
