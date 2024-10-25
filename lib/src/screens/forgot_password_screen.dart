import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/general_controller.dart';
import '../repositories/forgot_password_repo.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/auth_text_form_field_widget.dart';
import '../widgets/button_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final logic = Get.put(ForgotPasswordController());

  bool boolValue = false;
  bool obscurePassword = true;

  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GestureDetector(onTap: () {
        generalController.focusOut(context);
      }, child: GetBuilder<ForgotPasswordController>(
          builder: (forgotPasswordController) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            inAsyncCall: generalController.formLoaderController,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: AppBarWidget(
                  leadingIcon: 'assets/icons/Expand_left.png',
                  leadingOnTap: () {
                    Get.back();
                  },
                  richTextSpan: const TextSpan(
                    text: 'Forgot Password',
                    style: AppTextStyles.appbarTextStyle2,
                    children: <TextSpan>[],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 58, 18, 0),
                  child: Form(
                    key: _forgotPasswordFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 28),
                        const Text(
                          "Forgot your password?",
                          style: AppTextStyles.bodyTextStyle8,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Sign up now and start find the best lawyers. we're excited to welcome you to our community!",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyTextStyle1,
                        ),
                        const SizedBox(height: 28),
                        AuthTextFormFieldWidget(
                          hintText: 'Email',
                          prefixIconColor: AppColors.primaryColor,
                          prefixIcon: "assets/icons/Message.png",
                          controller: forgotPasswordController.emailController,
                          onChanged: (value) {
                            forgotPasswordController.emailValidator = null;
                            forgotPasswordController.update();
                          },
                          validator: (value) {
                            if ((value ?? "").isEmpty) {
                              return 'Email is Required';
                            }
                            if (!GetUtils.isEmail(value!)) {
                              return 'Please make sure your email address is valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        ButtonWidgetOne(
                          borderRadius: 10,
                          buttonColor: AppColors.primaryColor,
                          buttonText: 'Submit',
                          buttonTextStyle: AppTextStyles.buttonTextStyle1,
                          onTap: () {
                            if (_forgotPasswordFormKey.currentState!
                                .validate()) {
                              generalController.focusOut(context);
                              generalController
                                  .updateFormLoaderController(true);
                              postMethod(
                                  context,
                                  forgotPasswordUrl,
                                  {
                                    'email': forgotPasswordController
                                        .emailController.text,
                                  },
                                  false,
                                  forgotPasswordRepo);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }));
    });
  }
}
