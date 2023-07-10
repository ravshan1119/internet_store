

import '../../../../model/products/all_products_model/all_products_model.dart';
import '../../../../model/universal_response.dart';
import '../../api_provider/products/all_product_provider.dart';

class AllProductRepository {
  final AllProductProvider allProductProvider;

  AllProductRepository({required this.allProductProvider});

  Future<List<AllProductsModel>> fetchCardsForHome() async {
    UniversalResponse universalResponse = await allProductProvider.getAllProducts();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<AllProductsModel>;
    }
    return [];
  }

}
