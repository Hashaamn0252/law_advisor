import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/get_live_chat_messages_model.dart';

class LiveChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  bool getMessagesLoader = true;

  updateGetMessagesLoader(bool newValue) {
    getMessagesLoader = newValue;
    update();
  }

  // final ScrollController messageScrollController = ScrollController();
  List<dynamic> messageList = [];
  updateMessageList(newValue) {
    messageList.add(newValue);
    update();
  }

  emptyMessageList() {
    messageList = [];
    update();
  }

  bool? showSendIcon = false;
  updateShowSendIcon(bool? newValue) {
    showSendIcon = newValue;
    update();
  }

  int? senderMessageGetId;

  updateSenderMessageGetId(int? newValue) {
    senderMessageGetId = newValue;
    update();
  }

  int? receiverMessageGetId;

  updateReceiverMessageGetId(int? newValue) {
    receiverMessageGetId = newValue;
    update();
  }

  GetLiveChatMessagesModel getLiveChatMessagesModel =
      GetLiveChatMessagesModel();
  GetLiveChatMessagesDataModel? getLiveChatMessagesDataModel =
      GetLiveChatMessagesDataModel();

  ScrollController? scrollController;
  ScrollController? chatScrollController;
  bool lastStatus = true;
  double height = 100.h;

  bool get isShrink {
    return scrollController!.hasClients &&
        scrollController!.offset > (height - kToolbarHeight);
  }

  void scrollListener() {
    if (isShrink != lastStatus) {
      lastStatus = isShrink;
      update();
    }
  }

  String? userName;
  String? userEmail;
  String? userImage;
}
