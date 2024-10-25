import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/lawyer_appointment_history_controller.dart';
import '../controllers/general_controller.dart';
import '../models/lawyer_appointment_history_model.dart';

getAllLawyerAppointmentHistoryRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<LawyerAppointmentHistoryController>()
        .lawyerAllAppointmentHistoryListForPagination
        .isNotEmpty) {
      Get.find<LawyerAppointmentHistoryController>()
          .lawyerAllAppointmentHistoryListForPagination = [];
    }
    Get.find<LawyerAppointmentHistoryController>()
            .getLawyerAppointmentHistoryModel =
        GetLawyerAppointmentHistoryModel.fromJson(response);

    Get.find<LawyerAppointmentHistoryController>()
        .updateLawyerAppointmentHistoryLoader(true);
    log("${Get.find<LawyerAppointmentHistoryController>().getLawyerAppointmentHistoryModel.data!.data!.length.toString()} Total Lawyer Appoinment History Length");
    log("${Get.find<LawyerAppointmentHistoryController>().getLawyerAppointmentHistoryModel.data!.data!.where((i) => i.appointmentStatusName == "Completed").toList().length.toString()} Total Completed Lawyer Appoinment History Length");
    log("${Get.find<LawyerAppointmentHistoryController>().getLawyerAppointmentHistoryModel.data!.data!} Only Data Lawyer Appoinment History");

    // Map<String, dynamic> createAppointmentPayload() {
    //   Map<String, dynamic> appointment = {
    //     "id": 38,
    //     "customer_id": 4,
    //     "customer_name": "Ahsan101 Mono",
    //     "customer_image":
    //         "/files/profile_images/1693388416scaled_image_picker500202318720402858.jpg",
    //     "appointment_status_name": "Pending",
    //     "appointment_type_name": "Video Call",
    //     "is_schedule_required": 1,
    //     "lawyer_id": 15,
    //     "lawyer_name": "Isabella-fk Carrington",
    //     "lawyer_image": "/images/lawyers/64d0f6a82b9af.png",
    //     "law_firm_id": null,
    //     "law_firm_name": null,
    //     "law_firm_image": null,
    //     "date": "31/08/2023",
    //     "start_time": "21:20",
    //     "end_time": "21:20",
    //     "fee": 10,
    //     "is_paid": 1,
    //     "appointment_type_id": 1,
    //     "question": "tes",
    //     "attachment_url": null,
    //     "appointment_status_code": 1
    //   };

    //   Map<String, dynamic> payload = {
    //     "appointment": appointment,
    //     "channel_name": "channel ne",
    //     "token": "channel ne"
    //   };

    //   return payload;
    // }

    for (var element in Get.find<LawyerAppointmentHistoryController>()
        .getLawyerAppointmentHistoryModel
        .data!
        .data!) {
      Get.find<LawyerAppointmentHistoryController>()
          .updateLawyerListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawyerAppointmentHistoryController>()
        .updateLawyerAppointmentHistoryLoader(true);
  }
}
