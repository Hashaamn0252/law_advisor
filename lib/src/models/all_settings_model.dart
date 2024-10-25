import 'dart:convert';

GetAllSettingsModel getAllSettingsModelFromJson(String str) =>
    GetAllSettingsModel.fromJson(json.decode(str));
String getAllSettingsModelToJson(GetAllSettingsModel data) =>
    json.encode(data.toJson());

class GetAllSettingsModel {
  GetAllSettingsModel({
    GetAllSettingsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllSettingsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetAllSettingsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetAllSettingsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllSettingsModel copyWith({
    GetAllSettingsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllSettingsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetAllSettingsDataModel? get data => _data;
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

GetAllSettingsDataModel dataFromJson(String str) =>
    GetAllSettingsDataModel.fromJson(json.decode(str));
String dataToJson(GetAllSettingsDataModel data) => json.encode(data.toJson());

class GetAllSettingsDataModel {
  GetAllSettingsDataModel({
    String? webFacebookLink,
    dynamic webTwitterLink,
    String? logo,
    String? homeSection1Heading,
    String? homeSection1Icon,
    String? homeSection1Value,
    String? homeSection2Heading,
    String? homeSection2Icon,
    String? homeSection2Value,
    String? homeSection3Heading,
    String? homeSection3Icon,
    String? homeSection3Value,
    String? homeSection4Heading,
    String? homeSection4Icon,
    String? homeSection4Value,
    String? webYoutubeLink,
    String? webLinkedinLink,
    String? webWhatsappLink,
    String? footerCrisisSupportStatement,
    String? webInstagramLink,
    String? webSnapchatLink,
    String? webPinterestLink,
    String? webTiktokLink,
    String? homeSection5Heading,
    String? homeSection5Icon,
    String? homeSection5Value,
    String? agoraAppId,
    String? agoraAppCertificate,
    String? pusherBeamsInstanceId,
    String? pusherBeamsSecretKey,
    String? pusherAppId,
    String? pusherAppKey,
    String? pusherAppSecret,
    String? pusherAppCluster,
    String? stripeKey,
    String? stripeSecret,
    String? googleClientId,
    String? googleClientSecret,
    String? facebookClientId,
    String? facebookClientSecret,
    String? contactUsEmail,
    String? siteTitle,
    String? enableWalletSystem,
    String? commissionType,
    DefaultCurrency? defaultCurrency,
  }) {
    _webFacebookLink = webFacebookLink;
    _webTwitterLink = webTwitterLink;
    _logo = logo;
    _homeSection1Heading = homeSection1Heading;
    _homeSection1Icon = homeSection1Icon;
    _homeSection1Value = homeSection1Value;
    _homeSection2Heading = homeSection2Heading;
    _homeSection2Icon = homeSection2Icon;
    _homeSection2Value = homeSection2Value;
    _homeSection3Heading = homeSection3Heading;
    _homeSection3Icon = homeSection3Icon;
    _homeSection3Value = homeSection3Value;
    _homeSection4Heading = homeSection4Heading;
    _homeSection4Icon = homeSection4Icon;
    _homeSection4Value = homeSection4Value;
    _webYoutubeLink = webYoutubeLink;
    _webLinkedinLink = webLinkedinLink;
    _webWhatsappLink = webWhatsappLink;
    _footerCrisisSupportStatement = footerCrisisSupportStatement;
    _webInstagramLink = webInstagramLink;
    _webSnapchatLink = webSnapchatLink;
    _webPinterestLink = webPinterestLink;
    _webTiktokLink = webTiktokLink;
    _homeSection5Heading = homeSection5Heading;
    _homeSection5Icon = homeSection5Icon;
    _homeSection5Value = homeSection5Value;
    _agoraAppId = agoraAppId;
    _agoraAppCertificate = agoraAppCertificate;
    _pusherBeamsInstanceId = pusherBeamsInstanceId;
    _pusherBeamsSecretKey = pusherBeamsSecretKey;
    _pusherAppId = pusherAppId;
    _pusherAppKey = pusherAppKey;
    _pusherAppSecret = pusherAppSecret;
    _pusherAppCluster = pusherAppCluster;
    _stripeKey = stripeKey;
    _stripeSecret = stripeSecret;
    _googleClientId = googleClientId;
    _googleClientSecret = googleClientSecret;
    _facebookClientId = facebookClientId;
    _facebookClientSecret = facebookClientSecret;
    _contactUsEmail = contactUsEmail;
    _siteTitle = siteTitle;
    _enableWalletSystem = enableWalletSystem;
    _commissionType = commissionType;
    _defaultCurrency = defaultCurrency;
  }

  GetAllSettingsDataModel.fromJson(dynamic json) {
    _webFacebookLink = json['web_facebook_link'];
    _webTwitterLink = json['web_twitter_link'];
    _logo = json['logo'];
    _homeSection1Heading = json['home_section1_heading'];
    _homeSection1Icon = json['home_section1_icon'];
    _homeSection1Value = json['home_section1_value'];
    _homeSection2Heading = json['home_section2_heading'];
    _homeSection2Icon = json['home_section2_icon'];
    _homeSection2Value = json['home_section2_value'];
    _homeSection3Heading = json['home_section3_heading'];
    _homeSection3Icon = json['home_section3_icon'];
    _homeSection3Value = json['home_section3_value'];
    _homeSection4Heading = json['home_section4_heading'];
    _homeSection4Icon = json['home_section4_icon'];
    _homeSection4Value = json['home_section4_value'];
    _webYoutubeLink = json['web_youtube_link'];
    _webLinkedinLink = json['web_linkedin_link'];
    _webWhatsappLink = json['web_whatsapp_link'];
    _footerCrisisSupportStatement = json['footer_crisis_support_statement'];
    _webInstagramLink = json['web_instagram_link'];
    _webSnapchatLink = json['web_snapchat_link'];
    _webPinterestLink = json['web_pinterest_link'];
    _webTiktokLink = json['web_tiktok_link'];
    _homeSection5Heading = json['home_section5_heading'];
    _homeSection5Icon = json['home_section5_icon'];
    _homeSection5Value = json['home_section5_value'];
    _agoraAppId = json['agora_app_id'];
    _agoraAppCertificate = json['agora_app_certificate'];
    _pusherBeamsInstanceId = json['pusher_beams_instance_id'];
    _pusherBeamsSecretKey = json['pusher_beams_secret_key'];
    _pusherAppId = json['pusher_app_id'];
    _pusherAppKey = json['pusher_app_key'];
    _pusherAppSecret = json['pusher_app_secret'];
    _pusherAppCluster = json['pusher_app_cluster'];
    _stripeKey = json['stripe_key'];
    _stripeSecret = json['stripe_secret'];
    _googleClientId = json['google_client_id'];
    _googleClientSecret = json['google_client_secret'];
    _facebookClientId = json['facebook_client_id'];
    _facebookClientSecret = json['facebook_client_secret'];
    _contactUsEmail = json['contact_us_email'];
    _siteTitle = json['site_title'];
    _enableWalletSystem = json['enable_wallet_system'];
    _commissionType = json['commission_type'];
    _defaultCurrency = json['default_currency'] != null
        ? DefaultCurrency.fromJson(json['default_currency'])
        : null;
  }
  String? _webFacebookLink;
  dynamic _webTwitterLink;
  String? _logo;
  String? _homeSection1Heading;
  String? _homeSection1Icon;
  String? _homeSection1Value;
  String? _homeSection2Heading;
  String? _homeSection2Icon;
  String? _homeSection2Value;
  String? _homeSection3Heading;
  String? _homeSection3Icon;
  String? _homeSection3Value;
  String? _homeSection4Heading;
  String? _homeSection4Icon;
  String? _homeSection4Value;
  String? _webYoutubeLink;
  String? _webLinkedinLink;
  String? _webWhatsappLink;
  String? _footerCrisisSupportStatement;
  String? _webInstagramLink;
  String? _webSnapchatLink;
  String? _webPinterestLink;
  String? _webTiktokLink;
  String? _homeSection5Heading;
  String? _homeSection5Icon;
  String? _homeSection5Value;
  String? _agoraAppId;
  String? _agoraAppCertificate;
  String? _pusherBeamsInstanceId;
  String? _pusherBeamsSecretKey;
  String? _pusherAppId;
  String? _pusherAppKey;
  String? _pusherAppSecret;
  String? _pusherAppCluster;
  String? _stripeKey;
  String? _stripeSecret;
  String? _googleClientId;
  String? _googleClientSecret;
  String? _facebookClientId;
  String? _facebookClientSecret;
  String? _contactUsEmail;
  String? _siteTitle;
  String? _enableWalletSystem;
  String? _commissionType;
  DefaultCurrency? _defaultCurrency;
  GetAllSettingsDataModel copyWith({
    String? webFacebookLink,
    dynamic webTwitterLink,
    String? logo,
    String? homeSection1Heading,
    String? homeSection1Icon,
    String? homeSection1Value,
    String? homeSection2Heading,
    String? homeSection2Icon,
    String? homeSection2Value,
    String? homeSection3Heading,
    String? homeSection3Icon,
    String? homeSection3Value,
    String? homeSection4Heading,
    String? homeSection4Icon,
    String? homeSection4Value,
    String? webYoutubeLink,
    String? webLinkedinLink,
    String? webWhatsappLink,
    String? footerCrisisSupportStatement,
    String? webInstagramLink,
    String? webSnapchatLink,
    String? webPinterestLink,
    String? webTiktokLink,
    String? homeSection5Heading,
    String? homeSection5Icon,
    String? homeSection5Value,
    String? agoraAppId,
    String? agoraAppCertificate,
    String? pusherBeamsInstanceId,
    String? pusherBeamsSecretKey,
    String? pusherAppId,
    String? pusherAppKey,
    String? pusherAppSecret,
    String? pusherAppCluster,
    String? stripeKey,
    String? stripeSecret,
    String? googleClientId,
    String? googleClientSecret,
    String? facebookClientId,
    String? facebookClientSecret,
    String? contactUsEmail,
    String? siteTitle,
    String? enableWalletSystem,
    String? commissionType,
    DefaultCurrency? defaultCurrency,
  }) =>
      GetAllSettingsDataModel(
        webFacebookLink: webFacebookLink ?? _webFacebookLink,
        webTwitterLink: webTwitterLink ?? _webTwitterLink,
        logo: logo ?? _logo,
        homeSection1Heading: homeSection1Heading ?? _homeSection1Heading,
        homeSection1Icon: homeSection1Icon ?? _homeSection1Icon,
        homeSection1Value: homeSection1Value ?? _homeSection1Value,
        homeSection2Heading: homeSection2Heading ?? _homeSection2Heading,
        homeSection2Icon: homeSection2Icon ?? _homeSection2Icon,
        homeSection2Value: homeSection2Value ?? _homeSection2Value,
        homeSection3Heading: homeSection3Heading ?? _homeSection3Heading,
        homeSection3Icon: homeSection3Icon ?? _homeSection3Icon,
        homeSection3Value: homeSection3Value ?? _homeSection3Value,
        homeSection4Heading: homeSection4Heading ?? _homeSection4Heading,
        homeSection4Icon: homeSection4Icon ?? _homeSection4Icon,
        homeSection4Value: homeSection4Value ?? _homeSection4Value,
        webYoutubeLink: webYoutubeLink ?? _webYoutubeLink,
        webLinkedinLink: webLinkedinLink ?? _webLinkedinLink,
        webWhatsappLink: webWhatsappLink ?? _webWhatsappLink,
        footerCrisisSupportStatement:
            footerCrisisSupportStatement ?? _footerCrisisSupportStatement,
        webInstagramLink: webInstagramLink ?? _webInstagramLink,
        webSnapchatLink: webSnapchatLink ?? _webSnapchatLink,
        webPinterestLink: webPinterestLink ?? _webPinterestLink,
        webTiktokLink: webTiktokLink ?? _webTiktokLink,
        homeSection5Heading: homeSection5Heading ?? _homeSection5Heading,
        homeSection5Icon: homeSection5Icon ?? _homeSection5Icon,
        homeSection5Value: homeSection5Value ?? _homeSection5Value,
        agoraAppId: agoraAppId ?? _agoraAppId,
        agoraAppCertificate: agoraAppCertificate ?? _agoraAppCertificate,
        pusherBeamsInstanceId: pusherBeamsInstanceId ?? _pusherBeamsInstanceId,
        pusherBeamsSecretKey: pusherBeamsSecretKey ?? _pusherBeamsSecretKey,
        pusherAppId: pusherAppId ?? _pusherAppId,
        pusherAppKey: pusherAppKey ?? _pusherAppKey,
        pusherAppSecret: pusherAppSecret ?? _pusherAppSecret,
        pusherAppCluster: pusherAppCluster ?? _pusherAppCluster,
        stripeKey: stripeKey ?? _stripeKey,
        stripeSecret: stripeSecret ?? _stripeSecret,
        googleClientId: googleClientId ?? _googleClientId,
        googleClientSecret: googleClientSecret ?? _googleClientSecret,
        facebookClientId: facebookClientId ?? _facebookClientId,
        facebookClientSecret: facebookClientSecret ?? _facebookClientSecret,
        contactUsEmail: contactUsEmail ?? _contactUsEmail,
        siteTitle: siteTitle ?? _siteTitle,
        enableWalletSystem: enableWalletSystem ?? _enableWalletSystem,
        commissionType: commissionType ?? _commissionType,
        defaultCurrency: defaultCurrency ?? _defaultCurrency,
      );
  String? get webFacebookLink => _webFacebookLink;
  dynamic get webTwitterLink => _webTwitterLink;
  String? get logo => _logo;
  String? get homeSection1Heading => _homeSection1Heading;
  String? get homeSection1Icon => _homeSection1Icon;
  String? get homeSection1Value => _homeSection1Value;
  String? get homeSection2Heading => _homeSection2Heading;
  String? get homeSection2Icon => _homeSection2Icon;
  String? get homeSection2Value => _homeSection2Value;
  String? get homeSection3Heading => _homeSection3Heading;
  String? get homeSection3Icon => _homeSection3Icon;
  String? get homeSection3Value => _homeSection3Value;
  String? get homeSection4Heading => _homeSection4Heading;
  String? get homeSection4Icon => _homeSection4Icon;
  String? get homeSection4Value => _homeSection4Value;
  String? get webYoutubeLink => _webYoutubeLink;
  String? get webLinkedinLink => _webLinkedinLink;
  String? get webWhatsappLink => _webWhatsappLink;
  String? get footerCrisisSupportStatement => _footerCrisisSupportStatement;
  String? get webInstagramLink => _webInstagramLink;
  String? get webSnapchatLink => _webSnapchatLink;
  String? get webPinterestLink => _webPinterestLink;
  String? get webTiktokLink => _webTiktokLink;
  String? get homeSection5Heading => _homeSection5Heading;
  String? get homeSection5Icon => _homeSection5Icon;
  String? get homeSection5Value => _homeSection5Value;
  String? get agoraAppId => _agoraAppId;
  String? get agoraAppCertificate => _agoraAppCertificate;
  String? get pusherBeamsInstanceId => _pusherBeamsInstanceId;
  String? get pusherBeamsSecretKey => _pusherBeamsSecretKey;
  String? get pusherAppId => _pusherAppId;
  String? get pusherAppKey => _pusherAppKey;
  String? get pusherAppSecret => _pusherAppSecret;
  String? get pusherAppCluster => _pusherAppCluster;
  String? get stripeKey => _stripeKey;
  String? get stripeSecret => _stripeSecret;
  String? get googleClientId => _googleClientId;
  String? get googleClientSecret => _googleClientSecret;
  String? get facebookClientId => _facebookClientId;
  String? get facebookClientSecret => _facebookClientSecret;
  String? get contactUsEmail => _contactUsEmail;
  String? get siteTitle => _siteTitle;
  String? get enableWalletSystem => _enableWalletSystem;
  String? get commissionType => _commissionType;
  DefaultCurrency? get defaultCurrency => _defaultCurrency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['web_facebook_link'] = _webFacebookLink;
    map['web_twitter_link'] = _webTwitterLink;
    map['logo'] = _logo;
    map['home_section1_heading'] = _homeSection1Heading;
    map['home_section1_icon'] = _homeSection1Icon;
    map['home_section1_value'] = _homeSection1Value;
    map['home_section2_heading'] = _homeSection2Heading;
    map['home_section2_icon'] = _homeSection2Icon;
    map['home_section2_value'] = _homeSection2Value;
    map['home_section3_heading'] = _homeSection3Heading;
    map['home_section3_icon'] = _homeSection3Icon;
    map['home_section3_value'] = _homeSection3Value;
    map['home_section4_heading'] = _homeSection4Heading;
    map['home_section4_icon'] = _homeSection4Icon;
    map['home_section4_value'] = _homeSection4Value;
    map['web_youtube_link'] = _webYoutubeLink;
    map['web_linkedin_link'] = _webLinkedinLink;
    map['web_whatsapp_link'] = _webWhatsappLink;
    map['footer_crisis_support_statement'] = _footerCrisisSupportStatement;
    map['web_instagram_link'] = _webInstagramLink;
    map['web_snapchat_link'] = _webSnapchatLink;
    map['web_pinterest_link'] = _webPinterestLink;
    map['web_tiktok_link'] = _webTiktokLink;
    map['home_section5_heading'] = _homeSection5Heading;
    map['home_section5_icon'] = _homeSection5Icon;
    map['home_section5_value'] = _homeSection5Value;
    map['agora_app_id'] = _agoraAppId;
    map['agora_app_certificate'] = _agoraAppCertificate;
    map['pusher_beams_instance_id'] = _pusherBeamsInstanceId;
    map['pusher_beams_secret_key'] = _pusherBeamsSecretKey;
    map['pusher_app_id'] = _pusherAppId;
    map['pusher_app_key'] = _pusherAppKey;
    map['pusher_app_secret'] = _pusherAppSecret;
    map['pusher_app_cluster'] = _pusherAppCluster;
    map['stripe_key'] = _stripeKey;
    map['stripe_secret'] = _stripeSecret;
    map['google_client_id'] = _googleClientId;
    map['google_client_secret'] = _googleClientSecret;
    map['facebook_client_id'] = _facebookClientId;
    map['facebook_client_secret'] = _facebookClientSecret;
    map['contact_us_email'] = _contactUsEmail;
    map['site_title'] = _siteTitle;
    map['enable_wallet_system'] = _enableWalletSystem;
    map['commission_type'] = _commissionType;
    if (_defaultCurrency != null) {
      map['default_currency'] = _defaultCurrency?.toJson();
    }
    return map;
  }
}

DefaultCurrency defaultCurrencyFromJson(String str) =>
    DefaultCurrency.fromJson(json.decode(str));
String defaultCurrencyToJson(DefaultCurrency data) =>
    json.encode(data.toJson());

class DefaultCurrency {
  DefaultCurrency({
    num? id,
    String? name,
    String? code,
    String? symbol,
    String? direction,
    num? decimalPlaces,
    num? value,
    num? isDefault,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _symbol = symbol;
    _direction = direction;
    _decimalPlaces = decimalPlaces;
    _value = value;
    _isDefault = isDefault;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DefaultCurrency.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _symbol = json['symbol'];
    _direction = json['direction'];
    _decimalPlaces = json['decimal_places'];
    _value = json['value'];
    _isDefault = json['is_default'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _code;
  String? _symbol;
  String? _direction;
  num? _decimalPlaces;
  num? _value;
  num? _isDefault;
  num? _isActive;
  String? _createdAt;
  String? _updatedAt;
  DefaultCurrency copyWith({
    num? id,
    String? name,
    String? code,
    String? symbol,
    String? direction,
    num? decimalPlaces,
    num? value,
    num? isDefault,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) =>
      DefaultCurrency(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        symbol: symbol ?? _symbol,
        direction: direction ?? _direction,
        decimalPlaces: decimalPlaces ?? _decimalPlaces,
        value: value ?? _value,
        isDefault: isDefault ?? _isDefault,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get symbol => _symbol;
  String? get direction => _direction;
  num? get decimalPlaces => _decimalPlaces;
  num? get value => _value;
  num? get isDefault => _isDefault;
  num? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['symbol'] = _symbol;
    map['direction'] = _direction;
    map['decimal_places'] = _decimalPlaces;
    map['value'] = _value;
    map['is_default'] = _isDefault;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
