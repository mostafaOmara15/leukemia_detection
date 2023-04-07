import 'dart:async';
import 'package:flutter/material.dart';
import 'package:leukemia_detection/view/resources/color_manager.dart';
import 'package:sizer/sizer.dart';
import 'onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    super.initState();
       Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: SizedBox(
          height: 40.h,
          width: 40.h,
          child: Image.asset("assets/splash_screen.png")
        ),
      )
    );
  }
}

