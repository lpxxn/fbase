import 'package:flutter/material.dart';

class ToastUtils {
  static void show(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        content: Text(msg ?? "刷新成功", textAlign: TextAlign.center),
      ),
    );
  }
}
