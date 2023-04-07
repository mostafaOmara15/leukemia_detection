import 'package:flutter/material.dart';
import 'package:leukemia_detection/view/resources/color_manager.dart';
import 'package:sizer/sizer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("There is no data to show", style: TextStyle(color: ColorManager.primaryColor, fontSize: 18.sp),),
      ),
    );
  }
}
