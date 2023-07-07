import 'package:flutter/material.dart';
import 'package:atiny_app/screen/device.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DeviceScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/icon.png'), // Replace with your splash screen image path
      ),
    );
  }
}