import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/wallet_controller.dart';
import 'package:lawyer_consultant_for_lawyers/src/models/get_wallet_withdrawals_model.dart';

import '../controllers/general_controller.dart';

getWalletWithdrawalsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<WalletController>().walletWithdrawalForPagination.isNotEmpty) {
      Get.find<WalletController>().walletWithdrawalForPagination = [];
    }
    Get.find<WalletController>().getWalletWithdrawalsModel =
        GetWalletWithdrawalsModel.fromJson(response);

    Get.find<WalletController>().updateWalletWithdrawalLoader(true);
    log("${Get.find<WalletController>().getWalletWithdrawalsModel.data!.data!.length.toString()} Total Lawyer Wallet Withdrawals Length");

    log("${Get.find<WalletController>().getWalletWithdrawalsModel.data!.data!} Only Data Lawyer Wallet Withdrawals History");

    for (var element
        in Get.find<WalletController>().getWalletWithdrawalsModel.data!.data!) {
      Get.find<WalletController>()
          .updateWalletWithdrawalsForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<WalletController>().updateWalletWithdrawalLoader(true);
  }
}
