import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../widgets/appbar_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
            text: 'About Us',
            style: AppTextStyles.appbarTextStyle2,
            children: <TextSpan>[],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/aboutus-banner.png"),
              ),
              const SizedBox(height: 18),
              const Text(
                "Join Us be a life saver for each others",
                style: AppTextStyles.bodyTextStyle8,
              ),
              const SizedBox(height: 18),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum",
                style: AppTextStyles.bodyTextStyle7,
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "1000+",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            "Lawyers",
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "5000+",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            "Users",
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "500+",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            "Law Companies",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "150+",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            "Event Organiser",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              // ButtonWidgetOne(
              //     onTap: () {},
              //     buttonText: "Meet the Lawyers",
              //     buttonTextStyle: AppTextStyles.bodyTextStyle8,
              //     borderRadius: 10,
              //     buttonColor: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
