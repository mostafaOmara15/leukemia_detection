import 'package:flutter/material.dart';
import 'package:leukemia_detection/view/resources/color_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        titleSpacing: 10.w,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.5.h,
            ),

            Text("Latest news...",
                style: TextStyle(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp)),

            SizedBox(
              height: 1.h,
            ),

            ImageSlideshow(
              width: double.infinity,
              height: 30.h,
              indicatorRadius: 5,
              initialPage: 0,
              indicatorColor: ColorManager.secondaryColor,
              indicatorBackgroundColor: ColorManager.primaryColor,
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                InkWell(
                    child: Stack(children: [
                      Image.asset(
                        'assets/LeukemiaWBC_share.jpg',
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Text("New drug offers hope for people with aggressive cancers",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    ]),
                    onTap: () {}),
                InkWell(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 5.h,
                            backgroundColor: ColorManager.primaryColor,
                            child: Icon(
                              Icons.arrow_forward,
                              color: ColorManager.secondaryColor,
                              size: 7.w,
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Text(
                            "Read more",
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    onTap: () {}
                ),
              ],
            ),

            SizedBox(
              height: 3.h,
            ),

            Text("Over view about leukemia",
                style: TextStyle(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp)),

            SizedBox(
              height: 1.5.h,
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.grey.shade100,
                  child: Text(
                    "Leukemia is cancer of the body's blood-forming tissues, including the bone marrow and the lymphatic system. Many types of leukemia exist. Some forms of leukemia are more common in children. Other forms of leukemia occur mostly in adults. Leukemia usually involves the white blood cells. Your white blood cells are potent infection fighters — they normally grow and divide in an orderly way, as your body needs them. But in people with leukemia, the bone marrow produces an excessive amount of abnormal white blood cells, which don't function properly. Treatment for leukemia can be complex — depending on the type of leukemia and other factors. But there are strategies and resources that can help make your treatment successful.",
                    style: TextStyle(color: ColorManager.primaryColor, fontSize: 14.sp),

                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
