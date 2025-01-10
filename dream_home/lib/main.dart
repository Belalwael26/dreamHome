import 'package:dream_home/app/dream_home_app.dart';
import 'package:dream_home/core/service/notifications.dart';
import 'package:dream_home/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencyInjection();
  await NotificationService.instance.initialize();
  runApp(const DreamHomeApp());
}
