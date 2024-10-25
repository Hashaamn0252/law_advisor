import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_font.dart';
import '../config/app_text_styles.dart';

import '../routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/intro_indicator_slider_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/app-icon.png",
                  height: 50.h,
                  width: 50.w,
                ),
                const SizedBox(width: 5.0),
                RichText(
                  // Controls how the text should be aligned horizontally
                  textAlign: TextAlign.center,
                  // Whether the text should break at soft line breaks
                  softWrap: true,
                  text: const TextSpan(
                    text: 'Law ',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFont.primaryFontFamily,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Advisor',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.primaryFontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 0.68,
              child: IndicatorSliderWidget(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 22, 70, 22),
              child: ButtonWidgetOne(
                buttonText: 'Next',
                onTap: () {
                  Get.toNamed(PageRoutes.homeScreen);
                },
                buttonTextStyle: AppTextStyles.buttonTextStyle1,
                borderRadius: 12,
                buttonColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
