import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context, {String? msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 150,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Text(msg ?? '刷新成功', textAlign: TextAlign.center),
      ),
    );
  }
}
