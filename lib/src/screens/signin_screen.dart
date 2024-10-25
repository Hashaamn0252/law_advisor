import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/signin_controller.dart';
import '../repositories/signin_repo.dart';
import '../routes.dart';
import '../widgets/auth_text_form_field_widget.dart';
import '../widgets/button_widget.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final logic = Get.put(SigninController());

  bool boolValue = false;
  bool obscurePassword = true;

  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GestureDetector(onTap: () {
        generalController.focusOut(context);
      }, child: GetBuilder<SigninController>(builder: (signInController) {
        return ModalProgressHUD(
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
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/law-hammer.png"),
                        const SizedBox(height: 28),
                        const Text(
                          "Welcome Back",
                          style: AppTextStyles.bodyTextStyle8,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Sign in to your account",
                          style: AppTextStyles.bodyTextStyle1,
                        ),
                        const SizedBox(height: 28),
                        AuthTextFormFieldWidget(
                          hintText: 'Username / Email',
                          prefixIconColor: AppColors.primaryColor,
                          prefixIcon: "assets/icons/Message.png",
                          controller: signInController.emailController,
                          onChanged: (String value) {},
                          validator: (String? value) {},
                        ),
                        const SizedBox(height: 16),
                        AuthPasswordFormFieldWidget(
                          hintText: 'Password',
                          prefixIconColor: AppColors.primaryColor,
                          prefixIcon: "assets/icons/Unlock.png",
                          controller: signInController.passwordController,
                          onChanged: (String value) {},
                          validator: (String? value) {},
                          suffixIconOnTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          suffixIcon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20.h,
                            color: AppColors.lightGrey,
                          ),
                          obsecureText: obscurePassword,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: boolValue,
                            //       tristate: false,
                            //       activeColor: AppColors.primaryColor,
                            //       visualDensity: const VisualDensity(
                            //           horizontal: -2, vertical: 2),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(5)),
                            //       side: const BorderSide(
                            //           color: AppColors.primaryColor),
                            //       onChanged: (bool? boolValue) {
                            //         // setState(() {
                            //         //   this.boolValue = boolValue!;
                            //         // });
                            //       },
                            //     ),
                            //     Text(
                            //       "Remember",
                            //       style: AppTextStyles.bodyTextStyle11,
                            //     )
                            //   ],
                            // ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(PageRoutes.forgotPasswordScreen);
                              },
                              child: const Text(
                                "Forgot Password",
                                style: AppTextStyles.buttonTextStyle3,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ButtonWidgetOne(
                          borderRadius: 10,
                          buttonColor: AppColors.primaryColor,
                          buttonText: 'Login',
                          buttonTextStyle: AppTextStyles.buttonTextStyle1,
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              generalController.focusOut(context);
                              generalController
                                  .updateFormLoaderController(true);
                              postMethod(
                                  context,
                                  signInWithEmailURL,
                                  {
                                    'email':
                                        signInController.emailController.text,
                                    'password': signInController
                                        .passwordController.text,
                                    'login_as': "lawyer"
                                  },
                                  true,
                                  signInWithEmailRepo);
                            }
                          },
                        ),
                        const SizedBox(height: 28),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(PageRoutes.signupScreen);
                          },
                          child: const Text("Create an account",
                              style: AppTextStyles.underlineTextStyle1),
                        ),
                        const SizedBox(height: 18),
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
                            signInController.signInWithGoogle();
                          },
                        ),
                        SizedBox(height: 14.h),
                        ButtonWidgetThree(
                          buttonIcon: "assets/icons/Facebook.png",
                          buttonText: "Login Via Facebook",
                          iconHeight: 25.h,
                          onTap: () {
                            signInController.signinWithFacebook();
                          },
                        ),
                        SizedBox(height: 18.h),
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
