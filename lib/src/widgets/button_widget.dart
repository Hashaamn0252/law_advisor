import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

class ButtonWidgetOne extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final double borderRadius;

  const ButtonWidgetOne({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.borderRadius,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidgetTwo extends StatelessWidget {
  final VoidCallback onTap;
  final Gradient buttonColor;
  final String buttonText;

  final TextStyle buttonTextStyle;
  final double borderRadius;
  final String buttonIcon;

  const ButtonWidgetTwo({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.borderRadius,
    required this.buttonColor,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: AppColors.gradientTwo,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(buttonIcon),
            const SizedBox(width: 4),
            Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidgetThree extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText, buttonIcon;
  final double iconHeight;
  const ButtonWidgetThree({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonIcon,
    required this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              buttonIcon,
              // "assets/icons/Google.png",
              height: iconHeight,
            ),
            SizedBox(width: 6.w),
            Text(
              buttonText,
              // "Login Via Google",
              style: AppTextStyles.bodyTextStyle10,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonWidgetFour extends StatelessWidget {
  final VoidCallback onTap;
  final Gradient buttonColor;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final double borderRadius;

  const ButtonWidgetFour({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.borderRadius,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: AppColors.gradientTwo,
        ),
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}

class ButtonWidgetFive extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final IconData buttonIcon;
  final TextStyle buttonTextStyle;
  final double borderRadius, iconSize;

  const ButtonWidgetFive({
    super.key,
    required this.onTap,
    required this.buttonIcon,
    required this.buttonTextStyle,
    required this.borderRadius,
    required this.buttonColor,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: buttonColor),
        child: Icon(buttonIcon, size: iconSize),
      ),
    );
  }
}
