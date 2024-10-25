import 'dart:convert';

GetAllBlogPostsModel allBlogPostsModelFromJson(String str) =>
    GetAllBlogPostsModel.fromJson(json.decode(str));
String allBlogPostsModelToJson(GetAllBlogPostsModel data) =>
    json.encode(data.toJson());

class GetAllBlogPostsModel {
  GetAllBlogPostsModel({
    GetAllBlogPostsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllBlogPostsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetAllBlogPostsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetAllBlogPostsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllBlogPostsModel copyWith({
    GetAllBlogPostsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllBlogPostsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetAllBlogPostsDataModel? get data => _data;
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

GetAllBlogPostsDataModel dataFromJson(String str) =>
    GetAllBlogPostsDataModel.fromJson(json.decode(str));
String dataToJson(GetAllBlogPostsDataModel data) => json.encode(data.toJson());

class GetAllBlogPostsDataModel {
  GetAllBlogPostsDataModel({
    List<BlogModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetAllBlogPostsDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BlogModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<BlogModel>? _data;
  Links? _links;
  Meta? _meta;
  GetAllBlogPostsDataModel copyWith({
    List<BlogModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetAllBlogPostsDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<BlogModel>? get data => _data;
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
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
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
  int? _currentPage;
  int? _from;
  int? _lastPage;
  List<Links>? _links;
  String? _path;
  int? _perPage;
  int? _to;
  int? _total;
  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
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
  int? get currentPage => _currentPage;
  int? get from => _from;
  int? get lastPage => _lastPage;
  List<Links>? get links => _links;
  String? get path => _path;
  int? get perPage => _perPage;
  int? get to => _to;
  int? get total => _total;

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

BlogModel blogFromJson(String str) => BlogModel.fromJson(json.decode(str));
String blogToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    int? id,
    int? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<int>? tagIds,
    List<Tags>? tags,
    int? blogCategoryId,
    String? blogCategoryName,
    String? name,
    String? description,
    String? slug,
    int? isActive,
    int? isFeatured,
    dynamic icon,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _lawyerId = lawyerId;
    _lawyerName = lawyerName;
    _lawFirmId = lawFirmId;
    _lawFirmName = lawFirmName;
    _tagIds = tagIds;
    _tags = tags;
    _blogCategoryId = blogCategoryId;
    _blogCategoryName = blogCategoryName;
    _name = name;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BlogModel.fromJson(dynamic json) {
    _id = json['id'];
    _lawyerId = json['lawyer_id'];
    _lawyerName = json['lawyer_name'];
    _lawFirmId = json['law_firm_id'];
    _lawFirmName = json['law_firm_name'];
    _tagIds = json['tag_ids'] != null ? json['tag_ids'].cast<int>() : [];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _blogCategoryId = json['blog_category_id'];
    _blogCategoryName = json['blog_category_name'];
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _lawyerId;
  String? _lawyerName;
  dynamic _lawFirmId;
  String? _lawFirmName;
  List<int>? _tagIds;
  List<Tags>? _tags;
  int? _blogCategoryId;
  String? _blogCategoryName;
  String? _name;
  String? _description;
  String? _slug;
  int? _isActive;
  int? _isFeatured;
  dynamic _icon;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  BlogModel copyWith({
    int? id,
    int? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<int>? tagIds,
    List<Tags>? tags,
    int? blogCategoryId,
    String? blogCategoryName,
    String? name,
    String? description,
    String? slug,
    int? isActive,
    int? isFeatured,
    dynamic icon,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      BlogModel(
        id: id ?? _id,
        lawyerId: lawyerId ?? _lawyerId,
        lawyerName: lawyerName ?? _lawyerName,
        lawFirmId: lawFirmId ?? _lawFirmId,
        lawFirmName: lawFirmName ?? _lawFirmName,
        tagIds: tagIds ?? _tagIds,
        tags: tags ?? _tags,
        blogCategoryId: blogCategoryId ?? _blogCategoryId,
        blogCategoryName: blogCategoryName ?? _blogCategoryName,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get lawyerId => _lawyerId;
  String? get lawyerName => _lawyerName;
  dynamic get lawFirmId => _lawFirmId;
  String? get lawFirmName => _lawFirmName;
  List<int>? get tagIds => _tagIds;
  List<Tags>? get tags => _tags;
  int? get blogCategoryId => _blogCategoryId;
  String? get blogCategoryName => _blogCategoryName;
  String? get name => _name;
  String? get description => _description;
  String? get slug => _slug;
  int? get isActive => _isActive;
  int? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lawyer_id'] = _lawyerId;
    map['lawyer_name'] = _lawyerName;
    map['law_firm_id'] = _lawFirmId;
    map['law_firm_name'] = _lawFirmName;
    map['tag_ids'] = _tagIds;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['blog_category_id'] = _blogCategoryId;
    map['blog_category_name'] = _blogCategoryName;
    map['name'] = _name;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));
String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  Tags({
    int? id,
    String? name,
    dynamic description,
    String? slug,
    int? isActive,
    int? isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Tags.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  dynamic _description;
  String? _slug;
  int? _isActive;
  int? _isFeatured;
  dynamic _icon;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  Tags copyWith({
    int? id,
    String? name,
    dynamic description,
    String? slug,
    int? isActive,
    int? isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Tags(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get name => _name;
  dynamic get description => _description;
  String? get slug => _slug;
  int? get isActive => _isActive;
  int? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
