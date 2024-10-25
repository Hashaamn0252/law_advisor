import 'package:get/get.dart';

import 'agora_model.dart';

class AgoraLogic extends GetxController {
  AgoraModel agoraModel = AgoraModel();
  AgoraModel agoraModelDefault = AgoraModel();

  String? userName;
  String? userImage;
  final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
