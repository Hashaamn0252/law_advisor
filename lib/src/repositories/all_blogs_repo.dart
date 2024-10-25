import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_blogs_controller.dart';
import '../controllers/general_controller.dart';
import '../models/all_blog_posts_model.dart';

getAllBlogsPostsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllBlogsController>().getAllBlogPostsModel =
        GetAllBlogPostsModel.fromJson(response);

    Get.find<AllBlogsController>().updateBlogsPostsLoader(true);
    log("${Get.find<AllBlogsController>().getAllBlogPostsModel.data!.data!.length.toString()} Total Blogs Posts Length");

    for (var element
        in Get.find<AllBlogsController>().getAllBlogPostsModel.data!.data!) {
      Get.find<AllBlogsController>().updateBlogsPostsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllBlogsController>().updateBlogsPostsLoader(true);
  }
}
