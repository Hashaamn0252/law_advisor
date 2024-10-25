
import 'package:flutter/material.dart';

class SplashBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/lawyer-splash-screen.png',
        fit: BoxFit.cover,
        // fit: BoxFit.cover,
        // alignment: Alignment.bottomCenter,
      ),
    );
  }
}
