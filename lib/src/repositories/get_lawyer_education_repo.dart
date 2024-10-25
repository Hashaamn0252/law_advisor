import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

import '../controllers/general_controller.dart';
import '../models/get_lawyer_profile_education_model.dart';
import '../models/get_lawyer_profile_experience_model.dart';

getLawyerEducationRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<EditProfileController>()
        .lawyerProfileEducationForPagination
        .isNotEmpty) {
      Get.find<EditProfileController>().lawyerProfileEducationForPagination =
          [];
    }
    Get.find<EditProfileController>().getLawyerProfileEducationModel =
        GetLawyerProfileEducationModel.fromJson(response);

    Get.find<EditProfileController>().updateLawyerEducationLoader(true);
    log("${Get.find<EditProfileController>().getLawyerProfileEducationModel.data!.data!.length.toString()} Total Lawyer Education History Length");

    log("${Get.find<EditProfileController>().getLawyerProfileEducationModel.data!.data!} Only Data Lawyer Education History");

    for (var element in Get.find<EditProfileController>()
        .getLawyerProfileEducationModel
        .data!
        .data!) {
      Get.find<EditProfileController>()
          .updateLawyerEducationForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<EditProfileController>().updateLawyerEducationLoader(true);
  }
}
