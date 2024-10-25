import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/generate_schedule_slots_controller.dart';

generateAppointmentScheduleSlotsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GenerateScheduleSlotsController>()
        .updateGenerateScheduleSlotsLoader(false);
    log("Generate Appointment Schedule Slots Succesfully");
    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    log("Failed to Generate Appointment Schedule Slots");
    Get.find<GenerateScheduleSlotsController>()
        .updateGenerateScheduleSlotsLoader(true);
  }
}

generateAppointmentScheduleSlotsForSingleDayRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GenerateScheduleSlotsController>()
        .updateGenerateScheduleSlotsLoader(false);
    log("Generate Appointment Schedule Slots Succesfully");
    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    log("Failed to Generate Appointment Schedule Slots");
    Get.find<GenerateScheduleSlotsController>()
        .updateGenerateScheduleSlotsLoader(true);
  }
}
