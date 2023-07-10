class GetGeolocationModel {
  final String lat;
  final String long;

  GetGeolocationModel({
    required this.lat,
    required this.long,
  });

  factory GetGeolocationModel.fromJson(Map<String, dynamic> json) {
    return GetGeolocationModel(
        lat: json["lat"] as String? ?? "", long: json["long"] as String? ?? "");
  }
}
