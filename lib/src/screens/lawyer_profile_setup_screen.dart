import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class LawyerProfileSetupScreen extends StatefulWidget {
  const LawyerProfileSetupScreen({super.key});

  @override
  State<LawyerProfileSetupScreen> createState() =>
      LawyerProfileSetupScreenState();
}

class LawyerProfileSetupScreenState extends State<LawyerProfileSetupScreen> {
  String values = 'no';

  int indexPage = 0;
  int activeStep = 3;
  int upperBound = 4;
  bool boolValue = false;
  int? value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
          richTextSpan: const TextSpan(
            text: 'Profile',
            style: AppTextStyles.appbarTextStyle2,
            children: <TextSpan>[],
          ),
          leadingIcon: "assets/icons/Expand_left.png",
          leadingOnTap: () {
            if (indexPage > 0) {
              setState(() {
                indexPage--;
              });
            } else {
              Get.back();
              indexPage = 0;
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
              child: Stack(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: SizedBox(
                          child: Divider(
                            thickness: 4,
                            height: 4,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 21,
                        width: 21,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Divider(
                            thickness: 4,
                            height: 4,
                            color: indexPage >= 1
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: indexPage >= 1
                              ? AppColors.primaryColor
                              : AppColors.lightGrey,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Divider(
                            thickness: 4,
                            height: 4,
                            color: indexPage >= 2
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: indexPage >= 2
                              ? AppColors.primaryColor
                              : AppColors.lightGrey,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Divider(
                            thickness: 4,
                            height: 4,
                            color: indexPage >= 3
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: indexPage >= 3
                              ? AppColors.primaryColor
                              : AppColors.lightGrey,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Divider(
                            thickness: 4,
                            height: 4,
                            color: indexPage >= 3
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 34,
                    top: 25,
                    child: Text(
                      "Information",
                      style: AppTextStyles.bodyTextStyle11,
                    ),
                  ),
                  Positioned(
                    left: 113,
                    top: 25,
                    child: Text(
                      "Certification",
                      style: AppTextStyles.bodyTextStyle11,
                    ),
                  ),
                  Positioned(
                    right: 126,
                    top: 25,
                    child: Text(
                      "Identity",
                      style: AppTextStyles.bodyTextStyle11,
                    ),
                  ),
                  Positioned(
                    right: 53,
                    top: 25,
                    child: Text(
                      "Social",
                      style: AppTextStyles.bodyTextStyle11,
                    ),
                  ),
                ],
              ),
            ),
            indexPage == 0
                ? personalInformation()
                : indexPage == 1
                    ? certification()
                    : indexPage == 2
                        ? identity()
                        : indexPage == 3
                            ? social()
                            : social(),
          ],
        ),
      ),
    );
  }

  // Socail Links
  Widget social() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppTextStyles.hintTextStyle1,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Instagram link",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Facebook link",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Youtube link",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Linkedin link",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ButtonWidgetOne(
              onTap: () {
                Get.toNamed(PageRoutes.homeScreen);
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

  // Lawyer Identity
  Widget identity() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppTextStyles.hintTextStyle1,
            maxLines: 8,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Write a short story about you",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 24),
            decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Upload your CNIC",
                  style: AppTextStyles.buttonTextStyle7,
                ),
                const SizedBox(width: 10),
                Image.asset("assets/icons/Upload.png")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 14),
                  child: Text(
                    "Cnic Attached file",
                    style: AppTextStyles.bodyTextStyle10,
                  ),
                ),
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  leading: Image.asset(
                    "assets/icons/File_dock.png",
                    height: 24.h,
                  ),
                  title: const Text(
                    "Front Side",
                    style: AppTextStyles.hintTextStyle1,
                  ),
                  trailing: Image.asset(
                    "assets/icons/Subtract.png",
                    color: AppColors.primaryColor,
                    height: 20.h,
                  ),
                ),
                ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  leading: Image.asset(
                    "assets/icons/File_dock.png",
                    height: 24.h,
                  ),
                  title: const Text(
                    "Back Side",
                    style: AppTextStyles.hintTextStyle1,
                  ),
                  trailing: Image.asset(
                    "assets/icons/Subtract.png",
                    color: AppColors.primaryColor,
                    height: 20.h,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 18),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 70.w,
                    child: ButtonWidgetOne(
                        onTap: () {},
                        buttonText: 'Add',
                        buttonTextStyle: AppTextStyles.buttonTextStyle2,
                        borderRadius: 8,
                        buttonColor: AppColors.secondaryColor),
                  ),
                )
              ],
            ),
          ),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

