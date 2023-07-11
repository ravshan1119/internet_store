import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ContainerCategory extends StatefulWidget {
  const ContainerCategory(
      {Key? key, required this.color, required this.category, required this.image})
      : super(key: key);

  @override
  State<ContainerCategory> createState() => _ContainerCategoryState();
  final Color color;
  final String category;
  final String image;
}

class _ContainerCategoryState extends State<ContainerCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w),
      child: Stack(
        children: [
          Container(
            height: 220.h,
            width: 309.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 186.h,
                  width: 309.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    color: widget.color,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 29.h, left: 24.w),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                          fontSize: 26.spMin,
                          fontWeight: FontWeight.w600,
                          color: AppColors.c_F9FAFB,
                          fontFamily: "LeagueSpartan"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,

              child: SizedBox(
                  height: 220.h,
                  width: 200.w,
                  child: Image.asset(widget.image)))
        ],
      ),
    );
  }
}
