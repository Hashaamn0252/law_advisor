import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  // Basic Information Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool contactUsLoader = false;
  updateContactUsLoader(bool newValue) {
    contactUsLoader = newValue;
    update();
  }
}
