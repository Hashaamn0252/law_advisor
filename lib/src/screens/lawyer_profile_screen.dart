import 'dart:developer';

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';
import '../api_services/delete_service.dart';
import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_settings_controller.dart';
import '../controllers/edit_profile_controller.dart';
import '../controllers/general_controller.dart';
import '../repositories/edit_user_profile_repo.dart';

import '../repositories/get_lawyer_certificate_repo.dart';
import '../repositories/get_lawyer_education_repo.dart';
import '../repositories/get_lawyer_experience_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/commission_type_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/text_form_field_widget.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen({super.key});

  @override
  State<LawyerProfileScreen> createState() => LawyerProfileScreenState();
}

class LawyerProfileScreenState extends State<LawyerProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _userProfileUpdateFormKey = GlobalKey();
  final editProfileLogic = Get.put(EditProfileController());
  final generalLogic = Get.put(GeneralController());
  File? file;
  int tabsLength = 4;
  int indexPage = 0;
  TabController? tabController;
  bool isVisibleEducationForm = false;

  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });

      print(file!.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();

    if (Get.find<GeneralController>()
        .currentLawyerModel!
        .lawyerModules!
        .contains("lawyer-events")) {
      print("FIND TRUE");
    } else {
      print("FIND NOT TRUE");
    }

    tabController = TabController(vsync: this, length: tabsLength);
    // getMethod(context, getLoggedInUserUrl, null, true, loggedInUserRepo);
    editProfileLogic.userProfileFirstNameController.text =
        generalLogic.currentLawyerModel!.loginInfo!.firstName ?? '';

    editProfileLogic.userProfileLastNameController.text =
        generalLogic.currentLawyerModel!.loginInfo!.lastName ?? '';

    editProfileLogic.userProfileUserNameController.text =
        generalLogic.currentLawyerModel!.loginInfo!.userName ?? '';

    editProfileLogic.userProfileDescriptionController.text =
        generalLogic.currentLawyerModel!.loginInfo!.description ?? '';

    editProfileLogic.userProfileAddressLine1Controller.text =
        generalLogic.currentLawyerModel!.loginInfo!.addressLine1 ?? '';

    editProfileLogic.userProfileAddressLine2Controller.text =
        generalLogic.currentLawyerModel!.loginInfo!.addressLine1 ?? '';

    editProfileLogic.userProfileZipCodeController.text =
        generalLogic.currentLawyerModel!.loginInfo!.zipCode ?? '';

    // editProfileLogic.uploadedProfileImage =
    //     generalLogic.currentLawyerModel!.loginInfo!.image;

    log("${generalLogic.currentLawyerModel!.loginInfo!.image} Log Image");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<EditProfileController>(
          builder: (editProfileController) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
            inAsyncCall: generalController.formLoaderController,
            child: GestureDetector(
              onTap: () {
                final FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(116),
                  child: Column(
                    children: [
                      AppBarWidget(
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
                      Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: AppColors.primaryColor),
                        child: TabBar(
                          controller: tabController,

                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.secondaryColor,
                          // dividerColor: AppColors.primaryColor,
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          indicatorPadding:
                              const EdgeInsets.fromLTRB(6, 4, 6, 4),
                          labelPadding: EdgeInsets.zero,
                          labelStyle: AppTextStyles.buttonTextStyle2,
                          unselectedLabelStyle: AppTextStyles.buttonTextStyle7,
                          indicator: BoxDecoration(
                              gradient: AppColors.gradientOne,
                              borderRadius: BorderRadius.circular(10)),
                          tabs: const [
                            Tab(text: 'Information'),
                            Tab(text: 'Education'),
                            Tab(text: 'Certificate'),
                            Tab(text: 'Experience'),
                            // Tab(text: 'Podcasts'),
                            // Tab(text: 'Events'),
                            // Tab(text: 'Blogs'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top:
                            BorderSide(color: AppColors.primaryColor, width: 1),
                      ),
                    ),
                    child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          // Information
                          basicInformation(context, editProfileController,
                              generalController),

                          // Education
                          LayerEducationWidget(),

                          // Certificate
                          LawyerCertificateWidget(),

                          // Experience
                          LayerExperienceWidget(),

                          // experience(
                          //     context, editProfileController, generalController),
                          // const Center(
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          //     child: Text(
                          //       "No Data Found",
                          //       style: AppTextStyles.bodyTextStyle2,
                          //     ),
                          //   ),
                          // ),
                          // const Center(
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          //     child: Text(
                          //       "No Data Found",
                          //       style: AppTextStyles.bodyTextStyle2,
                          //     ),
                          //   ),
                          // ),
                          // const Center(
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          //     child: Text(
                          //       "No Data Found",
                          //       style: AppTextStyles.bodyTextStyle2,
                          //     ),
                          //   ),
                          // ),
                        ])),
              ),
            ));
      });
    });
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

// Certification of Lawyer
  // Widget certification(
  //     BuildContext context,
  //     EditProfileController editProfileController,
  //     GeneralController generalController) {
  //   return ;
  // }

