import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_store/model/products/all_products_model/all_products_model.dart';

import '../../../../model/universal_response.dart';

class GetAllProductProvider {
  Future<UniversalResponse> getAllProduct() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => AllProductsModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: "error");
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
