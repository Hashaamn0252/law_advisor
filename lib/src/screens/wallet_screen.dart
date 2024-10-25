import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/wallet_controller.dart';
import 'package:lawyer_consultant_for_lawyers/src/repositories/get_wallet_transactions_repo.dart';
import 'package:lawyer_consultant_for_lawyers/src/screens/withdraw_amount_screen.dart';
import 'package:resize/resize.dart';
import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_settings_controller.dart';
import '../controllers/general_controller.dart';

import '../repositories/get_wallet_balance_repo.dart';
import '../repositories/get_wallet_withdrawals_repo.dart';
import '../routes.dart';

import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => WalletScreenState();
}

class WalletScreenState extends State<WalletScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  final walletLogic = Get.put(WalletController());

  bool isVisibleTransactionsHistory = true;

  @override
  void initState() {
    super.initState();
    // Get All Wallet Balance
    getMethod(context, getWalletBalanceURL, null, true, getWalletBalanceRepo);
    // Get All Wallet Transactions
    getMethod(context, getWalletTransactionURL, null, true,
        getWalletTransactionsRepo);
    // Get All Wallet Withdrawals
    getMethod(
        context, getWalletWithdrawalURL, null, true, getWalletWithdrawalsRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<WalletController>(builder: (walletController) {
        return !walletController.allWalletTransactionLoader
            ? CustomVerticalSkeletonLoader(
                height: 200.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                width: 140.w,
              )
            : Scaffold(
                backgroundColor: AppColors.white,
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientOne,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 18),
                            const Text(
                              "Available Amount",
                              style: AppTextStyles.bodyTextStyle5,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              Get.find<GetAllSettingsController>()
                                  .getDisplayAmount(int.parse(walletController
                                      .getWalletBalanceModel.data!)),
                              style: AppTextStyles.bodyTextStyle5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(36, 12, 36, 18),
                              child: ButtonWidgetOne(
                                borderRadius: 10,
                                buttonColor: AppColors.offWhite,
                                buttonText: 'Withdraw Amount',
                                buttonTextStyle: AppTextStyles.buttonTextStyle7,
                                onTap: () {
                                  Get.to(WithdrawAmountScreen());
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isVisibleTransactionsHistory == true
                              ? const Text(
                                  "Transactions History",
                                  style: AppTextStyles.headingTextStyle4,
                                )
                              : const Text(
                                  "Withdrawals History",
                                  style: AppTextStyles.headingTextStyle4,
                                ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: AppColors.primaryColor,
                              // minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (isVisibleTransactionsHistory == true) {
                                  isVisibleTransactionsHistory = false;
                                } else if (isVisibleTransactionsHistory ==
                                    false) {
                                  isVisibleTransactionsHistory = true;
                                }
                              });
                            },
                            child: Text(
                              isVisibleTransactionsHistory == true
                                  ? "Withdrawals"
                                  : "Transactions",
                              style: AppTextStyles.buttonTextStyle2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      isVisibleTransactionsHistory == true
                          ? walletController
                                  .walletTransactionForPagination.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: walletController
                                        .walletTransactionForPagination.length,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return
                                          // Dismissible(
                                          //   key: UniqueKey(),

                                          //   onDismissed:
                                          //       (DismissDirection direction) {
                                          //     if (direction ==
                                          //         DismissDirection.endToStart) {
                                          //       Get.toNamed(
                                          //           PageRoutes.paymentDetailScreen);
                                          //     } else if (direction ==
                                          //         DismissDirection.startToEnd) {
                                          //       // DismissDirection.none;
                                          //     }
                                          //   },
                                          // // Show a red background as the item is swiped away.
                                          // background: Container(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       12, 10, 12, 10),
                                          //   margin:
                                          //       const EdgeInsets.only(bottom: 18),
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(18),
                                          //     gradient: AppColors.gradientOne,
                                          //   ),
                                          //   child: Align(
                                          //     alignment:
                                          //         AlignmentDirectional.centerEnd,
                                          //     child: Image.asset(
                                          //         "assets/icons/View.png"),
                                          //   ),
                                          // ),

                                          // child:
                                          Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 17, 14, 17),
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        decoration: BoxDecoration(
                                          color: AppColors.offWhite,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${walletController.walletTransactionForPagination[index].id}",
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: Text(
                                                "${walletController.walletTransactionForPagination[index].type}",
                                                style: AppTextStyles
                                                    .bodyTextStyle1,
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Text(
                                              Get.find<
                                                      GetAllSettingsController>()
                                                  .getDisplayAmount(int.parse(
                                                      walletController
                                                          .walletTransactionForPagination[
                                                              index]
                                                          .amount!)),
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                            SizedBox(width: 12.w),
                                            Text(
                                              generalController.displayDate(
                                                  walletController
                                                      .walletTransactionForPagination[
                                                          index]
                                                      .createdAt),
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            )
                                          ],
                                        ),
                                        // ),
                                      );
                                    },
                                  ),
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 100.h, 0, 100.h),
                                  child: const Center(
                                    child: Text(
                                      "No Data Found",
                                      style: AppTextStyles.bodyTextStyle10,
                                    ),
                                  ),
                                )
                          : walletController
                                  .walletWithdrawalForPagination.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: walletController
                                        .walletWithdrawalForPagination.length,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return
                                          // Dismissible(
                                          // key: UniqueKey(),

                                          // onDismissed:
                                          //     (DismissDirection direction) {
                                          //   if (direction ==
                                          //       DismissDirection.endToStart) {
                                          //     Get.toNamed(
                                          //         PageRoutes.paymentDetailScreen);
                                          //   } else if (direction ==
                                          //       DismissDirection.startToEnd) {
                                          //     // DismissDirection.none;
                                          //   }
                                          // },
                                          // // Show a red background as the item is swiped away.
                                          // background: Container(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       12, 10, 12, 10),
                                          //   margin:
                                          //       const EdgeInsets.only(bottom: 18),
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(18),
                                          //     gradient: AppColors.gradientOne,
                                          //   ),
                                          //   child: Align(
                                          //     alignment:
                                          //         AlignmentDirectional.centerEnd,
                                          //     child: Image.asset(
                                          //         "assets/icons/View.png"),
                                          //   ),
                                          // ),

                                          // child:
                                          Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 17, 14, 17),
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        decoration: BoxDecoration(
                                          color: AppColors.offWhite,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${walletController.walletWithdrawalForPagination[index].id}",
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: Text(
                                                "${walletController.walletWithdrawalForPagination[index].additionalNote}",
                                                style: AppTextStyles
                                                    .bodyTextStyle1,
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Text(
                                              Get.find<
                                                      GetAllSettingsController>()
                                                  .getDisplayAmount(walletController
                                                      .walletWithdrawalForPagination[
                                                          index]
                                                      .amount!),
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                            SizedBox(width: 12.w),
                                            Text(
                                              generalController.displayDate(
                                                  walletController
                                                      .walletWithdrawalForPagination[
                                                          index]
                                                      .createdAt),
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            )
                                          ],
                                        ),
                                        // ),
                                      );
                                    },
                                  ),
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 100.h, 0, 100.h),
                                  child: const Center(
                                    child: Text(
                                      "No Data Found",
                                      style: AppTextStyles.bodyTextStyle10,
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),
              );
      });
    });
  }
}
