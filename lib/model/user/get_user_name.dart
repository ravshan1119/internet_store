class GetUserName{
  final String firstname;
  final String lastname;
  GetUserName(
    {required this.firstname,
    required this.lastname,}
  );

  factory GetUserName.fromJson(Map<String,dynamic> json){
    return GetUserName(firstname: json["firstname"] as String? ?? "", lastname: json["lastname"] as String? ?? "");
  }
}