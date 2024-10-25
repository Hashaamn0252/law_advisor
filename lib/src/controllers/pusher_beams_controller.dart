import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:lawyer_consultant_for_lawyers/src/controllers/pusher_payload_model.dart';
import 'package:pusher_beams/pusher_beams.dart';

import '../api_services/urls.dart';

import 'general_controller.dart';

class PusherBeamsController extends GetxController {
  GetPusherBeamsPayloadModel getPusherBeamsPayloadModel =
      GetPusherBeamsPayloadModel();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getSecure() async {
    final BeamsAuthProvider provider = BeamsAuthProvider()
      ..authUrl = '${apiBaseUrl}pusher/beams-auth'
      ..headers = {'Content-Type': 'application/json'}
      ..queryParams = {
        'user_id':
            Get.find<GeneralController>().storageBox.read('userID').toString()
      }
      ..credentials = 'omit';
    await PusherBeams.instance.setDeviceInterests([
      Get.find<GeneralController>().storageBox.read('userID').toString(),
      'debug-new'
    ]);
    await PusherBeams.instance.setUserId(
      Get.find<GeneralController>().storageBox.read('userID').toString(),
      provider,
      (error) => {
        if (error != null)
          {
            print("$error ERROR PUSHER"),
          }
        else
          {
            print("$error PUSHER2"),
          }

        // Success! Do something...
      },
    );
  }

  initPusherBeams() async {
    // Let's see our current interests
    await getSecure();

    log(await "${PusherBeams.instance.getDeviceInterests()} DEVICEINTEREST");

    // This is not intented to use in web
    if (!kIsWeb) {
      await PusherBeams.instance
          .onInterestChanges((interests) => {print('Interests: $interests')});

      await PusherBeams.instance
          .onMessageReceivedInTheForeground(_onMessageReceivedInTheForeground);
    }
    await _checkForInitialMessage();
  }

  Future<void> _checkForInitialMessage() async {
    final initialMessage = await PusherBeams.instance.getInitialMessage();
    if (initialMessage != null) {
      log(initialMessage.toString());
      // _showAlert(
      //   'Initial Message Is:',
      //   initialMessage.toString(),
      // );
    }
  }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    dynamic allData = data["data"];
    Map<String, dynamic> payload = jsonDecode(allData["payload"]);
    dynamic appointmentData = payload["appointment"];

    log("${jsonDecode(allData["payload"])} PAYLOAD");
    log("${appointmentData} APPOINTMENT");

    // Get.find<GeneralController>().channelForCall =
    //     payload["channel_name"].toString();
    // Get.find<GeneralController>().tokenForCall = payload["token"].toString();
    Get.find<GeneralController>().updateChannelForCall(payload["channel_name"]);
    Get.find<GeneralController>().updateTokenForCall(payload["token"]);
    // Get.find<GeneralController>()
    //     .updateCallerType(appointmentData["appointment_type_id"]);
    log("${appointmentData["lawyer_name"]} LAWYERNAME");
    log("${payload["channel_name"]} CHANNELNAME");

    if (Get.find<GeneralController>().storageBox.hasData('userData') &&
        Get.find<GeneralController>().storageBox.hasData('authToken')) {
      // Get.to(
      //     IncomingCallScreen(
      //       callAcceptOnTap:
      //           appointmentData["appointment_type_id"].toString() == "1"
      //               ? () {
      //                   // Get.to(VideoCall());
      //                   Get.toNamed(PageRoutes.videoCallScreen);
      //                 }
      //               : appointmentData["appointment_type_id"].toString() == "2"
      //                   ? () {
      //                       Get.toNamed(PageRoutes.audioCallScreen);
      //                     }
      //                   : () {},
      //       callRejectOnTap: () {
      //         Get.back();
      //       },
      //       callingUserName: appointmentData["lawyer_name"].toString(),
      //       image: '',
      //       incomingCallType:
      //           "Incoming ${appointmentData["appointment_type_name"]}",
      //     ),
      //     fullscreenDialog: true,
      //     transition: Transition.downToUp,
      //     duration: const Duration(milliseconds: 600));
    } else {
      log("Pusher Beams Call Notification is not Initialized");
    }
  }

  clearAllStatePusherBeams() async {
    await PusherBeams.instance.clearAllState();
    log("Pusher Beams States are cleared");
  }
}