// Certification of Lawyer
  Widget certification() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white, //background color of dropdown button
              border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1), //border of dropdown button
              borderRadius:
                  BorderRadius.circular(10), //border raiuds of dropdown button
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration.collapsed(
                      hintStyle: AppTextStyles.hintTextStyle1,
                      hintText: 'Select Your Certification'),
                  items: [
                    //add items in the dropdown
                    DropdownMenuItem(
                      value: "Master Card",
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/icons/mastercard-full-svgrepo-com 1.png"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Master Card"),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Visa Card",
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/icons/mastercard-full-svgrepo-com 1.png"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Visa Card"),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: "American Express",
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/icons/mastercard-full-svgrepo-com 1.png"),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("American Express"),
                        ],
                      ),
                    )
                  ],
                  onChanged: (value) {
                    //get value when changed
                    print("You have selected $value");
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.secondaryColor,
                  ),
                  iconEnabledColor: Colors.white, //Icon color
                  style: AppTextStyles.subHeadingTextStyle1,
                  dropdownColor: AppColors.white, //dropdown background color
                  isExpanded: true, //make true to make width 100%
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'Start Date',
                  validator: (String? value) {},
                  initialText: '',
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'End Date',
                  validator: (String? value) {},
                  initialText: '',
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 24),
            decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Upload your Document",
                  style: AppTextStyles.buttonTextStyle7,
                ),
                const SizedBox(width: 10),
                Image.asset("assets/icons/Upload.png")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 2, 0, 14),
                  child: Text(
                    "Professional Cetificate",
                    style: AppTextStyles.bodyTextStyle10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/File_dock.png",
                            height: 24.h,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Certificate file name here",
                            style: AppTextStyles.hintTextStyle1,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        "assets/icons/Subtract.png",
                        color: AppColors.primaryColor,
                        height: 20.h,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 6, 24, 18),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 70.w,
                    child: ButtonWidgetOne(
                        onTap: () {},
                        buttonText: 'Add',
                        buttonTextStyle: AppTextStyles.buttonTextStyle2,
                        borderRadius: 8,
                        buttonColor: AppColors.secondaryColor),
                  ),
                )
              ],
            ),
          ),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

// Personal Information
  Widget personalInformation() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppColors.gradientOne,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/Upload_duotone_line.png"),
                      const SizedBox(height: 4),
                      const Text(
                        "Upload image",
                        style: AppTextStyles.bodyTextStyle1,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      // apiController.storageBox
                      //             .read('authToken') !=
                      //         null
                      //     ? "${generalController.currentLawyerModel!.name}"
                      //     : "",
                      style: AppTextStyles.bodyTextStyle5,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "",
                      // apiController.storageBox
                      //             .read('authToken') !=
                      //         null
                      //     ? "${generalController.currentLawyerModel!.email}"
                      //     : "",
                      style: AppTextStyles.bodyTextStyle6,
                    ),
                    const SizedBox(height: 8),
                    ButtonWidgetFour(
                      onTap: () {},
                      buttonText: "Edit Profile",
                      buttonTextStyle: AppTextStyles.buttonTextStyle6,
                      borderRadius: 6,
                      buttonColor: AppColors.gradientTwo,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          TextFormFieldWidget(
            hintText: '* First Name',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 14),
          TextFormFieldWidget(
            hintText: '* Last Name',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 14),
          TextFormFieldWidget(
            hintText: '* Email',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 14),
          TextFormFieldWidget(
            hintText: '* Phone Number',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 14),
          TextFormFieldWidget(
            hintText: '* City',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 14),
          TextFormFieldWidget(
            hintText: '* Country',
            validator: (String? value) {},
            initialText: '',
          ),
          const SizedBox(height: 36),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }
}
