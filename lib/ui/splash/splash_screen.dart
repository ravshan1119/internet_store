import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToWelcomeScreen(context);
    return Scaffold(
        backgroundColor: AppColors.c_FC6828,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.c_FC6828,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: AppColors.c_FC6828),
        ),
        body: Center(child: SvgPicture.asset(AppImages.logo)));
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return  LoginScreen();
          },
        ),
      );
    });
  }
}
