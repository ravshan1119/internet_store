import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class HomeScreenShimmer extends StatefulWidget {
  const HomeScreenShimmer({Key? key}) : super(key: key);

  @override
  State<HomeScreenShimmer> createState() => _HomeScreenShimmerState();
}

class _HomeScreenShimmerState extends State<HomeScreenShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          2,
                          (index) => Padding(
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                  height: 186.h,
                                  width: 309.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16.sp),
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 37.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey),
                      ),
                      Container(
                        height: 2.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                SizedBox(
                  height: 380.h,
                  child: GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.754,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    children: [
                      ...List.generate(
                        6,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              height: 232.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 0.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 21.h,
            left: 24.w,
            right: 24.w,
            child: Container(
              height: 78.h,
              width: 366.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.sp),
                  color: AppColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppImages.home),
                  SvgPicture.asset(AppImages.cart),
                  Icon(
                    Icons.person,
                    color: AppColors.c_A8AFB9,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
