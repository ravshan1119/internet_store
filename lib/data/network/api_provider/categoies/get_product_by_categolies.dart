import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/categoies/get_products_by_categoies.dart';
import '../../../../model/universal_response.dart';

class GetProductByCategoiesProvider {
  Future<UniversalResponse> getProductsByCategories() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/category/jewelery");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => GetProductsByCategoriesModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error:  "error");
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
