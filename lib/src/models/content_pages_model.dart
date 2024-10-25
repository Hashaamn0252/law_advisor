import 'dart:convert';

GetContentPagesModel contentPagesModelFromJson(String str) =>
    GetContentPagesModel.fromJson(json.decode(str));
String contentPagesModelToJson(GetContentPagesModel data) =>
    json.encode(data.toJson());

class GetContentPagesModel {
  GetContentPagesModel({
    GetContentPagesDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetContentPagesModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetContentPagesDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetContentPagesDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetContentPagesModel copyWith({
    GetContentPagesDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetContentPagesModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetContentPagesDataModel? get data => _data;
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

GetContentPagesDataModel dataFromJson(String str) =>
    GetContentPagesDataModel.fromJson(json.decode(str));
String dataToJson(GetContentPagesDataModel data) => json.encode(data.toJson());

class GetContentPagesDataModel {
  GetContentPagesDataModel({
    num? id,
    String? name,
    String? heading,
    String? description,
    String? slug,
    num? isActive,
    num? isDefault,
    dynamic isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _heading = heading;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isDefault = isDefault;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  GetContentPagesDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _heading = json['heading'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isDefault = json['is_default'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _heading;
  String? _description;
  String? _slug;
  num? _isActive;
  num? _isDefault;
  dynamic _isFeatured;
  dynamic _icon;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  GetContentPagesDataModel copyWith({
    num? id,
    String? name,
    String? heading,
    String? description,
    String? slug,
    num? isActive,
    num? isDefault,
    dynamic isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) =>
      GetContentPagesDataModel(
        id: id ?? _id,
        name: name ?? _name,
        heading: heading ?? _heading,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isDefault: isDefault ?? _isDefault,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get heading => _heading;
  String? get description => _description;
  String? get slug => _slug;
  num? get isActive => _isActive;
  num? get isDefault => _isDefault;
  dynamic get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['heading'] = _heading;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_default'] = _isDefault;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
