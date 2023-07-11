import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/ui/home/widgets/container_category.dart';
import 'package:internet_store/ui/home/widgets/products_container.dart';
import 'package:internet_store/ui/login/widgets/global_text_field.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_F9FAFB,
      appBar: AppBar(
        toolbarHeight: 76.h,
        backgroundColor: AppColors.c_F9FAFB,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.c_A8AFB9),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: 16.h, bottom: 16.h, right: 24.w, left: 24.w),
            child: ZoomTapAnimation(
                child: SvgPicture.asset(AppImages.natification)),
          )
        ],
        leading: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 16.h, left: 24.w, right: 0.w),
          child: ZoomTapAnimation(child: SvgPicture.asset(AppImages.more)),
        ),
        centerTitle: true,
        title: Text(
          "E-SHOP",
          style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.c_040415,
              fontFamily: "LeagueSpartan"),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GlobalTextField(
                  icon: AppImages.search,
                  hintText: "Search for tshirts, jeans, shorts, jackets",
                  controller: textEditingController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.start),
            ),
            SizedBox(
              height: 220.h,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                      category.length,
                      (index) => ZoomTapAnimation(
                          onTap: () {}, child: category[index]))
                ],
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        fontSize: 18.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_040415,
                        fontFamily: "LeagueSpartan"),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 18.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_A8AFB9,
                        fontFamily: "LeagueSpartan"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            SizedBox(
              height: 370.h,
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.754,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                children: [
                  ProductsContainer(
                    image: AppImages.man,
                    title: "a;sldkfha;lkdshf",
                    price: "\$120",
                    voidCallbackFavorite: () {},
                    voidCallbackImage: () {},
                  ),
                  ProductsContainer(
                    image: AppImages.man,
                    title: "a;sldkfha;lkdshf",
                    price: "\$120",
                    voidCallbackFavorite: () {},
                    voidCallbackImage: () {},
                  ),
                  ProductsContainer(
                    image: AppImages.man,
                    title: "a;sldkfha;lkdshf",
                    price: "\$120",
                    voidCallbackFavorite: () {},
                    voidCallbackImage: () {},
                  ),
                  ProductsContainer(
                    image: AppImages.man,
                    title: "a;sldkfha;lkdshf",
                    price: "\$120",
                    voidCallbackFavorite: () {},
                    voidCallbackImage: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<ContainerCategory> category = [
  ContainerCategory(
    color: AppColors.c_FC6828,
    category: "Women",
    image: AppImages.women,
  ),
  ContainerCategory(
    color: AppColors.c_FC6828,
    category: "Women",
    image: AppImages.women,
  ),
  ContainerCategory(
    color: AppColors.c_FC6828,
    category: "Women",
    image: AppImages.women,
  )
];
