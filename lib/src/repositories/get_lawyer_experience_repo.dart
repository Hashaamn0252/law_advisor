import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

import '../controllers/general_controller.dart';
import '../models/get_lawyer_profile_experience_model.dart';

getLawyerExperienceRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<EditProfileController>()
        .lawyerProfileExperienceForPagination
        .isNotEmpty) {
      Get.find<EditProfileController>().lawyerProfileExperienceForPagination =
          [];
    }
    Get.find<EditProfileController>().getLawyerProfileExperienceModel =
        GetLawyerProfileExperienceModel.fromJson(response);

    Get.find<EditProfileController>().updateLawyerExperienceLoader(true);
    log("${Get.find<EditProfileController>().getLawyerProfileExperienceModel.data!.data!.length.toString()} Total Lawyer Experience History Length");

    log("${Get.find<EditProfileController>().getLawyerProfileExperienceModel.data!.data!} Only Data Lawyer Experience History");

    for (var element in Get.find<EditProfileController>()
        .getLawyerProfileExperienceModel
        .data!
        .data!) {
      Get.find<EditProfileController>()
          .updateLawyerExperienceForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<EditProfileController>().updateLawyerExperienceLoader(true);
  }
}
