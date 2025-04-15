// import 'dart:async';
import 'dart:async';
import 'package:intershipapp/welcome.dart';

import 'package:flutter/material.dart';

// import 'welcome_screeen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 7),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "WORK",
                      style: TextStyle(
                          color: Color(0xff946CC3),
                          fontSize: 42,
                          fontFamily: 'Azonix'),
                    ),
                    TextSpan(
                      text: "SHALA",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 42,
                          fontFamily: 'Azonix'),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ));
    });
  }
}
