import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/appointment_schedules_model.dart';

class GetAppoinmentSchedulesController extends GetxController {
  GetAppointmentSchedulesModel getAppointmentSchedulesModel =
      GetAppointmentSchedulesModel();

  bool getAppointmentSchedulesLoader = false;
  updateAppointmentSchedulesLoader(bool newValue) {
    getAppointmentSchedulesLoader = newValue;
    update();
  }

  List<String> selectedDays = [];
  // Data getAppointmentSchedulesDataModel = Data();

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
