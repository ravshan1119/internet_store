

import 'package:internet_store/model/products/all_products_model/rating_model.dart';

class AllProductsModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;


  AllProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  }
  );

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      price: json["price"] as num? ?? 0,
      description: json["description"] as String? ?? "",
      category: json["category"] as String? ?? "",
      image: json["image"] as String? ?? "",
      rating: RatingModel.fromJson(json["rating"]),
    );
  }
}
