import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawAmountController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();

  bool withdrawAmountLoader = false;
  updateWithdrawAmountLoader(bool newValue) {
    withdrawAmountLoader = newValue;
    update();
  }
}
