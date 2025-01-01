import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_color.dart';

void showToast({
  required String message,
}) {
  Fluttertoast.showToast(
    fontSize: 16,
    toastLength: Toast.LENGTH_LONG,
    msg: message,
    backgroundColor: AppColor.beanut,
  );
}
