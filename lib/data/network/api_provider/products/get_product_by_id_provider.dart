import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/products/all_products_model/get_product_by_id.dart';
import '../../../../model/universal_response.dart';

class GetProductByIdProvider {
  Future<UniversalResponse> getProductById() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/3");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => GetProductByIdModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "erroe");
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
