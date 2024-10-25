import 'dart:convert';

GetLiveChatMessagesModel getLiveChatMessagesModelFromJson(String str) =>
    GetLiveChatMessagesModel.fromJson(json.decode(str));
String getLiveChatMessagesModelToJson(GetLiveChatMessagesModel data) =>
    json.encode(data.toJson());

class GetLiveChatMessagesModel {
  GetLiveChatMessagesModel({
    List<Data>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLiveChatMessagesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<Data>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLiveChatMessagesModel copyWith({
    List<Data>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLiveChatMessagesModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<Data>? get data => _data;
  bool? get success => _success;
  String? get message => _message;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
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
    String? message,
    num? appointmentId,
    num? senderId,
    String? senderType,
    String? recieverId,
    String? recieverType,
    dynamic attachmentUrl,
    bool? isAttachment,
    bool? isSeen,
    dynamic seenAt,
    bool? isDelivered,
    dynamic deliveredAt,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _message = message;
    _appointmentId = appointmentId;
    _senderId = senderId;
    _senderType = senderType;
    _recieverId = recieverId;
    _recieverType = recieverType;
    _attachmentUrl = attachmentUrl;
    _isAttachment = isAttachment;
    _isSeen = isSeen;
    _seenAt = seenAt;
    _isDelivered = isDelivered;
    _deliveredAt = deliveredAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _appointmentId = json['appointment_id'];
    _senderId = json['sender_id'];
    _senderType = json['sender_type'];
    _recieverId = json['reciever_id'];
    _recieverType = json['reciever_type'];
    _attachmentUrl = json['attachment_url'];
    _isAttachment = json['is_attachment'];
    _isSeen = json['is_seen'];
    _seenAt = json['seen_at'];
    _isDelivered = json['is_delivered'];
    _deliveredAt = json['delivered_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _message;
  num? _appointmentId;
  num? _senderId;
  String? _senderType;
  String? _recieverId;
  String? _recieverType;
  dynamic _attachmentUrl;
  bool? _isAttachment;
  bool? _isSeen;
  dynamic _seenAt;
  bool? _isDelivered;
  dynamic _deliveredAt;
  String? _createdAt;
  String? _updatedAt;
  Data copyWith({
    num? id,
    String? message,
    num? appointmentId,
    num? senderId,
    String? senderType,
    String? recieverId,
    String? recieverType,
    dynamic attachmentUrl,
    bool? isAttachment,
    bool? isSeen,
    dynamic seenAt,
    bool? isDelivered,
    dynamic deliveredAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        message: message ?? _message,
        appointmentId: appointmentId ?? _appointmentId,
        senderId: senderId ?? _senderId,
        senderType: senderType ?? _senderType,
        recieverId: recieverId ?? _recieverId,
        recieverType: recieverType ?? _recieverType,
        attachmentUrl: attachmentUrl ?? _attachmentUrl,
        isAttachment: isAttachment ?? _isAttachment,
        isSeen: isSeen ?? _isSeen,
        seenAt: seenAt ?? _seenAt,
        isDelivered: isDelivered ?? _isDelivered,
        deliveredAt: deliveredAt ?? _deliveredAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get message => _message;
  num? get appointmentId => _appointmentId;
  num? get senderId => _senderId;
  String? get senderType => _senderType;
  String? get recieverId => _recieverId;
  String? get recieverType => _recieverType;
  dynamic get attachmentUrl => _attachmentUrl;
  bool? get isAttachment => _isAttachment;
  bool? get isSeen => _isSeen;
  dynamic get seenAt => _seenAt;
  bool? get isDelivered => _isDelivered;
  dynamic get deliveredAt => _deliveredAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['appointment_id'] = _appointmentId;
    map['sender_id'] = _senderId;
    map['sender_type'] = _senderType;
    map['reciever_id'] = _recieverId;
    map['reciever_type'] = _recieverType;
    map['attachment_url'] = _attachmentUrl;
    map['is_attachment'] = _isAttachment;
    map['is_seen'] = _isSeen;
    map['seen_at'] = _seenAt;
    map['is_delivered'] = _isDelivered;
    map['delivered_at'] = _deliveredAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
