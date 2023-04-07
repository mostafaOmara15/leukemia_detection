import 'package:flutter/material.dart';
import 'package:leukemia_detection/view/resources/color_manager.dart';
import 'package:leukemia_detection/view/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
      return MaterialApp(
        
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              color: ColorManager.primaryColor,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500)
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: ColorManager.primaryColor,
            selectedItemColor: ColorManager.secondaryColor,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}
