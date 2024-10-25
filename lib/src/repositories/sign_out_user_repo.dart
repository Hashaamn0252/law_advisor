import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_appointment_history_controller.dart';
import '../controllers/pusher_beams_controller.dart';
import '../controllers/sign_out_user_controller.dart';

import '../routes.dart';
import '../widgets/custom_dialog.dart';

signOutUserRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    // Get.find<LoggedInUserController>().loggedInUserModel =
    //     GetLoggedInUserModel.fromJson(response);
    Get.find<GeneralController>().storageBox.erase();

    Get.find<GeneralController>().storageBox.remove('userData');
    Get.find<GeneralController>().storageBox.remove('seen');
    Get.find<GeneralController>().storageBox.remove('userID');
    if (Get.find<LawyerAppointmentHistoryController>()
        .lawyerAllAppointmentHistoryListForPagination
        .isNotEmpty) {
      Get.find<LawyerAppointmentHistoryController>()
          .lawyerAllAppointmentHistoryListForPagination = [];
    }
    // Get.find<GeneralController>().box.remove('localToken');
    Get.find<GeneralController>().currentLawyerModel = null;
    Get.offAndToNamed(PageRoutes.homeScreen);
    Get.find<SignOutUserController>().updateSignOutLoaderController(false);
    Get.find<PusherBeamsController>().clearAllStatePusherBeams();
    if (Get.find<SignOutUserController>().signOutModel.message == "true") {
      // Get.toNamed(PageRoutes.signinScreen);
    }
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Please Try Again",
            titleColor: AppColors.customDialogErrorColor,
            descriptions:
                '${Get.find<SignOutUserController>().signOutModel.message}',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
