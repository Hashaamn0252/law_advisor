import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/appoinment_schedules_controller.dart';

import '../controllers/general_controller.dart';
import '../models/appointment_schedules_model.dart';

getAppoinmentSchedulesRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GetAppoinmentSchedulesController>().getAppointmentSchedulesModel =
        GetAppointmentSchedulesModel.fromJson(response);

    log("${Get.find<GetAppoinmentSchedulesController>().getAppointmentSchedulesModel.data} Total Lawyer Appointment Schedules Length");

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<GetAppoinmentSchedulesController>()
        .updateAppointmentSchedulesLoader(false);
  }
}
