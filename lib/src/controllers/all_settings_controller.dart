import 'package:get/get.dart';
import '../models/all_settings_model.dart';

class GetAllSettingsController extends GetxController {
  GetAllSettingsModel getAllSettingsModel = GetAllSettingsModel();

  getDisplayAmount(amount) {
    if (Get.find<GetAllSettingsController>()
            .getAllSettingsModel
            .data!
            .defaultCurrency !=
        null) {
      if (Get.find<GetAllSettingsController>()
              .getAllSettingsModel
              .data!
              .defaultCurrency!
              .direction ==
          "ltr") {
        return '${Get.find<GetAllSettingsController>().getAllSettingsModel.data!.defaultCurrency!.symbol}${amount.toStringAsFixed(Get.find<GetAllSettingsController>().getAllSettingsModel.data!.defaultCurrency!.decimalPlaces!.toInt())}';
      } else if (Get.find<GetAllSettingsController>()
              .getAllSettingsModel
              .data!
              .defaultCurrency!
              .direction ==
          "rtl") {
        return '${amount.toStringAsFixed(Get.find<GetAllSettingsController>().getAllSettingsModel.data!.defaultCurrency!.decimalPlaces!.toInt())}${Get.find<GetAllSettingsController>().getAllSettingsModel.data!.defaultCurrency!.symbol}';
      }
    } else {
      return amount;
    }
  }

  getDefaultCurrencySymbol() {
    var defaultCurrency = Get.find<GetAllSettingsController>()
        .getAllSettingsModel
        .data!
        .defaultCurrency;
    return defaultCurrency?.symbol ?? '';
  }

  bool getAllSettingsLoader = false;
  updateAllSettingsLoader(bool newValue) {
    getAllSettingsLoader = newValue;
    update();
  }
}
