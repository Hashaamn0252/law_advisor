class GetGeneralSettingModel {
  GetGeneralSettingModel({
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

  GetGeneralSettingModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetGeneralSettingModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetGeneralSettingModel(
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

class Data {
  Data({
    num? id,
    String? logo,
    String? title,
    String? tagline,
    String? seoDes,
    String? seoKeywords,
    String? facebookLink,
    String? twitterLink,
    String? linkdenLink,
    String? address,
    String? phone,
    String? companyEmail,
    String? currencySymbol,
    String? aboutCompany,
    String? loginType,
    dynamic longitude,
    dynamic latitude,
  }) {
    _id = id;
    _logo = logo;
    _title = title;
    _tagline = tagline;
    _seoDes = seoDes;
    _seoKeywords = seoKeywords;
    _facebookLink = facebookLink;
    _twitterLink = twitterLink;
    _linkdenLink = linkdenLink;
    _address = address;
    _phone = phone;
    _companyEmail = companyEmail;
    _currencySymbol = currencySymbol;
    _aboutCompany = aboutCompany;
    _longitude = longitude;
    _latitude = latitude;
    _loginType = loginType;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _logo = json['logo'];
    _title = json['title'];
    _tagline = json['tagline'];
    _seoDes = json['seo_Des'];
    _seoKeywords = json['seo_keywords'];
    _facebookLink = json['facebook_link'];
    _twitterLink = json['twitter_link'];
    _linkdenLink = json['linkden_link'];
    _address = json['address'];
    _phone = json['phone'];
    _companyEmail = json['company_email'];
    _currencySymbol = json['currency_symbol'];
    _aboutCompany = json['about_company'];
    _loginType = json['login_type'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  num? _id;
  String? _logo;
  String? _title;
  String? _tagline;
  String? _seoDes;
  String? _seoKeywords;
  String? _facebookLink;
  String? _twitterLink;
  String? _linkdenLink;
  String? _address;
  String? _phone;
  String? _companyEmail;
  String? _currencySymbol;
  String? _aboutCompany;
  String? _loginType;
  dynamic _longitude;
  dynamic _latitude;
  Data copyWith(
          {num? id,
          String? logo,
          String? title,
          String? tagline,
          String? seoDes,
          String? seoKeywords,
          String? facebookLink,
          String? twitterLink,
          String? linkdenLink,
          String? address,
          String? phone,
          String? companyEmail,
          String? currencySymbol,
          String? aboutCompany,
          String? loginType,
          dynamic longitude,
          dynamic latitude}) =>
      Data(
        id: id ?? _id,
        logo: logo ?? _logo,
        title: title ?? _title,
        tagline: tagline ?? _tagline,
        seoDes: seoDes ?? _seoDes,
        seoKeywords: seoKeywords ?? _seoKeywords,
        facebookLink: facebookLink ?? _facebookLink,
        twitterLink: twitterLink ?? _twitterLink,
        linkdenLink: linkdenLink ?? _linkdenLink,
        address: address ?? _address,
        phone: phone ?? _phone,
        companyEmail: companyEmail ?? _companyEmail,
        currencySymbol: currencySymbol ?? _currencySymbol,
        aboutCompany: aboutCompany ?? _aboutCompany,
        loginType: loginType ?? _loginType,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
      );
  num? get id => _id;
  String? get logo => _logo;
  String? get title => _title;
  String? get tagline => _tagline;
  String? get seoDes => _seoDes;
  String? get seoKeywords => _seoKeywords;
  String? get facebookLink => _facebookLink;
  String? get twitterLink => _twitterLink;
  String? get linkdenLink => _linkdenLink;
  String? get address => _address;
  String? get phone => _phone;
  String? get companyEmail => _companyEmail;
  String? get currencySymbol => _currencySymbol;
  String? get aboutCompany => _aboutCompany;
  String? get loginType => _loginType;
  dynamic get longitude => _longitude;
  dynamic get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo'] = _logo;
    map['title'] = _title;
    map['tagline'] = _tagline;
    map['seo_Des'] = _seoDes;
    map['seo_keywords'] = _seoKeywords;
    map['facebook_link'] = _facebookLink;
    map['twitter_link'] = _twitterLink;
    map['linkden_link'] = _linkdenLink;
    map['address'] = _address;
    map['phone'] = _phone;
    map['company_email'] = _companyEmail;
    map['currency_symbol'] = _currencySymbol;
    map['about_company'] = _aboutCompany;
    map['login_type'] = _loginType;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }
}
