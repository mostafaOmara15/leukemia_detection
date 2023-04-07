import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/background_final_button.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:leukemia_detection/view/resources/color_manager.dart';
import 'package:sizer/sizer.dart';
import 'layout_screen.dart';

class OnBoardingScreen extends StatelessWidget {

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Get start',
      onFinish: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AppLayout()),
        );
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: ColorManager.primaryColor,
      ),

      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorManager.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),

      controllerColor: ColorManager.primaryColor,
      totalPage: 2,
      headerBackgroundColor: Color(0xfff2f3f7),
      pageBackgroundColor: Color(0xfff2f3f7),

      background: [
        SizedBox(
          height: 50.h,
          width: 48.h,
          child: Image.asset(
            'assets/onboarding1.jpg',
            fit:BoxFit.fill,
            height: 47.5.h,
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 48.h,
          child: Image.asset(
            'assets/onboarding2.jpg',
            fit:BoxFit.fill,
            height: 47.5.h,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Offers an additional insight.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:ColorManager.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'This application was mainly designed to provide a new point of view as a way of coping with the rapid development of the Artificial intelligence field.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Disclaimer! This application does not provide medical advice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'No material is intended to be a substitute for professional medical service',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}