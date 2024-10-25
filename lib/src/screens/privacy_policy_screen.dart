import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/config/app_font.dart';
import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/content_pages_controller.dart';
import '../repositories/content_pages_repo.dart';
import '../widgets/appbar_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final logic = Get.put(GetContentPagesController());
  @override
  void initState() {
    super.initState();
    getMethod(
        context, "$contentPagesURL/privacy", null, false, getContentPagesRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetContentPagesController>(
        builder: (getContentPagesController) {
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
              text: 'Privacy Policy',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
          ),
        ),
        body: getContentPagesController.getContentPagesLoader
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(
                          data: getContentPagesController
                              .getContentPagesModel.data!.description,
                          style: {
                            "body": Style(
                              fontFamily: AppFont.primaryFontFamily,
                            ),
                          })
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
      );
    });
  }
}
