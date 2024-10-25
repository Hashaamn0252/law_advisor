import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api_services/post_service.dart';
import '../../api_services/urls.dart';
import '../../controllers/general_controller.dart';
import 'get_agora_token_model.dart';

getAgoraTokenRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GeneralController>().getAgoraTokenModel =
        GetAgoraTokenModel.fromJson(response);
    if (Get.find<GeneralController>().getAgoraTokenModel.success == true) {
      Get.find<GeneralController>().updateFormLoaderController(false);
      Get.find<GeneralController>().updateCallerType(1);
      Get.find<GeneralController>().updateTokenForCall(
          Get.find<GeneralController>().getAgoraTokenModel.data!);
      if (Get.find<GeneralController>().goForCall!) {
        // Get.find<GeneralController>().updateTokenForCall(
        //     Get.find<GeneralController>().getAgoraTokenModel.data!);

        ///---make-notification
        Get.find<GeneralController>().updateNotificationBody(
            'CALLING.....',
            'Your ${Get.find<GeneralController>().storageBox.read('userRole')} is calling you',
            '/videoCall',
            '/mentee/appointment-log-detail/${Get.find<GeneralController>().appointmentIdForSendNotification}'
                '?auth_tocken=${Get.find<GeneralController>().getAgoraTokenModel.data!}'
                '&channel_name=${Get.find<GeneralController>().channelForCall}',
            'ring_ring');

        // getMethod(
        //     context,
        //     fcmGetUrl,
        //     {
        //       'token': '123',
        //       'user_id': Get.find<GeneralController>().userIdForSendNotification
        //     },
        //     true,
        //     getFcmTokenRepo);

        // Get.offNamed(PageRoutes.videoCallScreen);
      }
    } else {
      Get.find<GeneralController>().updateFormLoaderController(false);
    }
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

makeAgoraCallRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    // Get.find<GeneralController>().getAgoraTokenModel =
    //     GetAgoraTokenModel.fromJson(response);
    // if (Get.find<GeneralController>().getAgoraTokenModel.success == true) {
    //   Get.find<GeneralController>().updateFormLoaderController(false);
    //   Get.find<GeneralController>().updateCallerType(1);
    //   Get.find<GeneralController>().updateTokenForCall(
    //       Get.find<GeneralController>().getAgoraTokenModel.data!);
    //   if (Get.find<GeneralController>().goForCall!) {
    //     // Get.find<GeneralController>().updateTokenForCall(
    //     //     Get.find<GeneralController>().getAgoraTokenModel.data!);

    postMethod(
        context,
        sendCallNotification,
        {
          "title":
              "${Get.find<GeneralController>().appointmentObject!["appointment_type_name"]} from Lawyer",
          "body": "Please Join the Call",
          "deep_link":
              "${"/appointment_log/detail/${Get.find<GeneralController>().appointmentObject!["id"].toString()}"}?auth_tocken=${Get.find<GeneralController>().tokenForCall!}&channel_name=${Get.find<GeneralController>().channelForCall!}",
          "reciever_id":
              Get.find<GeneralController>().appointmentObject!["customer_id"],
          "payload": {
            "appointment": Get.find<GeneralController>().appointmentObject,
            "channel_name": Get.find<GeneralController>().channelForCall,
            "token": Get.find<GeneralController>().tokenForCall
          }
        },
        true,
        sendCallNotificationRepo);

    //     // getMethod(
    //     //     context,
    //     //     fcmGetUrl,
    //     //     {
    //     //       'token': '123',
    //     //       'user_id': Get.find<GeneralController>().userIdForSendNotification
    //     //     },
    //     //     true,
    //     //     getFcmTokenRepo);

    //     // Get.offNamed(PageRoutes.videoCallScreen);
    //   }
    // } else {
    //   Get.find<GeneralController>().updateFormLoaderController(false);
    // }
  } else if (!responseCheck) {
    log("$response RESPONSE");
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

sendCallNotificationRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    log("$response SEND NOTIFICATION RESPONSE");
    // Get.find<GeneralController>().getAgoraTokenModel =
    //     GetAgoraTokenModel.fromJson(response);
    // if (Get.find<GeneralController>().getAgoraTokenModel.success == true) {
    //   Get.find<GeneralController>().updateFormLoaderController(false);
    //   Get.find<GeneralController>().updateCallerType(1);
    //   Get.find<GeneralController>().updateTokenForCall(
    //       Get.find<GeneralController>().getAgoraTokenModel.data!);
    //   if (Get.find<GeneralController>().goForCall!) {
    //     // Get.find<GeneralController>().updateTokenForCall(
    //     //     Get.find<GeneralController>().getAgoraTokenModel.data!);

    ///---make-notification

    //     // getMethod(
    //     //     context,
    //     //     fcmGetUrl,
    //     //     {
    //     //       'token': '123',
    //     //       'user_id': Get.find<GeneralController>().userIdForSendNotification
    //     //     },
    //     //     true,
    //     //     getFcmTokenRepo);

    //     // Get.offNamed(PageRoutes.videoCallScreen);
    //   }
    // } else {
    //   Get.find<GeneralController>().updateFormLoaderController(false);
    // }
  } else if (!responseCheck) {
    log("$response NOT SEND NOTIFICATION RESPONSE");
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}
