import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/lawyer_appointment_history_model.dart';
import 'general_controller.dart';

class LawyerAppointmentHistoryController extends GetxController {
  GetLawyerAppointmentHistoryModel getLawyerAppointmentHistoryModel =
      GetLawyerAppointmentHistoryModel();

  bool allLawyerAppointmentHistoryLoader = false;
  updateLawyerAppointmentHistoryLoader(bool newValue) {
    allLawyerAppointmentHistoryLoader = newValue;
    update();
  }

  String? selectedLawyerCategory;
  // LawyerModel selectedLawyerForView = LawyerModel();
  GetLawyerAppointmentHistoryDataModel getLawyerAppointmentHistoryDataModel =
      GetLawyerAppointmentHistoryDataModel();

  List<LawyerAppointmentHistoryModel>
      lawyerAllAppointmentHistoryListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getLawyerAppointmentHistoryDataCheck = false;
  getLawyerAppointmentHistorysDataCheck(bool value) {
    getLawyerAppointmentHistoryDataCheck = value;
    update();
  }

  int? selectedLawyerCategoryIndex = 0;
  updateSelectedLawyerCategoryIndex(int? newValue) {
    selectedLawyerCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerAppointmentHistoryModel.data!.meta!.lastPage! >
        getLawyerAppointmentHistoryModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      // postMethod(
      //     context,
      //     '${getLawyerAppointmentHistoryModel.data!.meta!.path}',
      //     {
      //       'page':
      //           (getLawyerAppointmentHistoryModel.data!.meta!.currentPage! +
      //               1),
      //       'perPage': getLawyerAppointmentHistoryModel.data!.meta!.perPage
      //     },
      //     false,
      //     getAllLawyersRepo);
      update();
    }
  }

  updateLawyerListForPagination(
      LawyerAppointmentHistoryModel lawyerAppointmentHistoryModel) {
    lawyerAllAppointmentHistoryListForPagination
        .add(lawyerAppointmentHistoryModel);
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
