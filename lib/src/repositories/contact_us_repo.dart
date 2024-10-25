import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/contact_us_controller.dart';

contactUsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<ContactUsController>().updateContactUsLoader(true);
  } else if (!responseCheck) {
    Get.find<ContactUsController>().updateContactUsLoader(false);
  }
}
