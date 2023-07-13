import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/data/local/storage_repository.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/login_repo.dart';
import 'package:internet_store/ui/home/home_screen.dart';
import 'package:internet_store/ui/login/widgets/global_text_field.dart';
import 'package:internet_store/ui/widgets/global_bottom.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:internet_store/utils/utility_function.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.loginRepo}) : super(key: key);
  final LoginRepo loginRepo;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  LoginRepo loginRepo = LoginRepo(apiProvider: ApiProvider());

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    return Scaffold(
        backgroundColor: AppColors.c_F9FAFB,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                          onChanged: (value) {
                            username = value;
                          },
                          icon: AppImages.user,
                          hintText: "username",
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
                          onChanged: (value) {
                            password = value;
                          },
                          icon: AppImages.password,
                          hintText: "password",
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
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
                          onTap: () async {
                            StorageRepository.putString("token", "token");

                            if (true) {
                              setState(() {
                                isLoading = true;
                              });
                              bool isLogged = await widget.loginRepo.loginUser(
                                username: username,
                                password: password,
                              );
                              setState(() {
                                isLoading = false;
                              });
                              if (isLogged && context.mounted) {
                                showCustomMessage(context, "User Logged");
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeScreen();
                                    },
                                  ),
                                );
                              } else {
                                showCustomMessage(context, "Error occurred...");
                              }
                            }

                            bool isLogged = await loginRepo.loginUser(
                              username: username,
                              password: password,
                            );
                            if (isLogged && context.mounted) {
                              StorageRepository.putString("token", "token");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } else {}
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
