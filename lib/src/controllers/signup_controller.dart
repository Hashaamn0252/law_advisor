import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  String? emailValidator;
  String? passwordValidator;

  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
}
