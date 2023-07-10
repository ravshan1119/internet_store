
import 'package:internet_store/model/products/all_products_model/all_products_model.dart';

import '../../../../model/universal_response.dart';
import '../../api_provider/products/get_all_product.dart';

class GetAllProductRepository {
  final GetAllProductProvider getAllProductProvider;

  GetAllProductRepository({required this.getAllProductProvider});

  Future<List<AllProductsModel>> fetchAllProduct() async {
    UniversalResponse universalResponse =
        await getAllProductProvider.getAllProduct();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<AllProductsModel>;
    }
    return [];
  }
}



