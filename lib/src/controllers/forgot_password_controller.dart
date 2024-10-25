import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  String? emailValidator;

  final GlobalKey<FormState> _forgotPasswordFromKey = GlobalKey();
  GlobalKey<FormState> get forgotPasswordFromKey => _forgotPasswordFromKey;

  TextEditingController emailController = TextEditingController();
}
