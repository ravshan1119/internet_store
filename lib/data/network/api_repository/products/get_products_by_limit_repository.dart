
import '../../../../model/products/all_products_model/get_product_by_limit.dart';
import '../../../../model/universal_response.dart';
import '../../api_provider/products/get_products_by_limit.dart';

class GetProductByLimitRepository {
  final GetProductByLimitProvider getProductByLimitProvider;
  GetProductByLimitRepository({
    required this.getProductByLimitProvider,
  });

  Future<List<GetProductByLimitModel>> fetchProductLimit() async {
    UniversalResponse universalResponse =
        await getProductByLimitProvider.getProductByLimit();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<GetProductByLimitModel>;
    }
    return [];
  }
}
