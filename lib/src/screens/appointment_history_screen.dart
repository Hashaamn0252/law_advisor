import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/lawyer_appointment_history_controller.dart';
import '../controllers/general_controller.dart';
import '../models/lawyer_appointment_history_model.dart';
import '../repositories/lawyer_appointment_history_repo.dart';
import '../routes.dart';

import '../widgets/custom_skeleton_loader.dart';

class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  State<AppointmentHistoryScreen> createState() =>
      _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  final logic = Get.put(LawyerAppointmentHistoryController());

  List<LawyerAppointmentHistoryModel>? pendingList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pullRefresh() async {
    getMethod(context, "$getLawyerAppointmentHistory?page=1", null, true,
        getAllLawyerAppointmentHistoryRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyerAppointmentHistoryController>(
        builder: (lawyerAppointmentHistoryController) {
      return GetBuilder<GeneralController>(builder: (generalController) {
        return DefaultTabController(
          length: 4, // length of tabs
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Theme(
                    data: ThemeData()
                        .copyWith(dividerColor: AppColors.primaryColor),
                    child: TabBar(
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.secondaryColor,
                      // dividerColor: AppColors.primaryColor,
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                      indicatorPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: AppTextStyles.buttonTextStyle2,
                      unselectedLabelStyle: AppTextStyles.buttonTextStyle7,

                      indicator: BoxDecoration(
                          gradient: AppColors.gradientOne,
                          borderRadius: BorderRadius.circular(10)),
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Pending'),
                        Tab(text: 'Accepted'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                  ),
                  !lawyerAppointmentHistoryController
                          .allLawyerAppointmentHistoryLoader
                      ? Expanded(
                          child: CustomVerticalSkeletonLoader(
                            height: 200.h,
                            highlightColor: AppColors.grey,
                            seconds: 2,
                            totalCount: 5,
                            width: 140.w,
                          ),
                        )
                      : Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1))),
                            child: TabBarView(children: <Widget>[
                              // All Appointment History
                              lawyerAppointmentHistoryController
                                      .lawyerAllAppointmentHistoryListForPagination
                                      .isNotEmpty
                                  ? RefreshIndicator(
                                      onRefresh: _pullRefresh,
                                      color: AppColors.primaryColor,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:
                                            lawyerAppointmentHistoryController
                                                .lawyerAllAppointmentHistoryListForPagination
                                                .length,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 18),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                18, 0, 18, 18),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12, 12, 12, 12),
                                                  // margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.offWhite,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          lawyerAppointmentHistoryController
                                                                      .lawyerAllAppointmentHistoryListForPagination[
                                                                          index]
                                                                      .customerImage ==
                                                                  null
                                                              ? ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8
                                                                              .r),
                                                                  child: Image
                                                                      .asset(
                                                                    scale: 4.h,
                                                                    'assets/images/lawyer-image.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    height:
                                                                        110.h,
                                                                    width:
                                                                        120.w,
                                                                  ))
                                                              : ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.r),
                                                                  child: Image
                                                                      .network(
                                                                    scale: 4.h,
                                                                    '$mediaUrl${lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].customerImage!}',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    height:
                                                                        110.h,
                                                                    width:
                                                                        120.w,
                                                                  ),
                                                                ),
                                                          SizedBox(
                                                            width: 12.w,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        // "Jhon Doe",
                                                                        lawyerAppointmentHistoryController
                                                                            .lawyerAllAppointmentHistoryListForPagination[index]
                                                                            .customerName!,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: AppTextStyles
                                                                            .bodyTextStyle10,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          5,
                                                                          2,
                                                                          5,
                                                                          2),
                                                                      decoration: BoxDecoration(
                                                                          color: lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].appointmentStatusName! == "Pending"
                                                                              ? AppColors.primaryColor
                                                                              : lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].appointmentStatusName! == "Completed"
                                                                                  ? AppColors.green.withOpacity(0.5)
                                                                                  : lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].appointmentStatusName! == "Accepted"
                                                                                      ? AppColors.orange.withOpacity(0.5)
                                                                                      : AppColors.primaryColor,
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child:
                                                                          Text(
                                                                        // "Pending",
                                                                        lawyerAppointmentHistoryController
                                                                            .lawyerAllAppointmentHistoryListForPagination[index]
                                                                            .appointmentStatusName!,
                                                                        style: AppTextStyles
                                                                            .bodyTextStyle4,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 24.h,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    generalController
                                                                        .updateChannelForCall(
                                                                            generalController.getRandomString(10));
                                                                    print(
                                                                        "${generalController.channelForCall} CALLCHANNEL");
                                                                    setState(
                                                                        () {
                                                                      generalController.appointmentObject = lawyerAppointmentHistoryController
                                                                          .lawyerAllAppointmentHistoryListForPagination[
                                                                              index]
                                                                          .toJson();
                                                                    });
                                                                    generalController
                                                                        .updateSelectedAppointmentHistoryForView(
                                                                            lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index]);
                                                                    Get.toNamed(
                                                                        PageRoutes
                                                                            .appointmentHistoryDetailScreen);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'View Details',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: AppTextStyles
                                                                        .bodyTextStyle1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 8, 20, 8),
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          gradient: AppColors
                                                              .gradientOne),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/icons/Date_range_light.png"),
                                                          SizedBox(width: 5.w),
                                                          Text(
                                                            // "Mon, 28th March, 2023",
                                                            lawyerAppointmentHistoryController
                                                                .lawyerAllAppointmentHistoryListForPagination[
                                                                    index]
                                                                .date!,
                                                            style: AppTextStyles
                                                                .bodyTextStyle6,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/icons/Time.png"),
                                                          SizedBox(width: 5.w),
                                                          Text(
                                                            "${lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].startTime}",
                                                            style: AppTextStyles
                                                                .bodyTextStyle6,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          lawyerAppointmentHistoryController
                                                                      .lawyerAllAppointmentHistoryListForPagination[
                                                                          index]
                                                                      .appointmentTypeId! ==
                                                                  1
                                                              ? Image.asset(
                                                                  "assets/icons/🦆 icon _Video_.png",
                                                                  height: 16.h,
                                                                )
                                                              : lawyerAppointmentHistoryController
                                                                          .lawyerAllAppointmentHistoryListForPagination[
                                                                              index]
                                                                          .appointmentTypeId! ==
                                                                      2
                                                                  ? Image.asset(
                                                                      "assets/icons/🦆 icon _Volume Up_.png",
                                                                      height:
                                                                          16.h,
                                                                    )
                                                                  : lawyerAppointmentHistoryController
                                                                              .lawyerAllAppointmentHistoryListForPagination[
                                                                                  index]
                                                                              .appointmentTypeId! ==
                                                                          3
                                                                      ? Image
                                                                          .asset(
                                                                          "assets/icons/🦆 icon _comments_.png",
                                                                          height:
                                                                              16.h,
                                                                        )
                                                                      : Container(),
                                                          SizedBox(width: 5.w),
                                                          Text(
                                                            // "Video Call",
                                                            lawyerAppointmentHistoryController
                                                                .lawyerAllAppointmentHistoryListForPagination[
                                                                    index]
                                                                .appointmentTypeName!,
                                                            style: AppTextStyles
                                                                .bodyTextStyle6,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Center(
                                      child: Text(
                                        "No Data Found",
                                        style: AppTextStyles.bodyTextStyle10,
                                      ),
                                    ),
                              // Pending Appointment History
                              appointmentHistoryWidget(
                                  1,
                                  lawyerAppointmentHistoryController,
                                  generalController),
                              // Accepted Appointment History
                              appointmentHistoryWidget(
                                  2,
                                  lawyerAppointmentHistoryController,
                                  generalController),
                              // Completed Appointment History
                              appointmentHistoryWidget(
                                  5,
                                  lawyerAppointmentHistoryController,
                                  generalController),
                            ]),
                          ),
                        )
                ]),
          ),
        );
      });
    });
  }

