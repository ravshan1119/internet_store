class GetAllCategoiesModel{
  final List<String> allCategoies ;
  GetAllCategoiesModel(
    {
      required this.allCategoies,
    }
  );

  factory GetAllCategoiesModel.fromJson(List<String> list){
    return GetAllCategoiesModel(allCategoies: list);
  }
}