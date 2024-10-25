import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../controllers/contact_us_controller.dart';
import '../repositories/contact_us_repo.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final logic = Get.put(ContactUsController());

  final GlobalKey<FormState> contactUsFromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (contactUsController) {
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
              text: 'Contact Us',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
            child: Form(
              key: contactUsFromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("assets/images/contactus-banner.png"),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "Submit your Querries",
                    style: AppTextStyles.headingTextStyle4,
                  ),
                  const SizedBox(height: 18),
                  TextFormFieldWidget(
                    hintText: 'Name',
                    controller: contactUsController.nameController,
                    onChanged: (String? value) {
                      contactUsController.nameController.text == value;
                      contactUsController.update();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name Field Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormFieldWidget(
                    hintText: 'Email',
                    controller: contactUsController.emailController,
                    onChanged: (String? value) {
                      contactUsController.emailController.text == value;
                      contactUsController.update();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Field Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormFieldWidget(
                    hintText: 'Phone',
                    controller: contactUsController.phoneController,
                    onChanged: (String? value) {
                      contactUsController.phoneController.text == value;
                      contactUsController.update();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone Field Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    style: AppTextStyles.hintTextStyle1,

                    controller: contactUsController.messageController,
                    onChanged: (String? value) {
                      contactUsController.messageController.text == value;
                      contactUsController.update();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Message Field Required';
                      } else {
                        return null;
                      }
                    },
                    maxLines: 5,
                    // controller: controller,
                    decoration: InputDecoration(
                      hintText: "Message Here",
                      hintStyle: AppTextStyles.hintTextStyle1,
                      labelStyle: AppTextStyles.hintTextStyle1,
                      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonWidgetOne(
                      onTap: () {
                        postMethod(
                            context,
                            contactUsUrl,
                            {
                              'name': contactUsController.nameController.text,
                              'email': contactUsController.emailController.text,
                              'phone': contactUsController.phoneController.text,
                              'message':
                                  contactUsController.messageController.text
                            },
                            false,
                            contactUsRepo);
                      },
                      buttonText: "Submit",
                      buttonTextStyle: AppTextStyles.bodyTextStyle8,
                      borderRadius: 10,
                      buttonColor: AppColors.primaryColor),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
