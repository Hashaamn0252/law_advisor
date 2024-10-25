import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/wallet_controller.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/withdraw_amount_controller.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../repositories/withdraw_amount_repo.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class WithdrawAmountScreen extends StatefulWidget {
  const WithdrawAmountScreen({super.key});

  @override
  State<WithdrawAmountScreen> createState() => _WithdrawAmountScreenState();
}

class _WithdrawAmountScreenState extends State<WithdrawAmountScreen> {
  final withdrawAmountLogic = Get.put(WithdrawAmountController());
  dynamic selectedPaymentGateway;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarWidget(
            leadingIcon: 'assets/icons/Expand_left.png',
            leadingOnTap: () {
              Get.back();
            },
            richTextSpan: const TextSpan(
              text: 'Withdraw Amount',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose your Payment Method",
                style: AppTextStyles.headingTextStyle4,
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Amount',
                controller:
                    Get.find<WithdrawAmountController>().amountController,
                onChanged: (String? value) {
                  Get.find<WithdrawAmountController>().amountController.text ==
                      value;
                  Get.find<WithdrawAmountController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Amount Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Account Holder',
                controller: Get.find<WithdrawAmountController>()
                    .accountHolderController,
                onChanged: (String? value) {
                  Get.find<WithdrawAmountController>()
                          .accountHolderController
                          .text ==
                      value;
                  Get.find<WithdrawAmountController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Account Holder Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Account Number',
                controller: Get.find<WithdrawAmountController>()
                    .accountNumberController,
                onChanged: (String? value) {
                  Get.find<WithdrawAmountController>()
                          .accountNumberController
                          .text ==
                      value;
                  Get.find<WithdrawAmountController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Account Number Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Bank',
                controller: Get.find<WithdrawAmountController>().bankController,
                onChanged: (String? value) {
                  Get.find<WithdrawAmountController>().bankController.text ==
                      value;
                  Get.find<WithdrawAmountController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bank Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Addiotional Notes',
                controller: Get.find<WithdrawAmountController>()
                    .additionalNotesController,
                onChanged: (String? value) {
                  Get.find<WithdrawAmountController>()
                          .additionalNotesController
                          .text ==
                      value;
                  Get.find<WithdrawAmountController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Addiotional Notes Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              ButtonWidgetOne(
                  onTap: () {
                    postMethod(
                        context,
                        withdrawAmountURL,
                        {
                          "amount": int.parse(
                              Get.find<WithdrawAmountController>()
                                  .amountController
                                  .text),
                          "account_holder": Get.find<WithdrawAmountController>()
                              .accountHolderController
                              .text,
                          "account_number": Get.find<WithdrawAmountController>()
                              .accountNumberController
                              .text,
                          "bank": Get.find<WithdrawAmountController>()
                              .bankController
                              .text,
                          "additional_note":
                              Get.find<WithdrawAmountController>()
                                  .additionalNotesController
                                  .text,
                        },
                        true,
                        withdrawAmountRepo);
                  },
                  buttonText: "Withdraw Amount",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ));
  }
}
