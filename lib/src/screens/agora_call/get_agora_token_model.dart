import 'dart:convert';

GetAgoraTokenModel getAgoraTokenModelFromJson(String str) =>
    GetAgoraTokenModel.fromJson(json.decode(str));
String getAgoraTokenModelToJson(GetAgoraTokenModel data) =>
    json.encode(data.toJson());

class GetAgoraTokenModel {
  GetAgoraTokenModel({
    String? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAgoraTokenModel.fromJson(dynamic json) {
    _data = json['data'];
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  String? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAgoraTokenModel copyWith({
    String? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAgoraTokenModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  String? get data => _data;
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
