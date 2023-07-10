import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/products/all_products_model/all_products_model.dart';
import '../../../../model/universal_response.dart';

class AllProductProvider {
  Future<UniversalResponse> getAllProducts() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => AllProductsModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }
}