class GetConfigCredentialModel {
  GetConfigCredentialModel({
      Data? data, 
      bool? success, 
      String? message, 
      dynamic errors,}){
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
}

  GetConfigCredentialModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
GetConfigCredentialModel copyWith({  Data? data,
  bool? success,
  String? message,
  dynamic errors,
}) => GetConfigCredentialModel(  data: data ?? _data,
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

class Data {
  Data({
      List<Firebase>? firebase, 
      List<Pusher>? pusher, 
      List<Agora>? agora,}){
    _firebase = firebase;
    _pusher = pusher;
    _agora = agora;
}

  Data.fromJson(dynamic json) {
    if (json['firebase'] != null) {
      _firebase = [];
      json['firebase'].forEach((v) {
        _firebase?.add(Firebase.fromJson(v));
      });
    }
    if (json['pusher'] != null) {
      _pusher = [];
      json['pusher'].forEach((v) {
        _pusher?.add(Pusher.fromJson(v));
      });
    }
    if (json['agora'] != null) {
      _agora = [];
      json['agora'].forEach((v) {
        _agora?.add(Agora.fromJson(v));
      });
    }
  }
  List<Firebase>? _firebase;
  List<Pusher>? _pusher;
  List<Agora>? _agora;
Data copyWith({  List<Firebase>? firebase,
  List<Pusher>? pusher,
  List<Agora>? agora,
}) => Data(  firebase: firebase ?? _firebase,
  pusher: pusher ?? _pusher,
  agora: agora ?? _agora,
);
  List<Firebase>? get firebase => _firebase;
  List<Pusher>? get pusher => _pusher;
  List<Agora>? get agora => _agora;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_firebase != null) {
      map['firebase'] = _firebase?.map((v) => v.toJson()).toList();
    }
    if (_pusher != null) {
      map['pusher'] = _pusher?.map((v) => v.toJson()).toList();
    }
    if (_agora != null) {
      map['agora'] = _agora?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Agora {
  Agora({
      String? name, 
      String? displayName, 
      String? value, 
      String? category,}){
    _name = name;
    _displayName = displayName;
    _value = value;
    _category = category;
}

  Agora.fromJson(dynamic json) {
    _name = json['name'];
    _displayName = json['display_name'];
    _value = json['value'];
    _category = json['category'];
  }
  String? _name;
  String? _displayName;
  String? _value;
  String? _category;
Agora copyWith({  String? name,
  String? displayName,
  String? value,
  String? category,
}) => Agora(  name: name ?? _name,
  displayName: displayName ?? _displayName,
  value: value ?? _value,
  category: category ?? _category,
);
  String? get name => _name;
  String? get displayName => _displayName;
  String? get value => _value;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['display_name'] = _displayName;
    map['value'] = _value;
    map['category'] = _category;
    return map;
  }

}

class Pusher {
  Pusher({
      String? name, 
      String? displayName, 
      String? value, 
      String? category,}){
    _name = name;
    _displayName = displayName;
    _value = value;
    _category = category;
}

  Pusher.fromJson(dynamic json) {
    _name = json['name'];
    _displayName = json['display_name'];
    _value = json['value'];
    _category = json['category'];
  }
  String? _name;
  String? _displayName;
  String? _value;
  String? _category;
Pusher copyWith({  String? name,
  String? displayName,
  String? value,
  String? category,
}) => Pusher(  name: name ?? _name,
  displayName: displayName ?? _displayName,
  value: value ?? _value,
  category: category ?? _category,
);
  String? get name => _name;
  String? get displayName => _displayName;
  String? get value => _value;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['display_name'] = _displayName;
    map['value'] = _value;
    map['category'] = _category;
    return map;
  }

}

class Firebase {
  Firebase({
      String? name, 
      String? displayName, 
      String? value, 
      String? category,}){
    _name = name;
    _displayName = displayName;
    _value = value;
    _category = category;
}

  Firebase.fromJson(dynamic json) {
    _name = json['name'];
    _displayName = json['display_name'];
    _value = json['value'];
    _category = json['category'];
  }
  String? _name;
  String? _displayName;
  String? _value;
  String? _category;
Firebase copyWith({  String? name,
  String? displayName,
  String? value,
  String? category,
}) => Firebase(  name: name ?? _name,
  displayName: displayName ?? _displayName,
  value: value ?? _value,
  category: category ?? _category,
);
  String? get name => _name;
  String? get displayName => _displayName;
  String? get value => _value;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['display_name'] = _displayName;
    map['value'] = _value;
    map['category'] = _category;
    return map;
  }

}