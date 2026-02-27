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

  static bool showLoading = false;
  static void showToast(BuildContext context, String? msg) {
    if (ToastUtils.showLoading) {
      return;
    }
    ToastUtils.showLoading = true;
    Future.delayed(const Duration(seconds: 3), () {
      ToastUtils.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}
