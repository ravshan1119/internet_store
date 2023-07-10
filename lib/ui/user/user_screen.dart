import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internet_store/data/network/api_provider/categoies/get_product_by_categolies.dart';
import 'package:internet_store/data/network/api_repository/categoies/get_product_by_categolies.dart';
import 'package:internet_store/model/categoies/get_products_by_categoies.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final GetProductByCategoliesRepository getProductByCategoliesRepository =
  GetProductByCategoliesRepository(getProductByCategoiesProvider: GetProductByCategoiesProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: FutureBuilder<List<GetProductsByCategoriesModel>>(
        future: getProductByCategoliesRepository.fetchProductCategolies(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<GetProductsByCategoriesModel>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  children: [
                    ...List.generate(
                        6,
                            (index) => Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5,top: 2.5, bottom: 2.5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,

                            ),
                          ),
                        ))
                  ],
                ));
          } else if (snapshot.hasData) {
            List<GetProductsByCategoriesModel> allProducts = snapshot.data!;
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
                      physics: BouncingScrollPhysics(),
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
                              onTap: () {},
                              child: Container(
                                height: 150,
                                width: double.infinity / 2 - 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  color: Colors.lightBlueAccent,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                          child: CachedNetworkImage(
                                            imageUrl: allProducts[index].image,
                                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        allProducts[index]
                                            .price
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                            FontWeight.w700,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets
                                            .symmetric(horizontal: 5),
                                        child: Center(
                                          child: Text(
                                              allProducts[index]
                                                  .title,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors
                                                      .black87)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                        ),
                                        Text(
                                          allProducts[index]
                                              .rating
                                              .rate
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text(
                                          "Count: ",
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                        Text(
                                          allProducts[index]
                                              .rating
                                              .count
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
