import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';

import '../controllers/signup_controller.dart';
import '../models/response_model.dart';
import '../widgets/custom_dialog.dart';

signUpWithEmailRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  Get.find<GeneralController>().genericResponseModel =
      GetResponseModel.fromJson(response);
  if (responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);

    if (response['success'].toString() == 'true') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Signup Successfully',
              titleColor: AppColors.customDialogSuccessColor,
              descriptions: "Let's Login",
              text: "Ok",
              functionCall: () {
                Navigator.pop(context);
                Get.back();
              },
              img: 'assets/icons/dialog_success.png',
            );
          });
    } else {
      if (response['errors'].containsKey('email')) {
        Get.find<SignUpController>().emailValidator =
            response['errors']['email'][0];
        Get.find<SignUpController>().update();
      }
    }
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
    log("${Get.find<GeneralController>().genericResponseModel.toJson().toString()}");
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: response['message'].toString(),
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Please Try Again!',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
