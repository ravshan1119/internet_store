import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/products/all_products_model/get_product_by_limit.dart';
import '../../../../model/universal_response.dart';

class GetProductByLimitProvider {
  Future<UniversalResponse> getProductByLimit() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products?limit=5");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => GetProductByLimitModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "error");
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
