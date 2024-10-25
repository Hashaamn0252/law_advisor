import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/config/app_configs.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_font.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/live_chat_controller.dart';
import '../repositories/live_chat_messages_repo.dart';
import '../widgets/appbar_widget.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final logic = Get.put(LiveChatController());
  PusherChannelsFlutter pusherChannels = PusherChannelsFlutter.getInstance();
  final _apiKey = AppConfigs.pusherAppKey;

  final _channelName =
      "private-chat-message.${Get.find<GeneralController>().selectedAppointmentHistoryForView.id}";
  final _eventName = "chat-message";

  String responseData = '';

  Map<String, dynamic> eventResponseMap = {};

  dynamic messageData = {};

  @override
  void initState() {
    super.initState();

    getMethod(
        context,
        "$getMessagesUrl${Get.find<GeneralController>().selectedAppointmentHistoryForView.id}",
        null,
        true,
        getLiveChatMessagesRepo);

    // Initialize Pusher Channel
    try {
      pusherChannels.init(
        apiKey: _apiKey,
        cluster: AppConfigs.pusherAppCluster,
        logToConsole: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent(
            PusherEvent(channelName: _channelName, eventName: _eventName)),
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onAuthorizer: onAuthorizer,
      );

      final myChannel = pusherChannels.subscribe(
          channelName: _channelName,
          onEvent: (event) {
            log("Got channel event: $event");
            PusherEvent eventTest = event;

            setState(() {
              responseData = eventTest.data.toString();
            });

            eventResponseMap = jsonDecode(responseData);

            Get.find<LiveChatController>()
                .updateMessageList(eventResponseMap["message"]);

            log("Got channel event messageData11: ${Get.find<LiveChatController>().messageList} 888");

            log("${Get.find<LiveChatController>().getLiveChatMessagesModel.data} 555");
          });
      pusherChannels.connect();
    } catch (e) {
      log("ERROR: $e");
    }
    log("${pusherChannels.channels.toString()} PUSHERDATA");
    log("${eventResponseMap['channel'].toString()} CHANNELNAME2");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    log("OnAuthorizer: $channelName OnAuthorizerSocket: $socketId");

    String calculateHMAC(String secret, String stringToSign) {
      final secretKey = utf8.encode(secret);
      final message = utf8.encode(stringToSign);
      final hmac = Hmac(sha256, secretKey);
      final digest = hmac.convert(message);
      final signature = digest.toString();
      return signature;
    }

    final secret = AppConfigs.pusherAppSecret;
    final stringToSign = '$socketId:$channelName';

    final signature = calculateHMAC(secret, stringToSign);

    final auth = '$_apiKey:$signature';

    print('auth = $auth');

    return {"auth": auth};
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    if (currentState == "CONNECTING" || currentState == "RECONNECTING") {
      Get.find<GeneralController>().updateCallLoaderController(true);
      log("Connecting Loader");
    } else if (currentState == "CONNECTED") {
      Get.find<GeneralController>().updateCallLoaderController(false);
      log("Connected Loader");
    }
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  onEvent(PusherEvent event) {
    log("onEvent: ${event.data}");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusherChannels.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  void onTriggerEventPressed() {
    pusherChannels
        .trigger(PusherEvent(channelName: _channelName, eventName: _eventName));
    log("TRIGGERSUCCESS");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LiveChatController>(builder: (liveChatController) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          inAsyncCall: generalController.callLoaderController,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: AppBarWidget(
                leadingIcon: 'assets/icons/Expand_left.png',
                leadingOnTap: () {
                  Get.back();
                  pusherChannels.unsubscribe(channelName: _channelName);
                  pusherChannels.disconnect();
                },
                richTextSpan: TextSpan(
                  text: generalController
                      .selectedAppointmentHistoryForView.customerName,
                  style: AppTextStyles.appbarTextStyle2,
                  children: const <TextSpan>[],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.w, 0, 5.w, 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: AppFont.primaryFontFamily,
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                      controller: liveChatController.messageController,
                      onTap: () {
                        Future.delayed(const Duration(seconds: 1)).whenComplete(
                            () => liveChatController.chatScrollController!
                                .animateTo(
                                    liveChatController.chatScrollController!
                                        .position.maxScrollExtent,
                                    curve: Curves.easeOut,
                                    duration:
                                        const Duration(milliseconds: 500)));
                      },
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        // if (_chatLogic.messageController.text.isEmpty) {
                        //   _chatLogic.updateShowSendIcon(false);
                        // } else {
                        //   _chatLogic.updateShowSendIcon(true);
                        // }
                      },
                      onFieldSubmitted: (value) {
                        // Get.find<GeneralController>()
                        //     .notificationRouteApp = null;
                        generalController.focusOut(context);
                        postMethod(
                            context,
                            sendMessageUrl,
                            {
                              'appointment_id': generalController
                                  .selectedAppointmentHistoryForView.id,
                              'attachment_file': null,
                              'message':
                                  liveChatController.messageController.text
                            },
                            true,
                            sendMessagesRepo);
                      },
                      // textDirection: generalController.isDirectionRTL(context) ? TextDirection.rtl : TextDirection.ltr,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        filled: true,
                        fillColor: AppColors.primaryColor,
                        hintText: 'Your Text Here.....',
                        // hintStyle: state.textFieldTextStyle,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                            borderSide: const BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  // _chatLogic.showSendIcon!
                  //     ?
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.w, 0, 0, 0),
                    child: InkWell(
                      onTap: () {
                        // Get.find<GeneralController>().notificationRouteApp = null;
                        generalController.focusOut(context);
                        postMethod(
                            context,
                            sendMessageUrl,
                            {
                              'appointment_id': generalController
                                  .selectedAppointmentHistoryForView.id,
                              'attachment_file': null,
                              'message':
                                  liveChatController.messageController.text
                            },
                            true,
                            sendMessagesRepo);
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.send,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                  // : const SizedBox()
                ],
              ),
            ),
            body: !liveChatController.getMessagesLoader
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                    child: liveChatController.messageList.isNotEmpty
                        ? ListView(
                            controller: liveChatController.chatScrollController,
                            children: List.generate(
                              liveChatController.messageList.length,
                              (index) {
                                return Align(
                                  alignment: liveChatController
                                                  .messageList[index]
                                              ["sender_id"] ==
                                          generalController
                                              .selectedAppointmentHistoryForView
                                              .lawyerId
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 8.h),
                                    padding: EdgeInsets.fromLTRB(
                                        10.w, 12.h, 10.w, 12.h),
                                    decoration: BoxDecoration(
                                        color: liveChatController
                                                        .messageList[index]
                                                    ["sender_id"] ==
                                                generalController
                                                    .selectedAppointmentHistoryForView
                                                    .lawyerId
                                            ? AppColors.primaryColor
                                            : AppColors.primaryColor
                                                .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${liveChatController.messageList[index]["message"]}",
                                          style: AppTextStyles.bodyTextStyle15,
                                        ),
                                        SizedBox(height: 6.h),
                                        Text(
                                          generalController.displayDateTime(
                                              "${liveChatController.messageList[index]["created_at"]}"),
                                          style: AppTextStyles.bodyTextStyle4,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(),
                  )
                : Container(),
          ),
        );
      });
    });
  }
}
