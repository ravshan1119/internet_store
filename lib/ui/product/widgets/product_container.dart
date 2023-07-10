import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/products/all_products_model/all_products_model.dart';
class ProductContainer extends StatefulWidget {
  ProductContainer({
    required this.allProducts,
    required this.index,
    Key? key}) : super(key: key);

  @override
  State<ProductContainer> createState() => _ProductContainerState();
  List<AllProductsModel> allProducts;
  final int index;
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity / 2 - 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.0,
              blurRadius: 2,
              offset: const Offset(3.0, 3.0)),
          BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.0,
              blurRadius: 2 / 2.0,
              offset: const Offset(3.0, 3.0)),
          const BoxShadow(
              color: Colors.white,
              spreadRadius: 2.0,
              blurRadius: 2,
              offset: Offset(-3.0, -3.0)),
          const BoxShadow(
              color: Colors.white,
              spreadRadius: 2.0,
              blurRadius: 2 / 2,
              offset: Offset(-3.0, -3.0)),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blue
            ]),
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
                  imageUrl: widget.allProducts[widget.index].image,
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
              widget.allProducts[widget.index]
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
                    widget.allProducts[widget.index]
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
                widget.allProducts[widget.index]
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
                widget.allProducts[widget.index]
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
    );
  }
}
