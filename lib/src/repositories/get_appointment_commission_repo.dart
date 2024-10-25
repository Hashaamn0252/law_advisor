import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/appoinment_commission_controller.dart';
import '../models/get_appointment_commission_model.dart';

getAppointmentCommissionRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GetAppoinmentCommissionController>()
            .getAppointmentCommissionModel =
        GetAppointmentCommissionModel.fromJson(response);

    Get.find<GetAppoinmentCommissionController>()
        .updateAppointmentCommissionLoader(true);
    log("${Get.find<GetAppoinmentCommissionController>().getAppointmentCommissionModel.data} Appointment Commission");
  } else if (!responseCheck) {
    Get.find<GetAppoinmentCommissionController>()
        .updateAppointmentCommissionLoader(false);
  }
}
