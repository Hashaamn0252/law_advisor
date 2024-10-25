import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/get_lawyer_profile_certificate_model.dart';
import '../models/get_lawyer_profile_education_model.dart';
import '../models/get_lawyer_profile_experience_model.dart';
import 'general_controller.dart';

class EditProfileController extends GetxController {
  GetLawyerProfileCertificateModel getLawyerProfileCertificateModel =
      GetLawyerProfileCertificateModel(); //  for saving User Certificate Profile
  GetLawyerProfileExperienceModel getLawyerProfileExperienceModel =
      GetLawyerProfileExperienceModel(); //  for saving User Experience Profile
  GetLawyerProfileEducationModel getLawyerProfileEducationModel =
      GetLawyerProfileEducationModel(); //  for saving User Education Profile
  LawyerProfileCertificateModel lawyerProfileCertificateModel =
      LawyerProfileCertificateModel(); //  for saving User Certificate Profile
  LawyerProfileExperienceModel lawyerProfileExperienceModel =
      LawyerProfileExperienceModel(); //  for saving User Experience Profile
  LawyerProfileEducationModel lawyerProfileEducationModel =
      LawyerProfileEducationModel(); //  for saving User Education Profile

  // Basic Information Controllers
  TextEditingController userProfileFirstNameController =
      TextEditingController();
  TextEditingController userProfileLastNameController = TextEditingController();

  TextEditingController userProfileUserNameController = TextEditingController();
  TextEditingController userProfileDescriptionController =
      TextEditingController();
  TextEditingController userProfileAddressLine1Controller =
      TextEditingController();
  TextEditingController userProfileAddressLine2Controller =
      TextEditingController();
  TextEditingController userProfileZipCodeController = TextEditingController();

  // Education Controllers
  TextEditingController educationInstituteNameController =
      TextEditingController();
  TextEditingController educationDescriptionController =
      TextEditingController();
  TextEditingController educationDegreeController = TextEditingController();
  TextEditingController educationSubjectController = TextEditingController();
  TextEditingController educationStartDateController = TextEditingController();
  TextEditingController educationEndDateController = TextEditingController();

  // Certificate Controllers
  TextEditingController certificateNameController = TextEditingController();
  TextEditingController certificateDescriptionController =
      TextEditingController();
  TextEditingController certificateFileController = TextEditingController();

  // Experience Controllers
  TextEditingController experienceCompanyNameController =
      TextEditingController();
  TextEditingController experienceDescriptionController =
      TextEditingController();
  TextEditingController experienceStartDateController = TextEditingController();
  TextEditingController experienceEndDateController = TextEditingController();

  String? userProfileSelectedGender;
  DateTime? userProfileSelectedDate;

  File? profileImage;
  String? uploadedProfileImage;
  List profileImagesList = [];

  List<LawyerProfileCertificateModel> lawyerProfileCertificateForPagination =
      [];
  List<LawyerProfileExperienceModel> lawyerProfileExperienceForPagination = [];
  List<LawyerProfileEducationModel> lawyerProfileEducationForPagination = [];

  bool allLawyerCertificateLoader = false;
  updateLawyerCertificateLoader(bool newValue) {
    allLawyerCertificateLoader = newValue;
    update();
  }

  bool allLawyerExperienceLoader = false;
  updateLawyerExperienceLoader(bool newValue) {
    allLawyerExperienceLoader = newValue;
    update();
  }

  bool allLawyerEducationLoader = false;
  updateLawyerEducationLoader(bool newValue) {
    allLawyerEducationLoader = newValue;
    update();
  }

  ///------------------------------- Lawyer-Certificate-data-check
  bool getLawyerCertificateCheck = false;
  getLawyerCertificateDataCheck(bool value) {
    getLawyerCertificateCheck = value;
    update();
  }

  ///------------------------------- Lawyer-Experience-data-check
  bool getLawyerExperienceCheck = false;
  getLawyerExperienceDataCheck(bool value) {
    getLawyerExperienceCheck = value;
    update();
  }

  ///------------------------------- Lawyer-Experience-data-check
  bool getLawyerEducationCheck = false;
  getLawyerEducationDataCheck(bool value) {
    getLawyerEducationCheck = value;
    update();
  }

  int? selectedLawyerCertificateIndex = 0;
  updateSelectedLawyerCertificateIndex(int? newValue) {
    selectedLawyerCertificateIndex = newValue;
    update();
  }

  int? selectedLawyerExperienceIndex = 0;
  updateSelectedLawyerExperienceIndex(int? newValue) {
    selectedLawyerExperienceIndex = newValue;
    update();
  }

  int? selectedLawyerEducationIndex = 0;
  updateSelectedLawyerEducationIndex(int? newValue) {
    selectedLawyerEducationIndex = newValue;
    update();
  }

  /// Certificate-paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerProfileCertificateModel.data!.meta!.lastPage! >
        getLawyerProfileCertificateModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      update();
    }
  }

  /// Experience-paginated-data-fetch
  Future paginationExperienceDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerProfileExperienceModel.data!.meta!.lastPage! >
        getLawyerProfileExperienceModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      update();
    }
  }

  /// Education-paginated-data-fetch
  Future paginationEducationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerProfileEducationModel.data!.meta!.lastPage! >
        getLawyerProfileEducationModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      update();
    }
  }

  updateLawyerCertificateForPagination(
      LawyerProfileCertificateModel lawyerProfileCertificateModel) {
    lawyerProfileCertificateForPagination.add(lawyerProfileCertificateModel);
    update();
  }

  updateLawyerExperienceForPagination(
      LawyerProfileExperienceModel lawyerProfileExperienceModel) {
    lawyerProfileExperienceForPagination.add(lawyerProfileExperienceModel);
    update();
  }

  updateLawyerEducationForPagination(
      LawyerProfileEducationModel lawyerProfileEducationModel) {
    lawyerProfileEducationForPagination.add(lawyerProfileEducationModel);
    update();
  }

  ///------------------------------- user-profile-data-check
  bool getUserProfileDataCheck = false;

  changeGetUserProfileDataCheck(bool value) {
    getUserProfileDataCheck = value;
    update();
  }
}
