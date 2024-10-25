import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

class CategoryExpansionTileWidget extends StatelessWidget {
  final String categoryTitle, categoryIcon;
  const CategoryExpansionTileWidget({
    super.key,
    required this.categoryTitle,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppColors.gradientOne),
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: AppColors.white,
        ),
        child: ExpansionTile(
          leading: ImageIcon(
            AssetImage(categoryIcon),
            size: 30,
            color: AppColors.white,
          ),
          iconColor: AppColors.white,
          // shape: RoundedRectangleBorder(
          //     side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
          title: Text(
            categoryTitle,
            style: AppTextStyles.bodyTextStyle5,
          ),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              color: AppColors.offWhite,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 28, 0),
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                    ),
                    title: const Text(
                      "Administrative / Regulatory Law",
                      style: AppTextStyles.bodyTextStyle1,
                    ),
                    dense: true,
                    horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                  ),
                  ListTile(
                    leading: Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 28, 0),
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                    ),
                    title: const Text(
                      "Administrative / Regulatory Law",
                      style: AppTextStyles.bodyTextStyle1,
                    ),
                    dense: true,
                    horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
