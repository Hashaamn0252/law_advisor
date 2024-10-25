import 'dart:convert';
GetResponseModel getResponseModelFromJson(String str) => GetResponseModel.fromJson(json.decode(str));
String getResponseModelToJson(GetResponseModel data) => json.encode(data.toJson());
class GetResponseModel {
  GetResponseModel({
      dynamic data, 
      bool? success, 
      String? message, 
      dynamic errors,}){
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
}

  GetResponseModel.fromJson(dynamic json) {
    _data = json['data'];
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  dynamic _data;
  bool? _success;
  String? _message;
  dynamic _errors;
GetResponseModel copyWith({  dynamic data,
  bool? success,
  String? message,
  dynamic errors,
}) => GetResponseModel(  data: data ?? _data,
  success: success ?? _success,
  message: message ?? _message,
  errors: errors ?? _errors,
);
  dynamic get data => _data;
  bool? get success => _success;
  String? get message => _message;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['success'] = _success;
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }

}