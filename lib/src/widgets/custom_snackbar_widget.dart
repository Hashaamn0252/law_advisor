import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String subTitle) {
  Get.snackbar(title, subTitle,
      colorText: Theme.of(Get.context!).snackBarTheme.actionTextColor,
      backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor);
}
