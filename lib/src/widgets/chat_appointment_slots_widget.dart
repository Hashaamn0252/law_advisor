// Chat Appointment Slots Widget

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../controllers/all_settings_controller.dart';
import '../controllers/appoinment_commission_controller.dart';
import '../controllers/generate_schedule_slots_controller.dart';

import '../repositories/generate_appointment_schedule_slots_repo.dart';
import '../repositories/get_appointment_commission_repo.dart';
import 'button_widget.dart';

import 'text_form_field_widget.dart';

class ChatAppointmentSlotsWidget extends StatefulWidget {
  const ChatAppointmentSlotsWidget({super.key});

  @override
  State<ChatAppointmentSlotsWidget> createState() =>
      _ChatAppointmentSlotsWidgetState();
}

class _ChatAppointmentSlotsWidgetState
    extends State<ChatAppointmentSlotsWidget> {
  final logic = Get.put(GenerateScheduleSlotsController());
  dynamic totalFee = "";
  @override
  void initState() {
    super.initState();
    // Get Appointment Commission Data
    getMethod(
        context,
        "$getAppointmentScheduleCommissionUrl?appointment_type_id=3",
        null,
        true,
        getAppointmentCommissionRepo);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateScheduleSlotsController>(
        builder: (generateScheduleSlotsController) {
      return ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        inAsyncCall:
            generateScheduleSlotsController.generateScheduleSlotsLoader,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 14),
                      child: Text(
                        "Consultation Fee (${Get.find<GetAllSettingsController>().getDefaultCurrencySymbol()})",
                        style: AppTextStyles.bodyTextStyle10,
                      ),
                    ),
                    Get.find<GetAllSettingsController>()
                                .getAllSettingsModel
                                .data!
                                .commissionType ==
                            "commission_base"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText:
                                      'Enter Fees in ${Get.find<GetAllSettingsController>().getDefaultCurrencySymbol()}',
                                  validator: (value) {
                                    if ((value ?? "").isEmpty) {
                                      return 'Fee is Required';
                                    }
                                    return null;
                                  },
                                  controller: Get.find<
                                          GenerateScheduleSlotsController>()
                                      .liveChatFeeController,
                                  onChanged: (value) {
                                    if (Get.find<
                                                GetAppoinmentCommissionController>()
                                            .getAppointmentCommissionModel
                                            .data!
                                            .commissionType ==
                                        "fixed_rate") {
                                      setState(() {
                                        totalFee = int.parse(Get.find<
                                                    GenerateScheduleSlotsController>()
                                                .liveChatFeeController
                                                .text) +
                                            Get.find<
                                                    GetAppoinmentCommissionController>()
                                                .getAppointmentCommissionModel
                                                .data!
                                                .rate!;
                                      });
                                    } else if (Get.find<
                                                GetAppoinmentCommissionController>()
                                            .getAppointmentCommissionModel
                                            .data!
                                            .commissionType ==
                                        "percentage") {
                                      setState(() {
                                        totalFee = int.parse(Get.find<
                                                    GenerateScheduleSlotsController>()
                                                .liveChatFeeController
                                                .text) +
                                            int.parse(Get.find<
                                                        GenerateScheduleSlotsController>()
                                                    .liveChatFeeController
                                                    .text) /
                                                100 *
                                                Get.find<
                                                        GetAppoinmentCommissionController>()
                                                    .getAppointmentCommissionModel
                                                    .data!
                                                    .rate!;
                                      });
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 4.w),
                              const Text(
                                "+",
                                style: AppTextStyles.bodyTextStyle10,
                              ),
                              SizedBox(width: 4.w),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryColor)),
                                child: Text(
                                  Get.find<GetAppoinmentCommissionController>()
                                              .getAppointmentCommissionModel
                                              .data!
                                              .commissionType ==
                                          "percentage"
                                      ? "${Get.find<GetAppoinmentCommissionController>().getAppointmentCommissionModel.data!.rate} %"
                                      : "${Get.find<GetAppoinmentCommissionController>().getAppointmentCommissionModel.data!.rate}",
                                  style: AppTextStyles.hintTextStyle1,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              const Text(
                                "=",
                                style: AppTextStyles.bodyTextStyle10,
                              ),
                              SizedBox(width: 4.w),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryColor)),
                                child: Text(
                                  totalFee.toString().isEmpty
                                      ? "Total"
                                      : totalFee.toString(),
                                  style: AppTextStyles.hintTextStyle1,
                                ),
                              ),
                            ],
                          )
                        : Get.find<GetAllSettingsController>()
                                    .getAllSettingsModel
                                    .data!
                                    .commissionType ==
                                "subscription_base"
                            ? TextFormFieldWidget(
                                hintText:
                                    'Enter Fees in ${Get.find<GetAllSettingsController>().getDefaultCurrencySymbol()}',
                                validator: (value) {
                                  if ((value ?? "").isEmpty) {
                                    return 'Fee is Required';
                                  }
                                  return null;
                                },
                                controller:
                                    Get.find<GenerateScheduleSlotsController>()
                                        .liveChatFeeController,
                                onChanged: (value) {
                                  setState(() {
                                    totalFee = int.parse(Get.find<
                                            GenerateScheduleSlotsController>()
                                        .liveChatFeeController
                                        .text);
                                  });
                                },
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ButtonWidgetOne(
                            onTap: () {
                              generateScheduleSlotsController
                                  .updateGenerateScheduleSlotsLoader(true);
                              postMethod(
                                  context,
                                  generateAppointmentScheduleSlotsUrl,
                                  {
                                    "appointment_type_id": 3,
                                    "is_schedule_required": 0,
                                    "appointment_type": "chat",
                                    "fee": totalFee,
                                  },
                                  true,
                                  generateAppointmentScheduleSlotsRepo);
                            },
                            buttonText: "Save",
                            buttonTextStyle: AppTextStyles.bodyTextStyle8,
                            borderRadius: 10,
                            buttonColor: AppColors.primaryColor),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ButtonWidgetOne(
                            onTap: () {},
                            buttonText: "Reset",
                            buttonTextStyle: AppTextStyles.bodyTextStyle8,
                            borderRadius: 10,
                            buttonColor: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
