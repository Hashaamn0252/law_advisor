import 'dart:convert';

GetLawyerProfileEducationModel getLawyerProfileEducationModelFromJson(
        String str) =>
    GetLawyerProfileEducationModel.fromJson(json.decode(str));
String getLawyerProfileEducationModelToJson(
        GetLawyerProfileEducationModel data) =>
    json.encode(data.toJson());

class GetLawyerProfileEducationModel {
  GetLawyerProfileEducationModel({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLawyerProfileEducationModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLawyerProfileEducationModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLawyerProfileEducationModel(
        data: data ?? _data,
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
    List<LawyerProfileEducationModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LawyerProfileEducationModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<LawyerProfileEducationModel>? _data;
  Links? _links;
  Meta? _meta;
  Data copyWith({
    List<LawyerProfileEducationModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      Data(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<LawyerProfileEducationModel>? get data => _data;
  Links? get links => _links;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
    num? currentPage,
    num? from,
    num? lastPage,
    List<Links>? links,
    String? path,
    num? perPage,
    num? to,
    num? total,
  }) {
    _currentPage = currentPage;
    _from = from;
    _lastPage = lastPage;
    _links = links;
    _path = path;
    _perPage = perPage;
    _to = to;
    _total = total;
  }

  Meta.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _from = json['from'];
    _lastPage = json['last_page'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _path = json['path'];
    _perPage = json['per_page'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  num? _from;
  num? _lastPage;
  List<Links>? _links;
  String? _path;
  num? _perPage;
  num? _to;
  num? _total;
  Meta copyWith({
    num? currentPage,
    num? from,
    num? lastPage,
    List<Links>? links,
    String? path,
    num? perPage,
    num? to,
    num? total,
  }) =>
      Meta(
        currentPage: currentPage ?? _currentPage,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        links: links ?? _links,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        to: to ?? _to,
        total: total ?? _total,
      );
  num? get currentPage => _currentPage;
  num? get from => _from;
  num? get lastPage => _lastPage;
  List<Links>? get links => _links;
  String? get path => _path;
  num? get perPage => _perPage;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

LawyerProfileEducationModel lawyerProfileEducationModelFromJson(String str) =>
    LawyerProfileEducationModel.fromJson(json.decode(str));
String lawyerProfileEducationModelToJson(LawyerProfileEducationModel data) =>
    json.encode(data.toJson());

class LawyerProfileEducationModel {
  LawyerProfileEducationModel({
    num? id,
    num? lawyerId,
    String? institute,
    String? degree,
    String? subject,
    dynamic description,
    String? from,
    String? to,
    String? image,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _lawyerId = lawyerId;
    _institute = institute;
    _degree = degree;
    _subject = subject;
    _description = description;
    _from = from;
    _to = to;
    _image = image;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LawyerProfileEducationModel.fromJson(dynamic json) {
    _id = json['id'];
    _lawyerId = json['lawyer_id'];
    _institute = json['institute'];
    _degree = json['degree'];
    _subject = json['subject'];
    _description = json['description'];
    _from = json['from'];
    _to = json['to'];
    _image = json['image'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _lawyerId;
  String? _institute;
  String? _degree;
  String? _subject;
  dynamic _description;
  String? _from;
  String? _to;
  String? _image;
  num? _isActive;
  String? _createdAt;
  String? _updatedAt;
  LawyerProfileEducationModel copyWith({
    num? id,
    num? lawyerId,
    String? institute,
    String? degree,
    String? subject,
    dynamic description,
    String? from,
    String? to,
    String? image,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) =>
      LawyerProfileEducationModel(
        id: id ?? _id,
        lawyerId: lawyerId ?? _lawyerId,
        institute: institute ?? _institute,
        degree: degree ?? _degree,
        subject: subject ?? _subject,
        description: description ?? _description,
        from: from ?? _from,
        to: to ?? _to,
        image: image ?? _image,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get lawyerId => _lawyerId;
  String? get institute => _institute;
  String? get degree => _degree;
  String? get subject => _subject;
  dynamic get description => _description;
  String? get from => _from;
  String? get to => _to;
  String? get image => _image;
  num? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lawyer_id'] = _lawyerId;
    map['institute'] = _institute;
    map['degree'] = _degree;
    map['subject'] = _subject;
    map['description'] = _description;
    map['from'] = _from;
    map['to'] = _to;
    map['image'] = _image;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
