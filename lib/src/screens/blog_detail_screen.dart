import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../controllers/all_blogs_controller.dart';
import '../controllers/general_controller.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/custom_skeleton_loader.dart';

// ignore: must_be_immutable
class BlogDetailScreen extends StatelessWidget {
  BlogDetailScreen({super.key});
  final logic = Get.put(AllBlogsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
      builder: (generalController) {
        return GetBuilder<AllBlogsController>(
          builder: (allBlogsPostsController) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: AppBarWidget(
                  leadingIcon: 'assets/icons/Expand_left.png',
                  leadingOnTap: () {
                    Get.back();
                  },
                  richTextSpan: const TextSpan(
                    text: 'Blog Detail',
                    style: AppTextStyles.appbarTextStyle2,
                    children: <TextSpan>[],
                  ),
                ),
              ),
              body: !allBlogsPostsController.allBlogsPostsLoader
                  ? CustomVerticalSkeletonLoader(
                      height: 200.h,
                      highlightColor: AppColors.grey,
                      seconds: 2,
                      totalCount: 5,
                      width: 140.w,
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: allBlogsPostsController
                                          .selectedBlogsPostsForView
                                          .image
                                          ?.length
                                          .toString !=
                                      'null'
                                  ? Image(
                                      image: NetworkImage(
                                          "$mediaUrl${allBlogsPostsController.selectedBlogsPostsForView.image}"),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 200.h,
                                    )
                                  : Image(
                                      image: const AssetImage(
                                          "assets/images/events-image-2.png"),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                    ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              // "Blog post title here Lorum Ipsum Dollar sit emit",
                              "${allBlogsPostsController.selectedBlogsPostsForView.name}",
                              style: AppTextStyles.bodyTextStyle8,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              // "Lawyer Title",
                              "${allBlogsPostsController.selectedBlogsPostsForView.lawyerName}",
                              textAlign: TextAlign.start,
                              style: AppTextStyles.bodyTextStyle10,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              // "25th March, 2023",
                              "${allBlogsPostsController.selectedBlogsPostsForView.createdAt?.split(",").first}",
                              textAlign: TextAlign.start,
                              style: AppTextStyles.bodyTextStyle3,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae arcu ac elit dapibus pharetra. Aliquam magna elit, porttitor a elementum",
                              "${allBlogsPostsController.selectedBlogsPostsForView.description}",
                              style: AppTextStyles.bodyTextStyle7,
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
