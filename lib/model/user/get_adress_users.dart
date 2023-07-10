// "address": {
//             "geolocation": {
//                 "lat": "-37.3159",
//                 "long": "81.1496"
//             },
//             "city": "kilcoole",
//             "street": "new road",
//             "number": 7682,
//             "zipcode": "12926-3874"
//         },

import 'package:internet_store/model/user/get_geolocation_adress.dart';

class GetAddressUsers {
  final GetGeolocationModel geolocation;
  final String city;
  final String street;
  final num number;
  final String zipcode;

  GetAddressUsers({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory GetAddressUsers.fromJson(Map<String, dynamic> json) {
    return GetAddressUsers(
        geolocation: GetGeolocationModel.fromJson(json["geolocation"]),
        city: json["city"] as String? ?? "",
        street: json["street"] as String? ?? "",
        number: json["number"] as num? ?? 0,
        zipcode: json["zipcode"] as String? ?? "");
  }
}
