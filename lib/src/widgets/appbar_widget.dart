import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../routes.dart';

class AppBarWidget extends StatelessWidget {
  final TextSpan richTextSpan;
  final String leadingIcon;
  final Widget? profileImage;
  final Widget? actionsIconWidget;

  final VoidCallback leadingOnTap;
  const AppBarWidget({
    super.key,
    required this.richTextSpan,
    required this.leadingIcon,
    this.profileImage,
    required this.leadingOnTap,
    this.actionsIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: leadingOnTap,
        child: Image.asset(
          leadingIcon,
          scale: 1.5.h,
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            InkWell(
              onTap:
                  Get.find<GeneralController>().storageBox.read('authToken') !=
                          null
                      ? () {
                          Get.toNamed(PageRoutes.lawyerProfileScreen);
                        }
                      : () {
                          Get.toNamed(PageRoutes.signinScreen);
                        },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
                child: Get.find<GeneralController>()
                            .storageBox
                            .read('authToken') !=
                        null
                    ? Get.find<GeneralController>()
                                .currentLawyerModel!
                                .loginInfo!
                                .image !=
                            null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                '$mediaUrl${Get.find<GeneralController>().currentLawyerModel!.loginInfo!.image}'),
                            radius: 18.h,
                          )
                        : Image.asset(
                            "assets/icons/user-avatar.png",
                            height: 32.h,
                          )
                    : Image.asset(
                        "assets/icons/user-avatar.png",
                        height: 32.h,
                      ),
              ),
            ),
          ],
        )
      ],
      title: RichText(
        textAlign: TextAlign.center,
        softWrap: true,
        text: richTextSpan,
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
    );
  }
}
