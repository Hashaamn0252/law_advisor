import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/all_settings_controller.dart';

class AppConfigs {
  AppConfigs._();
  static String baseUrl = "https://legalcare.online/";
  static String apiBaseUrl = "https://legalcare.online/api/v1/";
  static String mediaUrl = "https://legalcare.online/";

  static dynamic agoraAppId = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .agoraAppId ??
      "";
  static dynamic agoraAppCertificate = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .agoraAppCertificate ??
      "";
  static dynamic pusherBeamsInstanceId = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherBeamsInstanceId ??
      "";
  static dynamic pusherBeamsSecretKey = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherBeamsSecretKey ??
      "";
  static dynamic pusherAppId = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherAppId ??
      "";
  static dynamic pusherAppKey = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherAppKey ??
      "";
  static dynamic pusherAppSecret = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherAppSecret ??
      "";
  static dynamic pusherAppCluster = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .pusherAppCluster ??
      "";
  static dynamic stripeKey = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .stripeKey ??
      "";
  static dynamic stripeSecret = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .stripeSecret ??
      "";
  static dynamic googleClientId = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .googleClientId ??
      "";
  static dynamic googleClientSecret = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .googleClientSecret ??
      "";
  static dynamic facebookClientId = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .facebookClientId ??
      "";
  static dynamic facebookClientSecret = Get.find<GetAllSettingsController>()
          .getAllSettingsModel
          .data!
          .facebookClientSecret ??
      "";
  static dynamic appLogo =
      Get.find<GetAllSettingsController>().getAllSettingsModel.data!.logo ?? "";
}
