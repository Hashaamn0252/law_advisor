class AgoraModel {
  String? channelName;
  String? token;

  AgoraModel({String? channelName, String? token}) {
    channelName = channelName;
    token = token;
  }

  AgoraModel.fromJson(dynamic json) {
    channelName = json["channel_name"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["channel_name"] = channelName;
    map["token"] = token;
    return map;
  }
}
