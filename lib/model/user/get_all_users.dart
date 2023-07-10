import 'package:internet_store/model/user/get_adress_users.dart';
import 'package:internet_store/model/user/get_user_name.dart';

class GetAllUsers {
  final GetAddressUsers address;
  final int id;
  final String email;
  final String username;
  final GetUserName name;
  final String phone;

  GetAllUsers({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.phone,
  });

  factory GetAllUsers.fromJson(Map<String, dynamic> json) {
    return GetAllUsers(
        address: GetAddressUsers.fromJson(json["address"]),
        id: json["id"],
        email: json["email"],
        username: json["username"],
        name: GetUserName.fromJson(json["name"]),
        phone: json["phone"]);
  }
}
