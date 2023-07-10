
import '../../../../model/categoies/get_products_by_categoies.dart';
import '../../../../model/universal_response.dart';
import '../../api_provider/categoies/get_product_by_categolies.dart';

class GetProductByCategoliesRepository{
  final GetProductByCategoiesProvider getProductByCategoiesProvider;
  GetProductByCategoliesRepository({
    required this.getProductByCategoiesProvider,
  });

  Future<List<GetProductsByCategoriesModel>> fetchProductCategolies() async{
    UniversalResponse universalResponse = await getProductByCategoiesProvider.getProductsByCategories();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<GetProductsByCategoriesModel> ;
    }
    return [];
  }

}