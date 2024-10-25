import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/signin_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/signup_controller.dart';
import '../repositories/signup_repo.dart';
import '../routes.dart';
import '../widgets/auth_text_form_field_widget.dart';
import '../widgets/button_widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final logic = Get.put(SignUpController());

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final GlobalKey<FormState> _signUpFromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<SignUpController>(builder: (signUpController) {
        return GestureDetector(
            onTap: () {
              generalController.focusOut(context);
            },
            child: ModalProgressHUD(
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                inAsyncCall: generalController.formLoaderController,
                child: Scaffold(
                  backgroundColor: AppColors.offWhite,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 58, 18, 0),
                      child: Form(
                        key: _signUpFromKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/law-hammer.png"),
                            const SizedBox(height: 28),
                            const Text(
                              "Create an Account",
                              style: AppTextStyles.bodyTextStyle8,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Create an account as a lawyer",
                              style: AppTextStyles.bodyTextStyle1,
                            ),
                            const SizedBox(height: 28),
                            AuthTextFormFieldWidget(
                              hintText: 'First Name',
                              prefixIconColor: AppColors.primaryColor,
                              prefixIcon: "assets/icons/User.png",
                              controller:
                                  signUpController.signUpFirstNameController,
                              validator: (value) {
                                if ((value ?? "").isEmpty) {
                                  return 'Field Required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            AuthTextFormFieldWidget(
                              hintText: 'Last Name',
                              prefixIconColor: AppColors.primaryColor,
                              prefixIcon: "assets/icons/User.png",
                              controller:
                                  signUpController.signUpLastNameController,
                              validator: (value) {
                                if ((value ?? "").isEmpty) {
                                  return 'Field Required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            AuthTextFormFieldWidget(
                              hintText: 'Email',
                              prefixIconColor: AppColors.primaryColor,
                              prefixIcon: "assets/icons/Message.png",
                              controller:
                                  signUpController.signUpEmailController,
                              errorText: signUpController.emailValidator,
                              onChanged: (value) {
                                signUpController.emailValidator = null;
                                signUpController.update();
                              },
                              validator: (value) {
                                if ((value ?? "").isEmpty) {
                                  return 'Field Required';
                                }
                                if (!GetUtils.isEmail(value!)) {
                                  return 'Please make sure your email address is valid';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordFormFieldWidget(
                              hintText: 'Password',
                              prefixIconColor: AppColors.primaryColor,
                              prefixIcon: "assets/icons/Unlock.png",
                              errorText: signUpController.passwordValidator,
                              controller:
                                  signUpController.signUpPasswordController,
                              onChanged: (value) {
                                signUpController.passwordValidator = null;
                                signUpController.update();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required";
                                } else if (value.length < 8) {
                                  return 'Password must contains 8 digit';
                                }
                                return null;
                              },
                              suffixIcon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: AppColors.lightGrey,
                              ),
                              suffixIconOnTap: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              obsecureText: obscurePassword,
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordFormFieldWidget(
                              hintText: 'Confirm Password',
                              prefixIconColor: AppColors.primaryColor,
                              prefixIcon: "assets/icons/Unlock.png",
                              errorText: signUpController.passwordValidator,
                              controller: signUpController
                                  .signUpConfirmPasswordController,
                              onChanged: (value) {
                                signUpController.passwordValidator = null;
                                signUpController.update();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required";
                                } else if (signUpController
                                        .signUpPasswordController.text !=
                                    signUpController
                                        .signUpConfirmPasswordController.text) {
                                  return 'Password does\'nt match';
                                }
                                return null;
                              },
                              suffixIcon: Icon(
                                obscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: AppColors.lightGrey,
                              ),
                              suffixIconOnTap: () {
                                setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                });
                              },
                              obsecureText: obscureConfirmPassword,
                            ),
                            const SizedBox(height: 16),
                            ButtonWidgetOne(
                              borderRadius: 10,
                              buttonColor: AppColors.primaryColor,
                              buttonText: 'Signup',
                              buttonTextStyle: AppTextStyles.buttonTextStyle1,
                              onTap: () {
                                ///---keyboard-close
                                // FocusScopeNode currentFocus =
                                //     FocusScope.of(context);
                                // if (!currentFocus.hasPrimaryFocus) {
                                //   currentFocus.unfocus();
                                // }

                                ///
                                if (_signUpFromKey.currentState!.validate()) {
                                  ///loader
                                  // generalController.changeLoaderCheck(true);
                                  generalController
                                      .updateFormLoaderController(true);
                                  signUpController.emailValidator = null;
                                  signUpController.passwordValidator = null;
                                  signUpController.update();
                                  generalController.focusOut(context);

                                  ///post-method
                                  postMethod(
                                      context,
                                      signUpWithEmailURL,
                                      {
                                        'email': signUpController
                                            .signUpEmailController.text,
                                        'first_name': signUpController
                                            .signUpFirstNameController.text,
                                        'last_name': signUpController
                                            .signUpLastNameController.text,
                                        'password': signUpController
                                            .signUpPasswordController.text,
                                        'password_confirmation':
                                            signUpController
                                                .signUpConfirmPasswordController
                                                .text,
                                        'login_as': "lawyer",
                                      },
                                      true,
                                      signUpWithEmailRepo);
                                }
                              },
                            ),
                            const SizedBox(height: 28),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(PageRoutes.signinScreen);
                              },
                              child: const Text(
                                  "Have already account please sign in",
                                  style: AppTextStyles.underlineTextStyle1),
                            ),
                            SizedBox(height: 18.h),
                            Row(
                              children: const [
                                Expanded(child: Divider(color: AppColors.grey)),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Or",
                                      style: AppTextStyles.bodyTextStyle7,
                                    ),
                                  ),
                                ),
                                Expanded(child: Divider(color: AppColors.grey)),
                              ],
                            ),
                            SizedBox(height: 18.h),
                            ButtonWidgetThree(
                              buttonIcon: "assets/icons/Google.png",
                              buttonText: "Login Via Google",
                              iconHeight: 25.h,
                              onTap: () {
                                Get.find<SigninController>().signInWithGoogle();
                              },
                            ),
                            SizedBox(height: 14.h),
                            ButtonWidgetThree(
                              buttonIcon: "assets/icons/Facebook.png",
                              buttonText: "Login Via Facebook",
                              iconHeight: 25.h,
                              onTap: () {
                                Get.find<SigninController>()
                                    .signinWithFacebook();
                              },
                            ),
                            SizedBox(height: 18.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
      });
    });
  }
}
