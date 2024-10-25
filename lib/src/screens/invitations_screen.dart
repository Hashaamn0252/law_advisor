import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../widgets/appbar_widget.dart';

class InvitationsScreen extends StatelessWidget {
  const InvitationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
          richTextSpan: const TextSpan(
            text: 'Invitations',
            style: AppTextStyles.appbarTextStyle2,
            children: <TextSpan>[],
          ),
          leadingIcon: "assets/icons/Expand_left.png",
          leadingOnTap: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/Message_open.png",
                        color: AppColors.primaryColor,
                        height: 36.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Video Call from Jhon Doe",
                              textAlign: TextAlign.start,
                              style: AppTextStyles.bodyTextStyle10,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Sat, 7th April, 2023",
                              textAlign: TextAlign.start,
                              style: AppTextStyles.bodyTextStyle11,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/Check_round_fill.png",
                            height: 36.h,
                          ),
                          Image.asset(
                            "assets/icons/Close_round_fill.png",
                            height: 36.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
