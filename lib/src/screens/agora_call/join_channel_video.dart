import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/api_services/post_service.dart';
import 'package:lawyer_consultant_for_lawyers/src/screens/agora_call/repo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resize/resize.dart';

import '../../api_services/local_notification_service.dart';
import '../../api_services/urls.dart';
import '../../config/app_colors.dart';
import '../../config/app_font.dart';
import '../../controllers/general_controller.dart';
import 'agora.config.dart' as config;
import 'agora_logic.dart';

/// MultiChannel Example
class JoinChannelVideo extends StatefulWidget {
  const JoinChannelVideo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JoinChannelVideo> {
  late final RtcEngine _engine;

  bool isJoined = false, switchCamera = true, switchRender = true;
  // List<int> remoteUid = [];
  int? remoteUid;
  bool localUserJoined = false;
  _callEndCheckMethod() {
    if (callEnd == 2) {
      _leaveChannel();
      Get.back();
    }
  }

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    log("${Get.arguments[0]} ARGUMENT");
    log("${Get.find<GeneralController>().appointmentObject} OBJECT");
    postMethod(
        context,
        makeAgoraCall,
        {
          "appointment": {
            "customer_id": Get.find<GeneralController>()
                .selectedAppointmentHistoryForView
                .customerId,
            "id": Get.find<GeneralController>()
                .selectedAppointmentHistoryForView
                .id
          },
          "channel": Get.find<GeneralController>().channelForCall,
          "token": Get.find<GeneralController>().tokenForCall
        },
        // {
        //   "appointment": Get.find<GeneralController>().appointmentObject,
        //   "channel": Get.find<GeneralController>().selectedChannel,
        //   "token": Get.find<GeneralController>().tokenForCall
        // },
        true,
        makeAgoraCallRepo);

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _callEndCheckMethod();
    });
    // if (Get.find<GeneralController>().callerType == 1) {
    Future.delayed(
      const Duration(seconds: 2),
    ).whenComplete(() => _joinChannel());
    // }

    _initEngine();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
    _engine.destroy();
  }

  int? callEnd = 0;

  _initEngine() async {
    _engine =
        await RtcEngine.createWithContext(RtcEngineContext(config.agoraAppId));
    _addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.enableLocalVideo(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    await _engine.setVideoEncoderConfiguration(configuration);
  }

  _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          isJoined = true;
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          remoteUid = uid;
          callEnd = 1;
        });
      },
      userOffline: (uid, reason) {
        setState(() {
          remoteUid = uid;
          if (callEnd == 1) {
            callEnd = 2;
          }
        });
        // if (remoteUid.isEmpty) {}
      },
      leaveChannel: (stats) {
        _leaveChannel();
        setState(() {
          isJoined = false;
          remoteUid = null;
          // remoteUid.clear();
        });
      },
    ));
  }

  Future<dynamic> _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }
    await _engine.joinChannel(
        Get.find<GeneralController>().tokenForCall,
        Get.find<GeneralController>().channelForCall!,
        null,
        Get.find<GeneralController>().callerType);
    _addListeners();
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: _renderVideo(),
        onWillPop: () async {
          return false;
        });
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  bool muted = false;

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : AppColors.primaryColor,
              size: 20.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? AppColors.primaryColor : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () {
              _leaveChannel();
              // _onCallEnd(context);
              Get.back();
            },
            child: const Icon(
              Icons.clear,
              color: Colors.white,
              size: 35.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: const Icon(
              Icons.switch_camera,
              color: AppColors.primaryColor,
              size: 20.0,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  _renderVideo() {
    return SafeArea(
      child: Stack(
        children: [
          remoteUid == 0
              ? const SizedBox()
              : remoteUid == null
                  ? CircularProgressIndicator()
                  : RtcRemoteView.SurfaceView(
                      channelId: Get.find<GeneralController>().channelForCall!,
                      uid: remoteUid!,
                    ),
          const SizedBox(
            width: 120,
            height: 120,
            child: RtcLocalView.SurfaceView(),
          ),
          _toolbar(),
          // remoteUid.isEmpty
          // ?
          // const SizedBox(),
          // SizedBox(
          //     width: 120,
          //     height: 120,
          //     child: (RtcRemoteView.SurfaceView(
          //       channelId: Get.find<GeneralController>().channelForCall!,
          //       uid: remoteUid,
          //     ))),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: SizedBox(
          //     width: 100,
          //     height: 150,
          //     child: Center(
          //         child: localUserJoined
          //             ? AgoraVideoView(
          //                 controller: VideoViewController(
          //                   // useAndroidSurfaceView: true,
          //                   rtcEngine: _engine,
          //                   canvas: VideoCanvas(uid: remoteUid),
          //                 ),
          //               )
          //             : CircularProgressIndicator()),
          //   ),
          // ),
          // : rtc_remote_view.SurfaceView(
          //     channelId:
          //         Get.find<GeneralController>().channelForCall!,
          //     uid: remoteUid[0],
          //   ),
          // SizedBox(
          //   width: 120,
          //   height: 120,
          //   child: RtcLocalView.SurfaceView(),
          // ),
          _toolbar()
        ],
      ),
    );
  }

  _ringingView() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryColor,
              AppColors.customDialogSuccessColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Container(
                height: 130.h,
                width: 130.w,
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/splash_logo.png'))),
              ),
              isJoined
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 27.h, 0, 0),
                      child: Text(
                        'Ringing',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: AppFont.primaryFontFamily,
                            color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 27.h, 0, 0),
                      child: Text(
                        'Calling',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: AppFont.primaryFontFamily,
                            color: Colors.white),
                      ),
                    ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RawMaterialButton(
                      onPressed: () {
                        _leaveChannel();
                        _onCallEnd(context);
                        LocalNotificationService.cancelAllNotifications();
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      shape: const CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.redAccent,
                      padding: const EdgeInsets.all(15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _receiverView() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryColor,
              AppColors.customDialogSuccessColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset(
                'assets/images/law-hammer.png',
                width: MediaQuery.of(context).size.width * .6,
              )),
              Text(
                'Call Alert',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: AppFont.primaryFontFamily,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                // '${LanguageConstant.youAreReceivingCallFrom.tr}'
                '${Get.find<GeneralController>().storageBox.read('userRole').toString().toUpperCase() == 'MENTEE' ? 'CONSULTANT' : 'USER'}',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: AppFont.primaryFontFamily,
                    color: Colors.white),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              LocalNotificationService.cancelAllNotifications();
                              _leaveChannel();
                              Get.back();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 35.r,
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 35.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              LocalNotificationService.cancelAllNotifications();
                              _joinChannel();
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.green,
                              radius: 35.r,
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 35.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
