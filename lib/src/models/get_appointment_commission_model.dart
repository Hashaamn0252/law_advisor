import 'dart:convert';
GetAppointmentCommissionModel getAppointmentCommissionModelFromJson(String str) => GetAppointmentCommissionModel.fromJson(json.decode(str));
String getAppointmentCommissionModelToJson(GetAppointmentCommissionModel data) => json.encode(data.toJson());
class GetAppointmentCommissionModel {
  GetAppointmentCommissionModel({
      Data? data, 
      bool? success, 
      String? message, 
      dynamic errors,}){
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
}

  GetAppointmentCommissionModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
GetAppointmentCommissionModel copyWith({  Data? data,
  bool? success,
  String? message,
  dynamic errors,
}) => GetAppointmentCommissionModel(  data: data ?? _data,
  success: success ?? _success,
  message: message ?? _message,
  errors: errors ?? _errors,
);
  Data? get data => _data;
  bool? get success => _success;
  String? get message => _message;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      num? appointmentTypeId, 
      num? rate, 
      String? commissionType, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _appointmentTypeId = appointmentTypeId;
    _rate = rate;
    _commissionType = commissionType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentTypeId = json['appointment_type_id'];
    _rate = json['rate'];
    _commissionType = json['commission_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _appointmentTypeId;
  num? _rate;
  String? _commissionType;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? appointmentTypeId,
  num? rate,
  String? commissionType,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  appointmentTypeId: appointmentTypeId ?? _appointmentTypeId,
  rate: rate ?? _rate,
  commissionType: commissionType ?? _commissionType,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get appointmentTypeId => _appointmentTypeId;
  num? get rate => _rate;
  String? get commissionType => _commissionType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_type_id'] = _appointmentTypeId;
    map['rate'] = _rate;
    map['commission_type'] = _commissionType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}