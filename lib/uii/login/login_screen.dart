import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/uii/home/home_screen.dart';
import 'package:internet_store/uii/login/widgets/global_text_field.dart';
import 'package:internet_store/uii/widgets/global_bottom.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingControllerUsername =
        TextEditingController();
    TextEditingController textEditingControllerPassword =
        TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.c_F9FAFB,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 66.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: AppColors.c_FC6828),
                    height: 76.h,
                    width: 76.h,
                    child: Center(
                        child: Text(
                      "E",
                      style: TextStyle(
                          fontSize: 38.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "LeagueSpartan"),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 128.h,
              ),
              Text(
                "Login to e-Shop",
                style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.c_040415,
                    fontFamily: "LeagueSpartan"),
              ),
              SizedBox(
                height: 44.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalTextField(
                    icon: AppImages.user,
                    hintText: "username",
                    controller: textEditingControllerUsername,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalTextField(
                    icon: AppImages.password,
                    hintText: "password",
                    controller: textEditingControllerPassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    textAlign: TextAlign.start),
              ),
              SizedBox(
                height: 24.h,
              ),
              ZoomTapAnimation(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_040415,
                      fontFamily: "LeagueSpartan"),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                    title: "Login",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 70.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 42.h,
                    width: 42.h,
                    child: ZoomTapAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.facebook)),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 42.h,
                    width: 42.h,
                    child: ZoomTapAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.google)),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 42.h,
                    width: 42.h,
                    child: ZoomTapAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(AppImages.iphone)),
                  ),
                ],
              ),
              SizedBox(
                height: 93.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_A8AFB9,
                        fontFamily: "LeagueSpartan"),
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_FC6828,
                          fontFamily: "LeagueSpartan"),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
