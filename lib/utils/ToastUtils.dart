import 'package:flutter/material.dart';

class ToastUtils {
  //阀门控制
  static bool _isShowing = false;

  static void showToast(BuildContext context, String msg) {
    if (_isShowing) {
      return;
    }
    _isShowing = true;
    Future.delayed(Duration(seconds: 3), () {
      _isShowing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 150,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(msg, textAlign: TextAlign.center),
      ),
    );
  }
}
