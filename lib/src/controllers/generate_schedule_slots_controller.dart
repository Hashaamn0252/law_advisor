import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateScheduleSlotsController extends GetxController {
  String? emailValidator;
  String? passwordValidator;

  TextEditingController videoCallFeeController = TextEditingController();
  TextEditingController videoCallIntervalController = TextEditingController();
  TextEditingController audioCallFeeController = TextEditingController();
  TextEditingController audioCallIntervalController = TextEditingController();
  TextEditingController liveChatFeeController = TextEditingController();
  // forSingleDay
  TextEditingController forSingleDayVideoCallFeeController =
      TextEditingController();
  TextEditingController forSingleDayVideoCallIntervalController =
      TextEditingController();
  TextEditingController forSingleDayAudioCallFeeController =
      TextEditingController();
  TextEditingController forSingleDayAudioCallIntervalController =
      TextEditingController();
  TextEditingController forSingleDayLiveChatFeeController =
      TextEditingController();

  bool generateScheduleSlotsLoader = false;
  updateGenerateScheduleSlotsLoader(bool newValue) {
    generateScheduleSlotsLoader = newValue;
    update();
  }
}
