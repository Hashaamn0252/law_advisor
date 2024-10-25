// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:lawyer_consultant/src/widgets/button_widget.dart';
// import 'package:resize/resize.dart';

// import '../config/app_colors.dart';
// import '../config/app_text_styles.dart';

// class LawyerCardWidget extends StatelessWidget {
//   final String lawyerName, lawyerCategoriesName, lawyerDegrees, lawyerRating;
//   final Image lawyerImage;
//   final double lawyerInitialRating;
//   final VoidCallback profileOnTap;
//   const LawyerCardWidget(
//       {super.key,
//       required this.lawyerImage,
//       required this.lawyerName,
//       required this.lawyerCategoriesName,
//       required this.lawyerDegrees,
//       required this.lawyerRating,
//       required this.lawyerInitialRating,
//       required this.profileOnTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
//       margin: const EdgeInsets.only(bottom: 18),
//       decoration: BoxDecoration(
//         color: AppColors.offWhite,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//               borderRadius: BorderRadius.circular(18),
//               // ignore: unrelated_type_equality_checks
//               child: lawyerImage),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     lawyerName,
//                     textAlign: TextAlign.start,
//                     style: AppTextStyles.bodyTextStyle2,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     lawyerCategoriesName,
//                     textAlign: TextAlign.start,
//                     style: AppTextStyles.bodyTextStyle3,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     lawyerDegrees,
//                     textAlign: TextAlign.start,
//                     style: AppTextStyles.bodyTextStyle4,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             RatingBar.builder(
//                               initialRating: lawyerInitialRating,
//                               minRating: 1,
//                               itemSize: 15.h,
//                               direction: Axis.horizontal,
//                               allowHalfRating: true,
//                               itemCount: 5,
//                               ignoreGestures: true,
//                               itemPadding:
//                                   const EdgeInsets.symmetric(horizontal: 0.0),
//                               itemBuilder: (context, _) => const Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                               ),
//                               onRatingUpdate: (double value) {},
//                             ),
//                             SizedBox(width: 5.w),
//                             Text(
//                               // '4.5',
//                               lawyerRating,
//                               textAlign: TextAlign.start,
//                               style: AppTextStyles.bodyTextStyle4,
//                             ),
//                           ],
//                         ),
//                         ButtonWidgetOne(
//                           buttonText: 'Profile',
//                           onTap: profileOnTap,
//                           buttonTextStyle: AppTextStyles.buttonTextStyle2,
//                           borderRadius: 5,
//                           buttonColor: AppColors.secondaryColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