// Appointment History
  Widget appointmentHistoryWidget(
      int statusCode,
      LawyerAppointmentHistoryController lawyerAppointmentHistoryController,
      GeneralController generalController) {
    return lawyerAppointmentHistoryController
            .lawyerAllAppointmentHistoryListForPagination
            .where((i) => i.appointmentStatusCode == statusCode)
            .toList()
            .isNotEmpty
        ? RefreshIndicator(
            onRefresh: _pullRefresh,
            color: AppColors.primaryColor,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              // ignore: iterable_contains_unrelated_type
              itemCount: lawyerAppointmentHistoryController
                  .lawyerAllAppointmentHistoryListForPagination
                  .where((i) => i.appointmentStatusCode == statusCode)
                  .toList()
                  .length,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 18),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        // margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        decoration: const BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius:
                                //       BorderRadius.circular(
                                //           10),
                                //   child: const Image(
                                //     image: AssetImage(
                                //         'assets/images/lawyer-image.png'),
                                //   ),
                                // ),
                                lawyerAppointmentHistoryController
                                            .lawyerAllAppointmentHistoryListForPagination[
                                                index]
                                            .customerImage ==
                                        null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.asset(
                                          scale: 4.h,
                                          'assets/images/lawyer-image.png',
                                          fit: BoxFit.cover,
                                          height: 110.h,
                                          width: 120.w,
                                        ))
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.network(
                                          scale: 4.h,
                                          '$mediaUrl${lawyerAppointmentHistoryController.lawyerAllAppointmentHistoryListForPagination[index].customerImage!}',
                                          fit: BoxFit.cover,
                                          height: 110.h,
                                          width: 120.w,
                                        ),
                                      ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              // "Jhon Doe",
                                              lawyerAppointmentHistoryController
                                                  .lawyerAllAppointmentHistoryListForPagination
                                                  .where((i) =>
                                                      i.appointmentStatusCode ==
                                                      statusCode)
                                                  .toList()[index]
                                                  .customerName!,
                                              textAlign: TextAlign.start,
                                              style:
                                                  AppTextStyles.bodyTextStyle10,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 2, 5, 2),
                                            decoration: BoxDecoration(
                                                color: lawyerAppointmentHistoryController
                                                            .lawyerAllAppointmentHistoryListForPagination
                                                            .where((i) =>
                                                                i.appointmentStatusCode ==
                                                                statusCode)
                                                            .toList()[index]
                                                            .appointmentStatusCode! ==
                                                        1
                                                    ? AppColors.primaryColor
                                                    : lawyerAppointmentHistoryController
                                                                .lawyerAllAppointmentHistoryListForPagination
                                                                .where((i) =>
                                                                    i.appointmentStatusCode ==
                                                                    statusCode)
                                                                .toList()[index]
                                                                .appointmentStatusCode! ==
                                                            5
                                                        ? AppColors.green
                                                            .withOpacity(0.5)
                                                        : lawyerAppointmentHistoryController
                                                                    .lawyerAllAppointmentHistoryListForPagination
                                                                    .where((i) =>
                                                                        i.appointmentStatusCode ==
                                                                        statusCode)
                                                                    .toList()[index]
                                                                    .appointmentStatusCode! ==
                                                                2
                                                            ? AppColors.orange.withOpacity(0.5)
                                                            : AppColors.primaryColor,
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              // statusCode,
                                              lawyerAppointmentHistoryController
                                                  .lawyerAllAppointmentHistoryListForPagination
                                                  .where((i) =>
                                                      i.appointmentStatusCode ==
                                                      statusCode)
                                                  .toList()[index]
                                                  .appointmentStatusName!,
                                              style:
                                                  AppTextStyles.bodyTextStyle4,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          generalController
                                              .updateSelectedAppointmentHistoryForView(
                                                  lawyerAppointmentHistoryController
                                                      .lawyerAllAppointmentHistoryListForPagination
                                                      .where((i) =>
                                                          i.appointmentStatusCode ==
                                                          statusCode)
                                                      .toList()[index]);
                                          Get.toNamed(PageRoutes
                                              .appointmentHistoryDetailScreen);
                                        },
                                        child: const Text(
                                          'View Details',
                                          textAlign: TextAlign.start,
                                          style: AppTextStyles.bodyTextStyle1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            gradient: AppColors.gradientOne),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    "assets/icons/Date_range_light.png"),
                                SizedBox(width: 5.w),
                                Text(
                                  // "Mon, 28th March, 2023",
                                  lawyerAppointmentHistoryController
                                      .lawyerAllAppointmentHistoryListForPagination
                                      .where((i) =>
                                          i.appointmentStatusCode == statusCode)
                                      .toList()[index]
                                      .date!,
                                  style: AppTextStyles.bodyTextStyle6,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/icons/Time.png"),
                                SizedBox(width: 5.w),
                                Text(
                                  lawyerAppointmentHistoryController
                                          .lawyerAllAppointmentHistoryListForPagination[
                                              index]
                                          .startTime ??
                                      "",
                                  style: AppTextStyles.bodyTextStyle6,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                lawyerAppointmentHistoryController
                                            .lawyerAllAppointmentHistoryListForPagination
                                            .where((i) =>
                                                i.appointmentStatusCode ==
                                                statusCode)
                                            .toList()[index]
                                            .appointmentTypeId! ==
                                        1
                                    ? Image.asset(
                                        "assets/icons/🦆 icon _Video_.png",
                                        height: 16.h,
                                      )
                                    : lawyerAppointmentHistoryController
                                                .lawyerAllAppointmentHistoryListForPagination
                                                .where((i) =>
                                                    i.appointmentStatusCode ==
                                                    statusCode)
                                                .toList()[index]
                                                .appointmentTypeId! ==
                                            2
                                        ? Image.asset(
                                            "assets/icons/🦆 icon _Volume Up_.png",
                                            height: 16.h,
                                          )
                                        : lawyerAppointmentHistoryController
                                                    .lawyerAllAppointmentHistoryListForPagination
                                                    .where((i) =>
                                                        i.appointmentStatusCode ==
                                                        statusCode)
                                                    .toList()[index]
                                                    .appointmentTypeId! ==
                                                3
                                            ? Image.asset(
                                                "assets/icons/🦆 icon _comments_.png",
                                                height: 16.h,
                                              )
                                            : Container(),
                                SizedBox(width: 5.w),
                                Text(
                                  // "Video Call",
                                  lawyerAppointmentHistoryController
                                      .lawyerAllAppointmentHistoryListForPagination
                                      .where((i) =>
                                          i.appointmentStatusCode == statusCode)
                                      .toList()[index]
                                      .appointmentTypeName!,
                                  style: AppTextStyles.bodyTextStyle6,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : const Center(
            child: Text(
              "No Data Found",
              style: AppTextStyles.bodyTextStyle2,
            ),
          );
  }
}
