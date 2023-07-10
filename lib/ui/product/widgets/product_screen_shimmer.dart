import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ProductScreenShimmer extends StatefulWidget {
  const ProductScreenShimmer({Key? key}) : super(key: key);

  @override
  State<ProductScreenShimmer> createState() => _ProductScreenShimmerState();
}

class _ProductScreenShimmerState extends State<ProductScreenShimmer> {
  @override
  Widget build(BuildContext context) {
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
  }
}
