
import '../../../../model/products/all_products_model/get_product_by_id.dart';
import '../../../../model/universal_response.dart';
import '../../api_provider/products/get_product_by_id_provider.dart';

class GetProductByIdRepository{
  final GetProductByIdProvider getProductByIdProvider;
  GetProductByIdRepository({required this.getProductByIdProvider});


  Future<List<GetProductByIdModel>> fetchProductId()async{
    UniversalResponse universalResponse = await getProductByIdProvider.getProductById();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<GetProductByIdModel>;
    }
    return [];
  }


}