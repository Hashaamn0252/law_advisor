import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/content_pages_model.dart';

class GetContentPagesController extends GetxController {
  GetContentPagesModel getContentPagesModel = GetContentPagesModel();

  bool getContentPagesLoader = false;
  updateContentPagesLoader(bool newValue) {
    getContentPagesLoader = newValue;
    update();
  }

  ///----app-bar-settings-----start
  ScrollController? scrollController;
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
}
