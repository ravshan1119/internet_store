import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/data/models/product/product_model.dart';
import 'package:internet_store/ui/widgets/global_bottom.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';

class ProductDitailScreen extends StatefulWidget {
  const ProductDitailScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  State<ProductDitailScreen> createState() => _ProductDitailScreenState();
}

class _ProductDitailScreenState extends State<ProductDitailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_F9FAFB,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppImages.natification),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white60, Colors.lime.shade100]),
              ),
              height: 367.h,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 250.w,
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
                        fontSize: 22.spMin,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_040415,
                        fontFamily: "LeagueSpartan"),
                  ),
                ),
                Text(
                  "${widget.product.rating.rate.toString()}/5",
                  style: TextStyle(
                      fontSize: 22.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_FC6828,
                      fontFamily: "LeagueSpartan"),
                ),
                Icon(
                  Icons.star,
                  color: AppColors.c_FC6828,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${widget.product.price}",
                  style: TextStyle(
                      fontSize: 22.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_A8AFB9,
                      fontFamily: "LeagueSpartan"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 11.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 200.h,
                child: Text(
                  widget.product.description,
                  style: TextStyle(
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_A8AFB9,
                      fontFamily: "LeagueSpartan"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
            child: GlobalButton(title: "Add to cart", onTap: () {}),
          )
        ],
      ),
    );
  }
}
