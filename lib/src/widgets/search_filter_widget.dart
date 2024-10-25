import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search your expert",
            hintStyle: AppTextStyles.hintTextStyle1,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            prefixIcon: Image.asset("assets/icons/Search_alt.png"),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  backgroundColor: AppColors.primaryColor,
                  // minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Filter",
                      style: AppTextStyles.buttonTextStyle2,
                    ),
                    Image.asset("assets/icons/Filter_alt_fill.png"),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
