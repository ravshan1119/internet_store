
import '../../../../model/categoies/get_all_categories.dart';
import '../../../../model/universal_response.dart';
import '../../api_provider/categoies/get_all_categoies.dart';

class GetAllCategoiesRepository {
  final GetAllCategoiesProvider getAllCategoiesProvider;

  GetAllCategoiesRepository({required this.getAllCategoiesProvider});

  Future<List<GetAllCategoiesModel>> fetchAllCategoies()async{
    UniversalResponse universalResponse = await getAllCategoiesProvider.GetAllCategoies();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<GetAllCategoiesModel>;
    }
    return [];
  }


}
