import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../controllers/logged_in_user_controller.dart';
import '../models/logged_in_user_model.dart';
import '../widgets/custom_dialog.dart';

loggedInUserRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LoggedInUserController>().loggedInUserModel =
        GetLoggedInUserModel.fromJson(response);
    Get.find<GeneralController>().lawyerModules =
        Get.find<LoggedInUserController>()
            .loggedInUserModel
            .data!
            .lawyerModules;
    print("LAWYER MODULES ${Get.find<GeneralController>().lawyerModules}");
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Please Try Again",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: '${response["message"]}',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
