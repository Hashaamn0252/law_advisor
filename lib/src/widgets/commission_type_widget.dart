import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_text_styles.dart';
import '../controllers/all_settings_controller.dart';
import '../controllers/general_controller.dart';

class CommissionTypeWidget extends StatelessWidget {
  final Widget moduleView;
  final String moduleName;

  CommissionTypeWidget({required this.moduleView, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<GetAllSettingsController>();
    final commissionType =
        settingsController.getAllSettingsModel.data!.commissionType;
    final lawyerModules = Get.find<GeneralController>().lawyerModules;

    // if (commissionType == 'subscription_base') {
    // if (lawyerModules!.contains(moduleName)) {
    //   return moduleView; // Return the provided module view if the condition is met
    // } else {
    //   return const SizedBox(
    //     child: Center(
    //       child: Text(
    //         "This feature is not available in the selected pricing plan.",
    //         textAlign: TextAlign.center,
    //         style: AppTextStyles
    //             .bodyTextStyle10, // Assuming you have defined this style
    //       ),
    //     ),
    //   );
    // }
    // } else {
    return moduleView; // Return the provided module view if commission type is not commission base
    // }
  }
}