// Education of Lawyer
  Widget education(
      BuildContext context,
      EditProfileController editProfileController,
      GeneralController generalController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            hintText: 'Institute Name',
            controller: editProfileController.educationInstituteNameController,
            onChanged: (String? value) {
              editProfileController.educationInstituteNameController.text ==
                  value;
              editProfileController.update();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Institute Name Field Required';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20.h),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            maxLines: 4,
            controller: editProfileController.educationDescriptionController,
            onChanged: (String? value) {
              editProfileController.educationDescriptionController.text ==
                  value;
              editProfileController.update();
            },
            decoration: InputDecoration(
              hintText: "Description",
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
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'Degree',
                  controller: editProfileController.educationDegreeController,
                  onChanged: (String? value) {
                    editProfileController.educationDegreeController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Degree Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'Subject',
                  controller: editProfileController.educationSubjectController,
                  onChanged: (String? value) {
                    editProfileController.educationSubjectController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Subject Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'Start Date',
                  controller:
                      editProfileController.educationStartDateController,
                  onChanged: (String? value) {
                    editProfileController.educationStartDateController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Start Date Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'End Date',
                  controller: editProfileController.educationEndDateController,
                  onChanged: (String? value) {
                    editProfileController.educationEndDateController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'End Date Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              filePick();
            },
            child: Container(
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
                          SizedBox(width: 10.w),
                          file == null
                              ? const Text(
                                  "Certificate file name here",
                                  style: AppTextStyles.hintTextStyle1,
                                )
                              : Text(
                                  file!.path
                                      .toString()
                                      .split("/")
                                      .last
                                      .toString(),
                                  style: AppTextStyles.hintTextStyle1,
                                ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      file == null
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  file = null;
                                });
                              },
                              child: Image.asset(
                                "assets/icons/Subtract.png",
                                color: AppColors.primaryColor,
                                height: 20.h,
                              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidgetOne(
                  onTap: () async {
                    ///---keyboard-close
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if (_userProfileUpdateFormKey.currentState!.validate()) {
                      if (editProfileController.profileImage != null) {
                        log("${editProfileController.profileImage!.path} Inside If");
                        log(editProfileController
                            .userProfileFirstNameController.text);
                        log(editProfileController
                            .userProfileLastNameController.text);
                        log(editProfileController
                            .userProfileUserNameController.text);
                        log(editProfileController
                            .userProfileDescriptionController.text);
                        log(editProfileController
                            .userProfileZipCodeController.text);
                        log(editProfileController
                            .userProfileAddressLine1Controller.text);
                        Get.find<GeneralController>()
                            .updateFormLoaderController(true);

                        editUserProfileImageRepo(
                          editProfileController
                              .userProfileFirstNameController.text,
                          editProfileController
                              .userProfileLastNameController.text,
                          editProfileController
                              .userProfileUserNameController.text,
                          editProfileController
                              .userProfileDescriptionController.text,
                          editProfileController
                              .userProfileAddressLine1Controller.text,
                          editProfileController
                              .userProfileAddressLine2Controller.text,
                          // 1,
                          // 1,
                          // 1,
                          editProfileController
                              .userProfileZipCodeController.text,
                          [1],
                          [1],
                          [1],
                          editProfileController.profileImage,
                          editProfileController.profileImage,
                        );
                      } else if (generalLogic
                                  .currentLawyerModel!.loginInfo!.image !=
                              null &&
                          editProfileController.profileImage == null) {
                        log(editProfileController
                            .userProfileFirstNameController.text);
                        log(editProfileController
                            .userProfileLastNameController.text);
                        log(editProfileController
                            .userProfileUserNameController.text);
                        log(editProfileController
                            .userProfileDescriptionController.text);
                        log(editProfileController
                            .userProfileZipCodeController.text);
                        log(editProfileController
                            .userProfileAddressLine1Controller.text);
                        // log(editProfileController
                        //     .profileImage!.path);
                        Get.find<GeneralController>()
                            .updateFormLoaderController(true);
                        postMethod(
                            context,
                            editUserProfileURL,
                            {
                              "logged_in_as": "lawyer",
                              "first_name": editProfileController
                                  .userProfileFirstNameController.text,
                              "last_name": editProfileController
                                  .userProfileLastNameController.text,
                              "user_name": editProfileController
                                  .userProfileUserNameController.text,
                              "description": editProfileController
                                  .userProfileDescriptionController.text,
                              "address_line_1": editProfileController
                                  .userProfileAddressLine1Controller.text,
                              "address_line_2": editProfileController
                                  .userProfileAddressLine2Controller.text,
                              "city_id": 1,
                              "country_id": 1,
                              "state_id": 1,
                              "zip_code": editProfileController
                                  .userProfileZipCodeController.text,
                              "lawyer_categories": [1],
                              "languages": [1],
                              "tags": [1],
                            },
                            true,
                            editUserProfileDataRepo);
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                title: 'Sorry',
                                titleColor: AppColors.customDialogErrorColor,
                                descriptions: 'Inside Screen Popup',
                                text: 'Ok',
                                functionCall: () {
                                  Navigator.pop(context);
                                },
                                img: 'assets/icons/dialog_error.png',
                              );
                            });
                      }
                    }
                  },
                  buttonText: "Save Profile",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
              SizedBox(width: 10.w),
              ButtonWidgetOne(
                  onTap: () {
                    setState(() {
                      tabController!.index = 3;
                      file = null;
                    });
                  },
                  buttonText: "Continue",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ],
      ),
    );
  }

// Experience of Lawyer
  Widget experience(
      BuildContext context,
      EditProfileController editProfileController,
      GeneralController generalController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            hintText: 'Company Name',
            controller: editProfileController.experienceCompanyNameController,
            onChanged: (String? value) {
              editProfileController.experienceCompanyNameController.text ==
                  value;
              editProfileController.update();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Company Name Field Required';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20.h),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            maxLines: 4,
            controller: editProfileController.experienceDescriptionController,
            onChanged: (String? value) {
              editProfileController.experienceDescriptionController.text ==
                  value;
              editProfileController.update();
            },
            decoration: InputDecoration(
              hintText: "Description",
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
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'Start Date',
                  controller:
                      editProfileController.experienceStartDateController,
                  onChanged: (String? value) {
                    editProfileController.experienceStartDateController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Start Date Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormFieldWidget(
                  hintText: 'End Date',
                  controller: editProfileController.experienceEndDateController,
                  onChanged: (String? value) {
                    editProfileController.experienceEndDateController.text ==
                        value;
                    editProfileController.update();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'End Date Field Required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              filePick();
            },
            child: Container(
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
                          SizedBox(width: 10.w),
                          file == null
                              ? const Text(
                                  "Certificate file name here",
                                  style: AppTextStyles.hintTextStyle1,
                                )
                              : Text(
                                  file!.path
                                      .toString()
                                      .split("/")
                                      .last
                                      .toString(),
                                  style: AppTextStyles.hintTextStyle1,
                                ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      file == null
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  file = null;
                                });
                              },
                              child: Image.asset(
                                "assets/icons/Subtract.png",
                                color: AppColors.primaryColor,
                                height: 20.h,
                              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidgetOne(
                  onTap: () async {
                    ///---keyboard-close
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if (_userProfileUpdateFormKey.currentState!.validate()) {
                      //   if (editProfileController.profileImage != null) {
                      //     log("${editProfileController.profileImage!.path} Inside If");
                      //     log(editProfileController
                      //         .userProfileFirstNameController.text);
                      //     log(editProfileController
                      //         .userProfileLastNameController.text);
                      //     log(editProfileController
                      //         .userProfileUserNameController.text);
                      //     log(editProfileController
                      //         .userProfileDescriptionController.text);
                      //     log(editProfileController
                      //         .userProfileZipCodeController.text);
                      //     log(editProfileController
                      //         .userProfileAddressLine1Controller.text);
                      //     Get.find<GeneralController>()
                      //         .updateFormLoaderController(true);

                      //     editUserProfileImageRepo(
                      //       editProfileController
                      //           .userProfileFirstNameController.text,
                      //       editProfileController
                      //           .userProfileLastNameController.text,
                      //       editProfileController
                      //           .userProfileUserNameController.text,
                      //       editProfileController
                      //           .userProfileDescriptionController.text,
                      //       editProfileController
                      //           .userProfileAddressLine1Controller.text,
                      //       editProfileController
                      //           .userProfileAddressLine2Controller.text,
                      //       // 1,
                      //       // 1,
                      //       // 1,
                      //       editProfileController
                      //           .userProfileZipCodeController.text,
                      //       [1],
                      //       [1],
                      //       [1],
                      //       editProfileController.profileImage,
                      //       editProfileController.profileImage,
                      //     );
                      //   } else if (generalLogic
                      //               .currentLawyerModel!.loginInfo!.image !=
                      //           null &&
                      //       editProfileController.profileImage == null) {
                      //     log(editProfileController
                      //         .userProfileFirstNameController.text);
                      //     log(editProfileController
                      //         .userProfileLastNameController.text);
                      //     log(editProfileController
                      //         .userProfileUserNameController.text);
                      //     log(editProfileController
                      //         .userProfileDescriptionController.text);
                      //     log(editProfileController
                      //         .userProfileZipCodeController.text);
                      //     log(editProfileController
                      //         .userProfileAddressLine1Controller.text);
                      //     // log(editProfileController
                      //     //     .profileImage!.path);
                      //     Get.find<GeneralController>()
                      //         .updateFormLoaderController(true);
                      //     postMethod(
                      //         context,
                      //         editUserProfileURL,
                      //         {
                      //           "logged_in_as": "lawyer",
                      //           "first_name": editProfileController
                      //               .userProfileFirstNameController.text,
                      //           "last_name": editProfileController
                      //               .userProfileLastNameController.text,
                      //           "user_name": editProfileController
                      //               .userProfileUserNameController.text,
                      //           "description": editProfileController
                      //               .userProfileDescriptionController.text,
                      //           "address_line_1": editProfileController
                      //               .userProfileAddressLine1Controller.text,
                      //           "address_line_2": editProfileController
                      //               .userProfileAddressLine2Controller.text,
                      //           "city_id": 1,
                      //           "country_id": 1,
                      //           "state_id": 1,
                      //           "zip_code": editProfileController
                      //               .userProfileZipCodeController.text,
                      //           "lawyer_categories": [1],
                      //           "languages": [1],
                      //           "tags": [1],
                      //         },
                      //         true,
                      //         editUserProfileDataRepo);
                      //   } else {
                      //     showDialog(
                      //         context: context,
                      //         barrierDismissible: false,
                      //         builder: (BuildContext context) {
                      //           return CustomDialogBox(
                      //             title: 'Sorry',
                      //             titleColor: AppColors.customDialogErrorColor,
                      //             descriptions: 'Inside Screen Popup',
                      //             text: 'Ok',
                      //             functionCall: () {
                      //               Navigator.pop(context);
                      //             },
                      //             img: 'assets/icons/dialog_error.png',
                      //           );
                      //         });
                      //   }
                    }
                  },
                  buttonText: "Save Profile",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
              SizedBox(width: 10.w),
              ButtonWidgetOne(
                  onTap: () {
                    setState(() {
                      tabController!.index = 3;
                      file = null;
                    });
                  },
                  buttonText: "Continue",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget basicInformation(
      BuildContext context,
      EditProfileController editProfileController,
      GeneralController generalController) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        child: Form(
          key: _userProfileUpdateFormKey,
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
                    GestureDetector(
                      onTap: () {
                        imagePickerDialog(context);
                      },
                      child: editProfileLogic.profileImage == null
                          ? generalLogic.currentLawyerModel == null
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  decoration: BoxDecoration(
                                      color: AppColors.offWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "assets/icons/Upload_duotone_line.png"),
                                      const SizedBox(height: 4),
                                      const Text(
                                        "Upload image",
                                        style: AppTextStyles.bodyTextStyle1,
                                      )
                                    ],
                                  ),
                                )
                              : generalLogic.currentLawyerModel!.loginInfo!
                                          .image ==
                                      null
                                  ? Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      decoration: BoxDecoration(
                                          color: AppColors.offWhite,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.primaryColor)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              "assets/icons/Upload_duotone_line.png"),
                                          const SizedBox(height: 4),
                                          const Text(
                                            "Upload image",
                                            style: AppTextStyles.bodyTextStyle1,
                                          )
                                        ],
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.network(
                                        scale: 4.h,
                                        '$mediaUrl${generalLogic.currentLawyerModel!.loginInfo!.image}',
                                        fit: BoxFit.cover,
                                        height: 110.h,
                                        width: 120.w,
                                      ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                scale: 3.h,
                                // '$mediaUrl${generalLogic.currentLawyerModel!.loginInfo!.image}',
                                editProfileController.profileImage!,
                                height: 110.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          generalController.storageBox.read('authToken') != null
                              ? "${generalController.currentLawyerModel!.loginInfo!.firstName} ${generalController.currentLawyerModel!.loginInfo!.lastName}"
                              : "",
                          style: AppTextStyles.bodyTextStyle5,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          generalController.storageBox.read('authToken') != null
                              ? "${generalController.currentLawyerModel!.email}"
                              : "",
                          style: AppTextStyles.bodyTextStyle6,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              TextFormFieldWidget(
                hintText: '* First Name',
                controller:
                    editProfileController.userProfileFirstNameController,
                // initialText: editUserProfileLogic
                //     .userProfileFirstNameController.text,
                onChanged: (String? value) {
                  editProfileController.userProfileFirstNameController.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First Name Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* Last Name',
                controller: editProfileController.userProfileLastNameController,
                onChanged: (String? value) {
                  editProfileController.userProfileLastNameController.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Last Name Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* User Name',
                controller: editProfileController.userProfileUserNameController,
                onChanged: (String? value) {
                  editProfileController.userProfileUserNameController.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'User Name Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* Description',
                controller:
                    editProfileController.userProfileDescriptionController,
                // initialText: editProfileController
                //         .userProfileDescriptionController
                //         .text
                //         .isEmpty
                //     ? ''
                //     : editProfileController
                //         .userProfileDescriptionController.text,
                onChanged: (String? value) {
                  editProfileController.userProfileDescriptionController.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* Address Line 1',
                controller:
                    editProfileController.userProfileAddressLine1Controller,
                onChanged: (String? value) {
                  editProfileController
                          .userProfileAddressLine1Controller.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Address Line 1 Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* Address Line 2',
                controller:
                    editProfileController.userProfileAddressLine2Controller,
                onChanged: (String? value) {
                  editProfileController
                          .userProfileAddressLine2Controller.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Address Line 2 Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),
              TextFormFieldWidget(
                hintText: '* Zip Code',
                controller: editProfileController.userProfileZipCodeController,
                onChanged: (String? value) {
                  editProfileController.userProfileZipCodeController.text ==
                      value;
                  editProfileController.update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Zip Code Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidgetOne(
                      onTap: () async {
                        ///---keyboard-close
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (_userProfileUpdateFormKey.currentState!
                            .validate()) {
                          if (editProfileController.profileImage != null) {
                            log("${editProfileController.profileImage!.path} Inside If");
                            log(editProfileController
                                .userProfileFirstNameController.text);
                            log(editProfileController
                                .userProfileLastNameController.text);
                            log(editProfileController
                                .userProfileUserNameController.text);
                            log(editProfileController
                                .userProfileDescriptionController.text);
                            log(editProfileController
                                .userProfileZipCodeController.text);
                            log(editProfileController
                                .userProfileAddressLine1Controller.text);
                            log(editProfileController.profileImage!.path);
                            Get.find<GeneralController>()
                                .updateFormLoaderController(true);

                            editUserProfileImageRepo(
                              editProfileController
                                  .userProfileFirstNameController.text,
                              editProfileController
                                  .userProfileLastNameController.text,
                              editProfileController
                                  .userProfileUserNameController.text,
                              editProfileController
                                  .userProfileDescriptionController.text,
                              editProfileController
                                  .userProfileAddressLine1Controller.text,
                              editProfileController
                                  .userProfileAddressLine2Controller.text,
                              // 1,
                              // 1,
                              // 1,
                              editProfileController
                                  .userProfileZipCodeController.text,
                              [1],
                              [1],
                              [1],
                              editProfileController.profileImage,
                              editProfileController.profileImage,
                            );
                          } else if (generalLogic
                                      .currentLawyerModel!.loginInfo!.image !=
                                  null &&
                              editProfileController.profileImage == null) {
                            log(editProfileController
                                .userProfileFirstNameController.text);
                            log(editProfileController
                                .userProfileLastNameController.text);
                            log(editProfileController
                                .userProfileUserNameController.text);
                            log(editProfileController
                                .userProfileDescriptionController.text);
                            log(editProfileController
                                .userProfileZipCodeController.text);
                            log(editProfileController
                                .userProfileAddressLine1Controller.text);
                            // log(editProfileController.profileImage!.path);
                            Get.find<GeneralController>()
                                .updateFormLoaderController(true);
                            postMethod(
                                context,
                                editUserProfileURL,
                                {
                                  "logged_in_as": "lawyer",
                                  "first_name": editProfileController
                                      .userProfileFirstNameController.text,
                                  "last_name": editProfileController
                                      .userProfileLastNameController.text,
                                  "user_name": editProfileController
                                      .userProfileUserNameController.text,
                                  "description": editProfileController
                                      .userProfileDescriptionController.text,
                                  "address_line_1": editProfileController
                                      .userProfileAddressLine1Controller.text,
                                  "address_line_2": editProfileController
                                      .userProfileAddressLine2Controller.text,
                                  "city_id": 1,
                                  "country_id": 1,
                                  "state_id": 1,
                                  "zip_code": editProfileController
                                      .userProfileZipCodeController.text,
                                  "lawyer_categories": [1],
                                  "languages": [1],
                                  "tags": [1],
                                },
                                true,
                                editUserProfileDataRepo);
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return CustomDialogBox(
                                    title: 'Sorry',
                                    titleColor:
                                        AppColors.customDialogErrorColor,
                                    descriptions: 'Inside Screen Popup',
                                    text: 'Ok',
                                    functionCall: () {
                                      Navigator.pop(context);
                                    },
                                    img: 'assets/icons/dialog_error.png',
                                  );
                                });
                          }
                        }
                      },
                      buttonText: "Save Profile",
                      buttonTextStyle: AppTextStyles.bodyTextStyle8,
                      borderRadius: 10,
                      buttonColor: AppColors.primaryColor),
                  SizedBox(width: 10.w),
                  ButtonWidgetOne(
                      onTap: () async {
                        ///---keyboard-close
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        setState(() {
                          tabController!.index = 1;
                        });
                      },
                      buttonText: "Continue",
                      buttonTextStyle: AppTextStyles.bodyTextStyle8,
                      borderRadius: 10,
                      buttonColor: AppColors.primaryColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void imagePickerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Get.find<EditProfileController>().profileImagesList = [];
                    });
                    Get.find<EditProfileController>().profileImagesList.add(
                        await ImagePickerGC.pickImage(
                            enableCloseButton: true,
                            context: context,
                            source: ImgSource.Camera,
                            barrierDismissible: true,
                            imageQuality: 10,
                            maxWidth: 400,
                            maxHeight: 600));
                    setState(() {
                      Get.find<EditProfileController>().profileImage = File(
                          Get.find<EditProfileController>()
                              .profileImagesList[0]
                              .path);
                    });
                  },
                  child: const Text(
                    'Camera',
                    style: AppTextStyles.buttonTextStyle8,
                  )),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Get.find<EditProfileController>().profileImagesList = [];
                    });
                    Get.find<EditProfileController>().profileImagesList.add(
                        await ImagePickerGC.pickImage(
                            enableCloseButton: true,
                            context: context,
                            source: ImgSource.Gallery,
                            barrierDismissible: true,
                            imageQuality: 10,
                            maxWidth: 400,
                            maxHeight: 600));
                    setState(() {
                      Get.find<EditProfileController>().profileImage = File(
                          Get.find<EditProfileController>()
                              .profileImagesList[0]
                              .path);
                    });
                  },
                  child: const Text(
                    'Gallery',
                    style: AppTextStyles.buttonTextStyle8,
                  )),
            ],
          );
        });
  }
}

