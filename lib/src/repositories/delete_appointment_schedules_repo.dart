// Delete Appointment Schedule Profile
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/routes.dart';
import 'package:lawyer_consultant_for_lawyers/src/widgets/custom_dialog.dart';

import '../config/app_colors.dart';
import '../controllers/appoinment_schedules_controller.dart';
import '../controllers/general_controller.dart';

deleteAppointmentScheduleRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (response['success'].toString() == 'true') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Success!',
              titleColor: AppColors.customDialogSuccessColor,
              descriptions: "Appointment Schedule Deleted Successfully",
              text: "Ok",
              functionCall: () {
                Get.offAndToNamed(PageRoutes.scheduleAppSlots);
                Get.find<GetAppoinmentSchedulesController>()
                    .updateAppointmentSchedulesLoader(false);
              },
              img: 'assets/icons/dialog_success.png',
            );
          });
      Get.find<GeneralController>().updateFormLoaderController(false);
    } else {
      print("$response False Response");
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Failed",
              titleColor: AppColors.customDialogErrorColor,
              descriptions: 'Please Try Again!',
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/icons/dialog_error.png',
            );
          });
      Get.find<GeneralController>().updateFormLoaderController(false);
    }

    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}
