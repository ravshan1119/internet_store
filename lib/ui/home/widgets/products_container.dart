import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductsContainer extends StatefulWidget {
  ProductsContainer(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.voidCallbackFavorite,
      required this.voidCallbackImage,
      this.favorite = false})
      : super(key: key);
  final String image;
  final String title;
  final String price;
  VoidCallback voidCallbackFavorite;
  VoidCallback voidCallbackImage;
  bool favorite;

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232.h,
      width: 175.w,
      child: Column(
        children: [
          Stack(
            children: [
              ZoomTapAnimation(
                onTap: widget.voidCallbackImage,
                child: Container(
                  height: 178.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20.h,
                right: 20.h,
                child: ZoomTapAnimation(
                  onTap: widget.voidCallbackFavorite,
                  child: Container(
                    height: 28.h,
                    width: 28.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.white),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: (widget.favorite
                            ? Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.c_FC6828,
                                ),
                              )
                            : Center(
                                child: Icon(
                                  Icons.heart_broken,
                                  color: AppColors.c_A8AFB9,
                                ),
                              )),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.h,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 22.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_040415,
                      fontFamily: "LeagueSpartan"),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 22.h,
                child: Text(
                  widget.price,
                  style: TextStyle(
                      fontSize: 22.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_A8AFB9,
                      fontFamily: "LeagueSpartan"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}