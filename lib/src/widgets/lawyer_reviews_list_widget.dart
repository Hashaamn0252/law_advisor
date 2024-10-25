// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:resize/resize.dart';

// import '../api_services/post_service.dart';
// import '../api_services/urls.dart';
// import '../config/app_colors.dart';
// import '../config/app_text_styles.dart';
// import '../controllers/general_controller.dart';
// import '../controllers/lawyer_reviews_controller.dart';
// import '../repositories/lawyer_reviews_repo.dart';
// import 'button_widget.dart';
// import 'custom_skeleton_loader.dart';

// class LawyerReviewsListWidget extends StatefulWidget {
//   final String lawyerReviewsSlug;
//   LawyerReviewsListWidget({
//     super.key,
//     required this.lawyerReviewsSlug,
//   });

//   @override
//   State<LawyerReviewsListWidget> createState() =>
//       _LawyerReviewsListWidgetState();
// }

// class _LawyerReviewsListWidgetState extends State<LawyerReviewsListWidget> {
//   final logic = Get.put(LawyerReviewsController());

//   @override
//   void initState() {
//     super.initState();
//     postMethod(context, '$getLawyerReviews/${widget.lawyerReviewsSlug}', null,
//         false, getLawyerReviewsRepo);
//     print(
//         "${logic.getLawyerReviewsModel.data?.data!.length} lawyer reviews length");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<GeneralController>(builder: (generalController) {
//       return GetBuilder<LawyerReviewsController>(
//           builder: (lawyerReviewsController) {
//         return Scaffold(
//           backgroundColor: AppColors.white,
//           body: SingleChildScrollView(
//             child: !lawyerReviewsController.allLawyerReviewsLoader
//                 ? Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
//                     child: CustomVerticalSkeletonLoader(
//                       height: 200.h,
//                       highlightColor: AppColors.grey,
//                       seconds: 2,
//                       totalCount: 5,
//                       width: 140.w,
//                     ),
//                   )
//                 : Column(
//                     children: [
//                       const SizedBox(height: 18),
//                       ...List.generate(
//                           lawyerReviewsController.getLawyerReviewsModel.data!
//                               .data!.length, (index) {
//                         return Container(
//                           padding: const EdgeInsets.fromLTRB(8, 14, 8, 14),
//                           margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
//                           decoration: BoxDecoration(
//                             color: AppColors.offWhite,
//                             borderRadius: BorderRadius.circular(18),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               // mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "${lawyerReviewsController.getLawyerReviewsModel.data!.data![index].customer!.name}",
//                                   textAlign: TextAlign.start,
//                                   style: AppTextStyles.bodyTextStyle2,
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   '${lawyerReviewsController.getLawyerReviewsModel.data!.data![index].comment}',
//                                   textAlign: TextAlign.start,
//                                   style: AppTextStyles.bodyTextStyle7,
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           RatingBar.builder(
//                                             initialRating:
//                                                 lawyerReviewsController
//                                                     .getLawyerReviewsModel
//                                                     .data!
//                                                     .data![index]
//                                                     .rating!
//                                                     .toDouble(),
//                                             minRating: 1,
//                                             itemSize: 15.h,
//                                             direction: Axis.horizontal,
//                                             allowHalfRating: true,
//                                             itemCount: 5,
//                                             ignoreGestures: true,
//                                             itemPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     horizontal: 0.0),
//                                             itemBuilder: (context, _) =>
//                                                 const Icon(
//                                               Icons.star,
//                                               color: Colors.amber,
//                                             ),
//                                             onRatingUpdate: (double value) {},
//                                           ),
//                                           SizedBox(width: 5.w),
//                                           Text(
//                                             // '4.5',
//                                             // "${lawyerReviewsController.getLawyerReviewsModel.data!.data![index].rating!}",
//                                             "${lawyerReviewsController.getLawyerReviewsModel.data!.data![index].createdAt?.split(",").first}",
//                                             textAlign: TextAlign.start,
//                                             style: AppTextStyles.bodyTextStyle4,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }),

//                       // allLawyersController
//                       //         .lawyerListForPagination.isNotEmpty
//                       lawyerReviewsController
//                                   .lawyerReviewsListForPagination.length !=
//                               lawyerReviewsController
//                                   .getLawyerReviewsModel.data!.data!.length
//                           ? Center(
//                               child: Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
//                                 width: MediaQuery.of(context).size.width * .35,
//                                 child: generalController
//                                         .getPaginationProgressCheck
//                                     ? Container(
//                                         height: generalController
//                                                 .getPaginationProgressCheck
//                                             ? 50.0
//                                             : 0,
//                                         color: Colors.transparent,
//                                         child: const Center(
//                                           child: CircularProgressIndicator(
//                                             color: AppColors.primaryColor,
//                                           ),
//                                         ),
//                                       )
//                                     : lawyerReviewsController
//                                             .lawyerReviewsListForPagination
//                                             .isNotEmpty
//                                         ? ButtonWidgetOne(
//                                             buttonText: 'Load More',
//                                             onTap: () {
//                                               lawyerReviewsController
//                                                   .paginationDataLoad(context);
//                                             },
//                                             buttonTextStyle:
//                                                 AppTextStyles.buttonTextStyle7,
//                                             borderRadius: 5,
//                                             buttonColor: AppColors.primaryColor,
//                                           )
//                                         : const Center(
//                                             child: Padding(
//                                               padding: EdgeInsets.fromLTRB(
//                                                   0, 50, 0, 0),
//                                               child: Text(
//                                                 "No Reviews Found",
//                                                 style: AppTextStyles
//                                                     .bodyTextStyle2,
//                                               ),
//                                             ),
//                                           ),
//                               ),
//                             )
//                           : lawyerReviewsController
//                                   .getLawyerReviewsModel.data!.data!.isNotEmpty
//                               ? const SizedBox()
//                               : const Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
//                                     child: Text(
//                                       "No Reviews Found",
//                                       style: AppTextStyles.bodyTextStyle2,
//                                     ),
//                                   ),
//                                 ),
//                     ],
//                   ),
//           ),
//         );
//       });
//     });
//   }
// }
