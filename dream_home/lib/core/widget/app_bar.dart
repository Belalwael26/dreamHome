import 'package:flutter/material.dart';
import '../styles/app_text_style.dart';

PreferredSizeWidget? appBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool automaticallyImplyLeading = true,
  Widget? leading,
}) {
  return AppBar(
    elevation: 0,
    surfaceTintColor: Colors.white,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Text(
      title,
      style: AppTextStyle.style20,
    ),
    actions: actions,
    leading: leading,
    centerTitle: true,
  );
}
