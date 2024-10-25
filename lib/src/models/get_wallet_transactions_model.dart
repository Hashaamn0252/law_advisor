import 'dart:convert';

GetWalletTransactionsModel getWalletTransactionsModelFromJson(String str) =>
    GetWalletTransactionsModel.fromJson(json.decode(str));
String getWalletTransactionsModelToJson(GetWalletTransactionsModel data) =>
    json.encode(data.toJson());

class GetWalletTransactionsModel {
  GetWalletTransactionsModel({
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

  GetWalletTransactionsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetWalletTransactionsModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetWalletTransactionsModel(
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
    List<WalletTransactionModel>? data,
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
        _data?.add(WalletTransactionModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<WalletTransactionModel>? _data;
  Links? _links;
  Meta? _meta;
  Data copyWith({
    List<WalletTransactionModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      Data(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<WalletTransactionModel>? get data => _data;
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

WalletTransactionModel walletTransactionsModelFromJson(String str) =>
    WalletTransactionModel.fromJson(json.decode(str));
String walletTransactionsModelToJson(WalletTransactionModel data) =>
    json.encode(data.toJson());

class WalletTransactionModel {
  WalletTransactionModel({
    num? id,
    String? payableType,
    num? payableId,
    num? walletId,
    String? type,
    String? amount,
    bool? confirmed,
    String? uuid,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _payableType = payableType;
    _payableId = payableId;
    _walletId = walletId;
    _type = type;
    _amount = amount;
    _confirmed = confirmed;
    _uuid = uuid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  WalletTransactionModel.fromJson(dynamic json) {
    _id = json['id'];
    _payableType = json['payable_type'];
    _payableId = json['payable_id'];
    _walletId = json['wallet_id'];
    _type = json['type'];
    _amount = json['amount'];
    _confirmed = json['confirmed'];
    _uuid = json['uuid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _payableType;
  num? _payableId;
  num? _walletId;
  String? _type;
  String? _amount;
  bool? _confirmed;
  String? _uuid;
  String? _createdAt;
  String? _updatedAt;
  WalletTransactionModel copyWith({
    num? id,
    String? payableType,
    num? payableId,
    num? walletId,
    String? type,
    String? amount,
    bool? confirmed,
    String? uuid,
    String? createdAt,
    String? updatedAt,
  }) =>
      WalletTransactionModel(
        id: id ?? _id,
        payableType: payableType ?? _payableType,
        payableId: payableId ?? _payableId,
        walletId: walletId ?? _walletId,
        type: type ?? _type,
        amount: amount ?? _amount,
        confirmed: confirmed ?? _confirmed,
        uuid: uuid ?? _uuid,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get payableType => _payableType;
  num? get payableId => _payableId;
  num? get walletId => _walletId;
  String? get type => _type;
  String? get amount => _amount;
  bool? get confirmed => _confirmed;
  String? get uuid => _uuid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['payable_type'] = _payableType;
    map['payable_id'] = _payableId;
    map['wallet_id'] = _walletId;
    map['type'] = _type;
    map['amount'] = _amount;
    map['confirmed'] = _confirmed;
    map['uuid'] = _uuid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
