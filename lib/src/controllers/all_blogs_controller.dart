import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/all_blog_posts_model.dart';
import '../repositories/all_blogs_repo.dart';
import 'general_controller.dart';

class AllBlogsController extends GetxController {
  GetAllBlogPostsModel getAllBlogPostsModel = GetAllBlogPostsModel();

  bool allBlogsPostsLoader = false;
  updateBlogsPostsLoader(bool newValue) {
    allBlogsPostsLoader = newValue;
    update();
  }

  String? selectedBlogsPostsCategory;
  BlogModel selectedBlogsPostsForView = BlogModel();
  GetAllBlogPostsDataModel getAllBlogsPostsDataModel =
      GetAllBlogPostsDataModel();

  List<BlogModel> blogsPostsListForPagination = [];

  updateSelectedBlogsPostsForView(
    BlogModel newValue,
  ) {
    selectedBlogsPostsForView = newValue;

    update();
  }

  ///------------------------------- Blog-Posts-data-check
  bool getBlogsPostsDataCheck = false;
  getBlogsPostsDataCheckCheck(bool value) {
    getBlogsPostsDataCheck = value;
    update();
  }

  // int? selectedLawyerCategoryIndex = 0;
  // updateSelectedLawyerCategoryIndex(int? newValue) {
  //   selectedLawyerCategoryIndex = newValue;
  //   update();
  // }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getAllBlogPostsModel.data!.meta!.lastPage! >
        getAllBlogPostsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getAllBlogPostsModel.data!.meta!.path}',
          {
            'page': (getAllBlogPostsModel.data!.meta!.currentPage! + 1),
            'perPage': getAllBlogPostsModel.data!.meta!.perPage
          },
          false,
          getAllBlogsPostsRepo);
      update();
    }
  }

  updateBlogsPostsListForPagination(BlogModel blogsPostsModel) {
    blogsPostsListForPagination.add(blogsPostsModel);
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
