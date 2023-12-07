import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../features/auth/login/manager/login_cubit.dart';

class HelperFunction {
  static void flutterToast(BuildContext context,
      {required String message, required Color color}) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM,
      toastLength:Toast.LENGTH_SHORT
    );
  }
}
