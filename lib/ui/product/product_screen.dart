import 'package:flutter/material.dart';
import 'package:internet_store/data/network/api_provider/products/all_product_provider.dart';
import 'package:internet_store/data/network/api_repository/products/all_product_repository.dart';
import 'package:internet_store/model/products/all_products_model/all_products_model.dart';
import 'package:internet_store/ui/product/widgets/product_container.dart';
import 'package:internet_store/ui/product/widgets/product_deteil_screen.dart';
import 'package:internet_store/ui/product/widgets/product_screen_shimmer.dart';
import 'package:internet_store/ui/user/user_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final AllProductRepository allProductRepository =
      AllProductRepository(allProductProvider: AllProductProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersScreen()));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: FutureBuilder<List<AllProductsModel>>(
        future: allProductRepository.fetchCardsForHome(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<AllProductsModel>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProductScreenShimmer();
          } else if (snapshot.hasData) {
            List<AllProductsModel> allProducts = snapshot.data!;
            return allProducts.isNotEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.55,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            children: [
                              ...List.generate(
                                  allProducts.length,
                                  (index) => ZoomTapAnimation(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailScreen(
                                                          allProducts:
                                                              allProducts[index])));
                                        },
                                        child: ProductContainer(
                                            allProducts: allProducts,
                                            index: index),
                                      ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const Center(child: Text("Xatolik sodir bo'ldi"));
          }
          return Center(child: Text("Error:${snapshot.error}"));
        },
      ),
    );
  }
}
