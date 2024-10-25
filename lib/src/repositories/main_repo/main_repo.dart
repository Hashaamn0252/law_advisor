// import 'dart:developer';

// import 'package:lawyer_consultant/src/controller/general_controller.dart';
// import 'package:lawyer_consultant/src/modules/main_repo/get_config_credential_model.dart';
// import 'package:lawyer_consultant/src/modules/main_repo/get_general_setting_model.dart';
// import 'package:lawyer_consultant/src/modules/main_repo/main_logic.dart';
// import 'package:lawyer_consultant/src/modules/main_repo/terms_condition_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// /// repo for Get Config Credential

// getConfigCredentialRepo(
//     BuildContext context, bool responseCheck, Map<String, dynamic> response) {
//   if (responseCheck) {
//     Get.put(MainLogic());
//     Get.find<MainLogic>().getConfigCredentialModel =
//         GetConfigCredentialModel.fromJson(response);
//     if (Get.find<MainLogic>().getConfigCredentialModel.success == true) {
//       Get.find<GeneralController>().updateFormLoaderController(false);
//     } else {
//       Get.find<GeneralController>().updateFormLoaderController(false);
//     }
//   } else if (!responseCheck) {
//     Get.find<GeneralController>().updateFormLoaderController(false);
//   }
// }

// /// repo  Get General Setting

// getGeneralSettingRepo(
//     BuildContext context, bool responseCheck, Map<String, dynamic> response) {
//   if (responseCheck) {
//     Get.put(MainLogic());
//     Get.find<MainLogic>().getGeneralSettingModel =
//         GetGeneralSettingModel.fromJson(response);
//     if (Get.find<MainLogic>().getConfigCredentialModel.success == true) {
//       Get.find<GeneralController>().storageBox.write('loginType',
//           Get.find<MainLogic>().getGeneralSettingModel.data!.loginType);
//       Get.find<GeneralController>().storageBox.write('currency',
//           Get.find<MainLogic>().getGeneralSettingModel.data!.currencySymbol);
//       log("My save Currency------->>${Get.find<GeneralController>().storageBox.read('currency')}");

//       Get.find<GeneralController>().updateFormLoaderController(false);
//     } else {
//       Get.find<GeneralController>().updateFormLoaderController(false);
//     }
//   } else if (!responseCheck) {
//     Get.find<GeneralController>().updateFormLoaderController(false);
//   }
// }

// /// repo  Get Terms and Conditions

// getTermsConditionsRepo(
//     BuildContext context, bool responseCheck, Map<String, dynamic> response) {
//   if (responseCheck) {
//     Get.put(MainLogic());
//     Get.find<MainLogic>().termsConditionModel =
//         TermsConditionModel.fromJson(response);
//     if (Get.find<MainLogic>().termsConditionModel.success == true) {
//       Get.find<GeneralController>().updateFormLoaderController(false);
//     } else {
//       Get.find<GeneralController>().updateFormLoaderController(false);
//     }
//   } else if (!responseCheck) {
//     Get.find<GeneralController>().updateFormLoaderController(false);
//   }
// }
