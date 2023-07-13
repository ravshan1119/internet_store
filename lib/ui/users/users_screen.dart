import 'package:flutter/material.dart';
import 'package:internet_store/data/local/storage_repository.dart';
import 'package:internet_store/data/models/user/user_model.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/login_repo.dart';
import 'package:internet_store/data/network/repositories/user_repo.dart';
import 'package:internet_store/ui/login/login_screen.dart';
import 'package:internet_store/ui/users/widgets/users_ditail_screen.dart';
import 'package:internet_store/ui/widgets/global_bottom.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UserRepo userRepo = UserRepo(apiProvider: ApiProvider());
  List<UserModel> users = [];

  _fetchData() async {
    users = await userRepo.getAllUsers(username: "donero", password: "ewedon");
  }

  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    _fetchData();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_FC6828,
        elevation: 0,
        title: const Text("users screen"),
      ),
      body: isLoading
          ? const Center(
              child: Column(
              children: [
                Text("Loading..."),
                CircularProgressIndicator(),
              ],
            ))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                          users.length,
                          (index) => ZoomTapAnimation(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UsersDitailScreen(
                                          userModel: users[index]),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(users[index].name.firstname),
                                  subtitle: Text(users[index].name.lastname),
                                  leading: const Icon(Icons.person),
                                ),
                              ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(42),
                  child: GlobalButton(
                      title: "LogIn",
                      onTap: () {
                        StorageRepository.deleteString("token");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      loginRepo:
                                          LoginRepo(apiProvider: ApiProvider()),
                                    )));
                      }),
                )
              ],
            ),
    );
  }
}
