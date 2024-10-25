import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

import '../controllers/general_controller.dart';
import '../models/get_lawyer_profile_certificate_model.dart';

getLawyerCertificateRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<EditProfileController>()
        .lawyerProfileCertificateForPagination
        .isNotEmpty) {
      Get.find<EditProfileController>().lawyerProfileCertificateForPagination =
          [];
    }
    Get.find<EditProfileController>().getLawyerProfileCertificateModel =
        GetLawyerProfileCertificateModel.fromJson(response);

    Get.find<EditProfileController>().updateLawyerCertificateLoader(true);
    log("${Get.find<EditProfileController>().getLawyerProfileCertificateModel.data!.data!.length.toString()} Total Lawyer Appoinment History Length");

    log("${Get.find<EditProfileController>().getLawyerProfileCertificateModel.data!.data!} Only Data Lawyer Appoinment History");

    for (var element in Get.find<EditProfileController>()
        .getLawyerProfileCertificateModel
        .data!
        .data!) {
      Get.find<EditProfileController>()
          .updateLawyerCertificateForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<EditProfileController>().updateLawyerCertificateLoader(true);
  }
}
