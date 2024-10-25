import 'package:get/get.dart';
import '../models/get_appointment_commission_model.dart';

class GetAppoinmentCommissionController extends GetxController {
  GetAppointmentCommissionModel getAppointmentCommissionModel =
      GetAppointmentCommissionModel();

  bool getAppointmentCommissionLoader = false;
  updateAppointmentCommissionLoader(bool newValue) {
    getAppointmentCommissionLoader = newValue;
    update();
  }
}
