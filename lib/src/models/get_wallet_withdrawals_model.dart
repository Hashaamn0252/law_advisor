import 'dart:convert';

GetWalletWithdrawalsModel getWalletWithdrawalsModelFromJson(String str) =>
    GetWalletWithdrawalsModel.fromJson(json.decode(str));
String getWalletWithdrawalsModelToJson(GetWalletWithdrawalsModel data) =>
    json.encode(data.toJson());

class GetWalletWithdrawalsModel {
  GetWalletWithdrawalsModel({
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

  GetWalletWithdrawalsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetWalletWithdrawalsModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetWalletWithdrawalsModel(
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
    List<WalletWithdrawalModel>? data,
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
        _data?.add(WalletWithdrawalModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<WalletWithdrawalModel>? _data;
  Links? _links;
  Meta? _meta;
  Data copyWith({
    List<WalletWithdrawalModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      Data(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<WalletWithdrawalModel>? get data => _data;
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

WalletWithdrawalModel walletWithdrawalModelFromJson(String str) =>
    WalletWithdrawalModel.fromJson(json.decode(str));
String walletWithdrawalModelToJson(WalletWithdrawalModel data) =>
    json.encode(data.toJson());

class WalletWithdrawalModel {
  WalletWithdrawalModel({
    num? id,
    num? amount,
    String? accountHolder,
    String? accountNumber,
    String? bank,
    String? additionalNote,
    String? status,
    dynamic rejectedReason,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _amount = amount;
    _accountHolder = accountHolder;
    _accountNumber = accountNumber;
    _bank = bank;
    _additionalNote = additionalNote;
    _status = status;
    _rejectedReason = rejectedReason;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  WalletWithdrawalModel.fromJson(dynamic json) {
    _id = json['id'];
    _amount = json['amount'];
    _accountHolder = json['account_holder'];
    _accountNumber = json['account_number'];
    _bank = json['bank'];
    _additionalNote = json['additional_note'];
    _status = json['status'];
    _rejectedReason = json['rejected_reason'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _amount;
  String? _accountHolder;
  String? _accountNumber;
  String? _bank;
  String? _additionalNote;
  String? _status;
  dynamic _rejectedReason;
  String? _createdAt;
  String? _updatedAt;
  WalletWithdrawalModel copyWith({
    num? id,
    num? amount,
    String? accountHolder,
    String? accountNumber,
    String? bank,
    String? additionalNote,
    String? status,
    dynamic rejectedReason,
    String? createdAt,
    String? updatedAt,
  }) =>
      WalletWithdrawalModel(
        id: id ?? _id,
        amount: amount ?? _amount,
        accountHolder: accountHolder ?? _accountHolder,
        accountNumber: accountNumber ?? _accountNumber,
        bank: bank ?? _bank,
        additionalNote: additionalNote ?? _additionalNote,
        status: status ?? _status,
        rejectedReason: rejectedReason ?? _rejectedReason,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get amount => _amount;
  String? get accountHolder => _accountHolder;
  String? get accountNumber => _accountNumber;
  String? get bank => _bank;
  String? get additionalNote => _additionalNote;
  String? get status => _status;
  dynamic get rejectedReason => _rejectedReason;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['amount'] = _amount;
    map['account_holder'] = _accountHolder;
    map['account_number'] = _accountNumber;
    map['bank'] = _bank;
    map['additional_note'] = _additionalNote;
    map['status'] = _status;
    map['rejected_reason'] = _rejectedReason;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