class LawyerCertificateWidget extends StatefulWidget {
  LawyerCertificateWidget({super.key});

  @override
  State<LawyerCertificateWidget> createState() =>
      _LawyerCertificateWidgetState();
}

class _LawyerCertificateWidgetState extends State<LawyerCertificateWidget> {
  final GlobalKey<FormState> _userProfileUpdateFormKey = GlobalKey();

  bool isVisibleEducationForm = false;
  File? file;
  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });

      print(file!.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    getMethod(context, getUserProfileCertificateURL, null, true,
        getLawyerCertificateRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<EditProfileController>(
          builder: (editProfileController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Form(
              key: _userProfileUpdateFormKey,
              child: Column(
                children: [
                  isVisibleEducationForm == false
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Add New Lawyer Certificate",
                                style: AppTextStyles.buttonTextStyle7,
                              ),
                              SizedBox(
                                width: 70.w,
                                child: ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = true;
                                        if (editProfileController
                                            .certificateNameController
                                            .text
                                            .isNotEmpty) {
                                          editProfileController
                                              .certificateNameController
                                              .clear();
                                          editProfileController
                                              .certificateDescriptionController
                                              .clear();
                                        }
                                      });
                                    },
                                    buttonText: 'Add',
                                    buttonTextStyle:
                                        AppTextStyles.buttonTextStyle2,
                                    borderRadius: 8,
                                    buttonColor: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  isVisibleEducationForm == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldWidget(
                              hintText: 'Certificate Name',
                              controller: editProfileController
                                  .certificateNameController,
                              onChanged: (String? value) {
                                editProfileController
                                        .certificateNameController.text ==
                                    value;
                                editProfileController.update();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Certificate Name Field Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 20.h),
                            TextField(
                              style: AppTextStyles.hintTextStyle1,
                              maxLines: 4,
                              controller: editProfileController
                                  .certificateDescriptionController,
                              onChanged: (String? value) {
                                editProfileController
                                        .certificateDescriptionController
                                        .text ==
                                    value;
                                editProfileController.update();
                              },
                              decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: AppTextStyles.hintTextStyle1,
                                labelStyle: AppTextStyles.hintTextStyle1,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                filePick();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 24),
                                decoration: BoxDecoration(
                                    color: AppColors.offWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryColor)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/File_dock.png",
                                              height: 24.h,
                                            ),
                                            SizedBox(width: 10.w),
                                            file == null
                                                ? const Text(
                                                    "Certificate file name here",
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  )
                                                : Text(
                                                    file!.path
                                                        .toString()
                                                        .split("/")
                                                        .last
                                                        .toString(),
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  ),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        file == null
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    file = null;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/icons/Subtract.png",
                                                  color: AppColors.primaryColor,
                                                  height: 20.h,
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
                                    child: Divider(
                                      height: 2,
                                      thickness: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = false;
                                      });
                                    },
                                    buttonText: "Back",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                                SizedBox(width: 10.w),
                                ButtonWidgetOne(
                                    onTap: () async {
                                      ///---keyboard-close
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (_userProfileUpdateFormKey
                                          .currentState!
                                          .validate()) {
                                        ///post-method
                                        addUserProfileCertificateDataRepo(
                                            editProfileController
                                                .certificateNameController.text,
                                            editProfileController
                                                .certificateDescriptionController
                                                .text,
                                            file,
                                            1);
                                      } else {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                title: 'Sorry',
                                                titleColor: AppColors
                                                    .customDialogErrorColor,
                                                descriptions:
                                                    'Inside Screen Popup',
                                                text: 'Ok',
                                                functionCall: () {
                                                  Navigator.pop(context);
                                                },
                                                img:
                                                    'assets/icons/dialog_error.png',
                                              );
                                            });
                                      }
                                    },
                                    buttonText: "Submit",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                              ],
                            ),
                          ],
                        )
                      : editProfileController
                              .lawyerProfileCertificateForPagination.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: editProfileController
                                  .lawyerProfileCertificateForPagination.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 14.h),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1.3),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          editProfileController
                                              .lawyerProfileCertificateForPagination[
                                                  index]
                                              .name!,
                                          style: AppTextStyles.bodyTextStyle11),
                                      Text("Download",
                                          style: AppTextStyles.bodyTextStyle11),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                setState(() {
                                                  isVisibleEducationForm = true;
                                                  editProfileController
                                                          .certificateNameController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileCertificateForPagination[
                                                              index]
                                                          .name!;
                                                  editProfileController
                                                          .certificateDescriptionController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileCertificateForPagination[
                                                              index]
                                                          .description!;
                                                });
                                              },
                                              buttonIcon: Icons.edit,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                deleteMethod(
                                                    context,
                                                    "$addEditUserProfileCertificateURL/${editProfileController.lawyerProfileCertificateForPagination[index].id!}",
                                                    null,
                                                    true,
                                                    deleteUserProfileCertificateDataRepo);
                                              },
                                              buttonIcon: Icons.delete,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 80.h),
                                child: const Text(
                                  "No Data Found",
                                  style: AppTextStyles.bodyTextStyle10,
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

class LayerExperienceWidget extends StatefulWidget {
  LayerExperienceWidget({super.key});

  @override
  State<LayerExperienceWidget> createState() => _LayerExperienceWidgetState();
}

class _LayerExperienceWidgetState extends State<LayerExperienceWidget> {
  final GlobalKey<FormState> _userProfileUpdateFormKey = GlobalKey();

  bool isVisibleEducationForm = false;
  File? file;
  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });

      print(file!.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    getMethod(context, getUserProfileExperiencesURL, null, true,
        getLawyerExperienceRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<EditProfileController>(
          builder: (editProfileController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Form(
              key: _userProfileUpdateFormKey,
              child: Column(
                children: [
                  isVisibleEducationForm == false
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Add New Lawyer Experience",
                                style: AppTextStyles.buttonTextStyle7,
                              ),
                              SizedBox(
                                width: 70.w,
                                child: ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = true;
                                        if (editProfileController
                                            .experienceCompanyNameController
                                            .text
                                            .isNotEmpty) {
                                          editProfileController
                                              .experienceCompanyNameController
                                              .clear();
                                          editProfileController
                                              .experienceDescriptionController
                                              .clear();
                                        }
                                      });
                                    },
                                    buttonText: 'Add',
                                    buttonTextStyle:
                                        AppTextStyles.buttonTextStyle2,
                                    borderRadius: 8,
                                    buttonColor: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  isVisibleEducationForm == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldWidget(
                              hintText: 'Company Name',
                              controller: editProfileController
                                  .experienceCompanyNameController,
                              onChanged: (String? value) {
                                editProfileController
                                        .experienceCompanyNameController.text ==
                                    value;
                                editProfileController.update();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Company Name Field Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 20.h),
                            TextField(
                              style: AppTextStyles.hintTextStyle1,
                              maxLines: 4,
                              controller: editProfileController
                                  .experienceDescriptionController,
                              onChanged: (String? value) {
                                editProfileController
                                        .experienceDescriptionController.text ==
                                    value;
                                editProfileController.update();
                              },
                              decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: AppTextStyles.hintTextStyle1,
                                labelStyle: AppTextStyles.hintTextStyle1,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'Start Date',
                                  controller: editProfileController
                                      .experienceStartDateController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .experienceStartDateController
                                            .text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Start Date Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'End Date',
                                  controller: editProfileController
                                      .experienceEndDateController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .experienceEndDateController.text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'End Date Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ]),
                            GestureDetector(
                              onTap: () {
                                filePick();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 24),
                                decoration: BoxDecoration(
                                    color: AppColors.offWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryColor)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/File_dock.png",
                                              height: 24.h,
                                            ),
                                            SizedBox(width: 10.w),
                                            file == null
                                                ? const Text(
                                                    "Experience file name here",
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  )
                                                : Text(
                                                    file!.path
                                                        .toString()
                                                        .split("/")
                                                        .last
                                                        .toString(),
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  ),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        file == null
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    file = null;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/icons/Subtract.png",
                                                  color: AppColors.primaryColor,
                                                  height: 20.h,
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
                                    child: Divider(
                                      height: 2,
                                      thickness: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = false;
                                      });
                                    },
                                    buttonText: "Back",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                                SizedBox(width: 10.w),
                                ButtonWidgetOne(
                                    onTap: () async {
                                      ///---keyboard-close
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (_userProfileUpdateFormKey
                                          .currentState!
                                          .validate()) {
                                        ///post-method
                                        addUserProfileExperienceDataRepo(
                                            editProfileController
                                                .experienceCompanyNameController
                                                .text,
                                            editProfileController
                                                .experienceDescriptionController
                                                .text,
                                            editProfileController
                                                .experienceStartDateController
                                                .text,
                                            editProfileController
                                                .experienceEndDateController
                                                .text,
                                            file,
                                            1);
                                      } else {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                title: 'Sorry',
                                                titleColor: AppColors
                                                    .customDialogErrorColor,
                                                descriptions:
                                                    'Inside Screen Popup',
                                                text: 'Ok',
                                                functionCall: () {
                                                  Navigator.pop(context);
                                                },
                                                img:
                                                    'assets/icons/dialog_error.png',
                                              );
                                            });
                                      }
                                    },
                                    buttonText: "Submit",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                              ],
                            ),
                          ],
                        )
                      : editProfileController
                              .lawyerProfileExperienceForPagination.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: editProfileController
                                  .lawyerProfileExperienceForPagination.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 14.h),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1.3),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          editProfileController
                                              .lawyerProfileExperienceForPagination[
                                                  index]
                                              .company!,
                                          style: AppTextStyles.bodyTextStyle11),
                                      Text("Download",
                                          style: AppTextStyles.bodyTextStyle11),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                setState(() {
                                                  isVisibleEducationForm = true;
                                                  editProfileController
                                                          .experienceCompanyNameController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileExperienceForPagination[
                                                              index]
                                                          .company!;
                                                  editProfileController
                                                          .experienceDescriptionController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileExperienceForPagination[
                                                              index]
                                                          .description!;
                                                  editProfileController
                                                          .experienceStartDateController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileExperienceForPagination[
                                                              index]
                                                          .from!;
                                                  editProfileController
                                                          .experienceEndDateController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileExperienceForPagination[
                                                              index]
                                                          .to!;
                                                });
                                              },
                                              buttonIcon: Icons.edit,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                deleteMethod(
                                                    context,
                                                    "$addEditUserProfileExperienceURL/${editProfileController.lawyerProfileExperienceForPagination[index].id!}",
                                                    null,
                                                    true,
                                                    deleteUserProfileExperienceDataRepo);
                                              },
                                              buttonIcon: Icons.delete,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 80.h),
                                child: const Text(
                                  "No Data Found",
                                  style: AppTextStyles.bodyTextStyle10,
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

class LayerEducationWidget extends StatefulWidget {
  LayerEducationWidget({super.key});

  @override
  State<LayerEducationWidget> createState() => _LayerEducationWidgetState();
}

class _LayerEducationWidgetState extends State<LayerEducationWidget> {
  final GlobalKey<FormState> _userProfileUpdateFormKey = GlobalKey();

  bool isVisibleEducationForm = false;
  File? file;
  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });

      print(file!.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    getMethod(context, getUserProfileEducationsURL, null, true,
        getLawyerEducationRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<EditProfileController>(
          builder: (editProfileController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Form(
              key: _userProfileUpdateFormKey,
              child: Column(
                children: [
                  isVisibleEducationForm == false
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Add New Lawyer Education",
                                style: AppTextStyles.buttonTextStyle7,
                              ),
                              SizedBox(
                                width: 70.w,
                                child: ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = true;
                                        if (editProfileController
                                            .educationInstituteNameController
                                            .text
                                            .isNotEmpty) {
                                          editProfileController
                                              .educationInstituteNameController
                                              .clear();
                                          editProfileController
                                              .educationDescriptionController
                                              .clear();
                                          editProfileController
                                              .educationStartDateController
                                              .clear();
                                          editProfileController
                                              .educationEndDateController
                                              .clear();
                                          editProfileController
                                              .educationDegreeController
                                              .clear();
                                          editProfileController
                                              .educationSubjectController
                                              .clear();
                                        }
                                      });
                                    },
                                    buttonText: 'Add',
                                    buttonTextStyle:
                                        AppTextStyles.buttonTextStyle2,
                                    borderRadius: 8,
                                    buttonColor: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  isVisibleEducationForm == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldWidget(
                              hintText: 'Institute Name',
                              controller: editProfileController
                                  .educationInstituteNameController,
                              onChanged: (String? value) {
                                editProfileController
                                        .educationInstituteNameController
                                        .text ==
                                    value;
                                editProfileController.update();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Institute Name Field Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 20.h),
                            TextField(
                              style: AppTextStyles.hintTextStyle1,
                              maxLines: 4,
                              controller: editProfileController
                                  .educationDescriptionController,
                              onChanged: (String? value) {
                                editProfileController
                                        .educationDescriptionController.text ==
                                    value;
                                editProfileController.update();
                              },
                              decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: AppTextStyles.hintTextStyle1,
                                labelStyle: AppTextStyles.hintTextStyle1,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'Degree',
                                  controller: editProfileController
                                      .educationDegreeController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .educationDegreeController.text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Degree Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'Subject',
                                  controller: editProfileController
                                      .educationSubjectController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .educationSubjectController.text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Subject Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ]),
                            SizedBox(height: 20.h),
                            Row(children: [
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'Start Date',
                                  controller: editProfileController
                                      .educationStartDateController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .educationStartDateController
                                            .text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Start Date Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: TextFormFieldWidget(
                                  hintText: 'End Date',
                                  controller: editProfileController
                                      .educationEndDateController,
                                  onChanged: (String? value) {
                                    editProfileController
                                            .educationEndDateController.text ==
                                        value;
                                    editProfileController.update();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'End Date Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ]),
                            GestureDetector(
                              onTap: () {
                                filePick();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 24),
                                decoration: BoxDecoration(
                                    color: AppColors.offWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryColor)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/File_dock.png",
                                              height: 24.h,
                                            ),
                                            SizedBox(width: 10.w),
                                            file == null
                                                ? const Text(
                                                    "Education file name here",
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  )
                                                : Text(
                                                    file!.path
                                                        .toString()
                                                        .split("/")
                                                        .last
                                                        .toString(),
                                                    style: AppTextStyles
                                                        .hintTextStyle1,
                                                  ),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        file == null
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    file = null;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/icons/Subtract.png",
                                                  color: AppColors.primaryColor,
                                                  height: 20.h,
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 6, 24, 16),
                                    child: Divider(
                                      height: 2,
                                      thickness: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidgetOne(
                                    onTap: () {
                                      setState(() {
                                        isVisibleEducationForm = false;
                                      });
                                    },
                                    buttonText: "Back",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                                SizedBox(width: 10.w),
                                ButtonWidgetOne(
                                    onTap: () async {
                                      ///---keyboard-close
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      if (_userProfileUpdateFormKey
                                          .currentState!
                                          .validate()) {
                                        ///post-method
                                        addUserProfileEducationDataRepo(
                                            editProfileController
                                                .educationInstituteNameController
                                                .text,
                                            editProfileController
                                                .educationDescriptionController
                                                .text,
                                            editProfileController
                                                .educationStartDateController
                                                .text,
                                            editProfileController
                                                .educationEndDateController
                                                .text,
                                            editProfileController
                                                .educationDegreeController.text,
                                            editProfileController
                                                .educationSubjectController
                                                .text,
                                            file!,
                                            1);
                                      } else {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                title: 'Sorry',
                                                titleColor: AppColors
                                                    .customDialogErrorColor,
                                                descriptions:
                                                    'Inside Screen Popup',
                                                text: 'Ok',
                                                functionCall: () {
                                                  Navigator.pop(context);
                                                },
                                                img:
                                                    'assets/icons/dialog_error.png',
                                              );
                                            });
                                      }
                                    },
                                    buttonText: "Submit",
                                    buttonTextStyle:
                                        AppTextStyles.bodyTextStyle8,
                                    borderRadius: 10,
                                    buttonColor: AppColors.primaryColor),
                              ],
                            ),
                          ],
                        )
                      : editProfileController
                              .lawyerProfileEducationForPagination.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: editProfileController
                                  .lawyerProfileEducationForPagination.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 14.h),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1.3),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          editProfileController
                                              .lawyerProfileEducationForPagination[
                                                  index]
                                              .institute!,
                                          style: AppTextStyles.bodyTextStyle11),
                                      Text("Download",
                                          style: AppTextStyles.bodyTextStyle11),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                setState(() {
                                                  isVisibleEducationForm = true;
                                                  editProfileController
                                                          .educationInstituteNameController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .institute!;
                                                  editProfileController
                                                          .educationDescriptionController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .description!;
                                                  editProfileController
                                                          .educationStartDateController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .from!;
                                                  editProfileController
                                                          .educationEndDateController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .to!;
                                                  editProfileController
                                                          .educationDegreeController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .degree!;
                                                  editProfileController
                                                          .educationSubjectController
                                                          .text =
                                                      editProfileController
                                                          .lawyerProfileEducationForPagination[
                                                              index]
                                                          .subject!;
                                                });
                                              },
                                              buttonIcon: Icons.edit,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          SizedBox(
                                            width: 40.w,
                                            height: 26.h,
                                            child: ButtonWidgetFive(
                                              onTap: () {
                                                deleteMethod(
                                                    context,
                                                    "$addEditUserProfileEducationURL/${editProfileController.lawyerProfileEducationForPagination[index].id!}",
                                                    null,
                                                    true,
                                                    deleteUserProfileEducationDataRepo);
                                              },
                                              buttonIcon: Icons.delete,
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 8,
                                              buttonColor:
                                                  AppColors.primaryColor,
                                              iconSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 80.h),
                                child: const Text(
                                  "No Data Found",
                                  style: AppTextStyles.bodyTextStyle10,
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
