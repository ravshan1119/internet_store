import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/data/local/storage_repository.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/ui/home/home_screen.dart';
import 'package:internet_store/ui/tab_box/tab_box.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';

import '../../data/network/repositories/login_repo.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final ApiProvider apiProvider = ApiProvider();
  String token = "";

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
    token = StorageRepository.getString("token");

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            print("AAAAAAAAAAAA $token");
            return token.isNotEmpty
                ? TabBox(apiProvider: apiProvider)
                : LoginScreen(
                    loginRepo: LoginRepo(apiProvider: apiProvider),
                  );
          },
        ),
      );
    });
  }
}
