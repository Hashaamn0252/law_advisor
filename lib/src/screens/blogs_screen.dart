import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../controllers/all_blogs_controller.dart';
import '../controllers/general_controller.dart';

import '../repositories/all_blogs_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => BlogsScreenState();
}

class BlogsScreenState extends State<BlogsScreen> {
  final logic = Get.put(AllBlogsController());
  // final List numbers = List.generate(30, (index) => "Item $index");

  @override
  void initState() {
    super.initState();
    postMethod(
        context, '$getAllBlogsPosts?page=1', null, false, getAllBlogsPostsRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllBlogsController>(builder: (allBlogsPostsController) {
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
                text: 'Blogs',
                style: AppTextStyles.appbarTextStyle2,
                children: <TextSpan>[],
              ),
            ),
          ),
          body: !allBlogsPostsController.allBlogsPostsLoader
              ? const CustomGridViewSkeletonLoader(
                  highlightColor: AppColors.grey,
                  seconds: 2,
                  totalCount: 5,
                  aspectRatio: 0.9,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.count(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                        crossAxisCount: 2,
                        crossAxisSpacing: 18.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 0.7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          allBlogsPostsController
                              .blogsPostsListForPagination.length,
                          (index) {
                            return InkWell(
                              onTap: () {
                                allBlogsPostsController
                                    .updateSelectedBlogsPostsForView(
                                        allBlogsPostsController
                                                .blogsPostsListForPagination[
                                            index]);

                                Get.toNamed(PageRoutes.blogDetailScreen);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: unrelated_type_equality_checks
                                      child: allBlogsPostsController
                                                  .blogsPostsListForPagination[
                                                      index]
                                                  .image
                                                  ?.length
                                                  .toString !=
                                              'null'
                                          ? Image(
                                              image: NetworkImage(
                                                  "$mediaUrl${allBlogsPostsController.blogsPostsListForPagination[index].image}"),
                                              fit: BoxFit.cover,
                                              height: 160.h,
                                              width: 160.w,
                                            )
                                          : Image(
                                              image: const AssetImage(
                                                  'assets/images/events-image-2.png'),
                                              height: 110.h,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    // "Blog post title here",
                                    "${allBlogsPostsController.blogsPostsListForPagination[index].name}",
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextStyle2,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    // "Lawyer Name",
                                    "${allBlogsPostsController.blogsPostsListForPagination[index].lawyerName}",
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextStyle11,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    // "25th March, 2023",
                                    "${allBlogsPostsController.blogsPostsListForPagination[index].createdAt?.split(",").first}",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.bodyTextStyle3,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      allBlogsPostsController
                                      .blogsPostsListForPagination.length ==
                                  allBlogsPostsController.getAllBlogPostsModel
                                      .data!.data!.length &&
                              allBlogsPostsController.getAllBlogPostsModel.data!
                                      .meta!.currentPage !=
                                  allBlogsPostsController
                                      .getAllBlogPostsModel.data!.meta!.lastPage
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                              width: MediaQuery.of(context).size.width * .35,
                              child:
                                  generalController.getPaginationProgressCheck
                                      ? Container(
                                          height: generalController
                                                  .getPaginationProgressCheck
                                              ? 50.0
                                              : 0,
                                          color: Colors.transparent,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        )
                                      : ButtonWidgetOne(
                                          buttonText: 'Load More',
                                          onTap: () {
                                            allBlogsPostsController
                                                .paginationDataLoad(context);
                                          },
                                          buttonTextStyle:
                                              AppTextStyles.buttonTextStyle7,
                                          borderRadius: 5,
                                          buttonColor: AppColors.primaryColor,
                                        ))
                          : const SizedBox(),
                    ],
                  ),
                ),
        );
      });
    });
  }
}
