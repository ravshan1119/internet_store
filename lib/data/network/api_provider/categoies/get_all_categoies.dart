import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/categoies/get_all_categories.dart';
import '../../../../model/universal_response.dart';

class GetAllCategoiesProvider {
  Future<UniversalResponse> GetAllCategoies() async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => GetAllCategoiesModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "error");
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
