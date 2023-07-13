import 'package:flutter/material.dart';
import 'package:internet_store/data/models/user/user_model.dart';
import 'package:internet_store/utils/app_colors.dart';

class UsersDitailScreen extends StatelessWidget {
  UsersDitailScreen({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_FC6828,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Email:  ${userModel.email}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.c_FC6828,
              fontSize: 20,
            ),
          ),
          Text(
            "Username:  ${userModel.username}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.c_FC6828,
              fontSize: 20,
            ),
          ),
          Text(
            "Password:  ${userModel.password}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.c_FC6828,
              fontSize: 20,
            ),
          ),
          Text(
            "Phone:  ${userModel.phone}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.c_FC6828,
              fontSize: 20,
            ),
          ),
          Text(
            "Address:  ${userModel.address}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.c_FC6828,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
