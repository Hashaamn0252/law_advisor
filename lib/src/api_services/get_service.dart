import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio_instance;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/api_services/header.dart';
import 'package:lawyer_consultant_for_lawyers/src/api_services/logic.dart';

import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../widgets/custom_dialog.dart';

getMethod(BuildContext context, String apiUrl, dynamic queryData,
    bool addAuthHeader, Function executionMethod) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  if (addAuthHeader &&
      Get.find<GeneralController>().storageBox.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<GeneralController>().storageBox.read('authToken')}');
    setCustomHeader(dio, 'logged-in-as', 'lawyer');
  }
  log('Get Method Api $apiUrl ---->>>>');
  log('queryData $queryData ---->>>>');
  log('Get Token ${Get.find<GeneralController>().storageBox.read('authToken')}} ---->>>>');

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      Get.find<ApiController>().changeInternetCheckerState(true);
      try {
        response = await dio.get(apiUrl, queryParameters: queryData);

        if (response.statusCode == 200) {
          log('getApi $apiUrl ---->>>>  ${response.data}');
          executionMethod(context, true, response.data);
          return;
        }
        log('getApi $apiUrl ---->>>>  ${response.data}');
        executionMethod(context, false, response.data);
      } on dio_instance.DioError catch (e) {
        log('Dio Error     $apiUrl $queryData ---->>>>${e.response}');
        executionMethod(context, false, e.response!.data);

        if (e.response != null) {
        } else {}
      }
    }
  } on SocketException catch (_) {
    Get.find<GeneralController>().updateFormLoaderController(false);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Please Try Again",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Internet Not Connected!',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
    Get.find<ApiController>().changeInternetCheckerState(false);
  }
}
