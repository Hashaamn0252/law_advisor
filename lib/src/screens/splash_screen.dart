import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/app_font.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_appointment_history_controller.dart';

import '../routes.dart';
import '../widgets/background_widgets/splash_screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final logic = Get.put(LawyerAppointmentHistoryController());

  late AnimationController animationController;
  late Animation<double> animation;
  late AnimationController _controller;
  late Animation<double> _animation;

  startTime() async {
    var duration = const Duration(seconds: 5);

    return Timer(duration, checkFirstSeenAndNavigate);
  }

  Future checkFirstSeenAndNavigate() async {
    bool seen =
        (Get.find<GeneralController>().storageBox.read('seen') ?? false);

    if (seen) {
      Get.toNamed(PageRoutes.homeScreen);
    } else {
      await Get.find<GeneralController>().storageBox.write('seen', true);
      Get.toNamed(PageRoutes.introScreen);
    }
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    startTime();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 10800),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Positioned(child: SplashBackgroundWidget()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Container(
                    width: animation.value * 450,
                    height: animation.value * 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/app-icon.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  // Controls how the text should be aligned horizontally
                  textAlign: TextAlign.center,
                  // Whether the text should break at soft line breaks
                  softWrap: true,
                  text: const TextSpan(
                    text: 'Law ',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFont.primaryFontFamily,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Advisor',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.primaryFontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
