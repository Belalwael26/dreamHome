import 'package:dream_home/app/routes/app_router.dart';
import 'package:flutter/material.dart';

class DreamHomeApp extends StatelessWidget {
  const DreamHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
