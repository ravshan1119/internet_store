import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/data/models/product/product_model.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/category_repo.dart';
import 'package:internet_store/data/network/repositories/product_repo.dart';
import 'package:internet_store/ui/home/widgets/container_category.dart';
import 'package:internet_store/ui/home/widgets/home_screen_shimmer.dart';
import 'package:internet_store/ui/home/widgets/products_container.dart';
import 'package:internet_store/ui/login/widgets/global_text_field.dart';
import 'package:internet_store/ui/product_ditail/product_ditail_screen.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productsAll = [];
  List<ProductModel> products = [];
  List<ProductModel> productsElectronics = [];
  List<ProductModel> productsJewelery = [];
  List<ProductModel> productsWomenClothing = [];
  List<ProductModel> productsMensClothing = [];
  List<ProductModel> productsByLimit = [];
  List<String> category = [];

  ProductRepo productRepo = ProductRepo(apiProvider: ApiProvider());
  CategoryRepo categoryRepo = CategoryRepo(apiProvider: ApiProvider());

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerLimit = TextEditingController();
  int number = 0;
  bool isLoading = false;
  List categorilar = [];

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    productsAll = await productRepo.getAllProducts();

    products = await productRepo.getAllProducts();
    category = await categoryRepo.getAllCategories();
    productsElectronics =
        await productRepo.getProductsByCategory("electronics");
    productsJewelery = await productRepo.getProductsByCategory("jewelery");
    productsWomenClothing =
        await productRepo.getProductsByCategory("women's clothing");
    productsMensClothing =
        await productRepo.getProductsByCategory("men's clothing");

    productsByLimit = await productRepo.getProductsByLimit(number);

    path = products;

    categorilar.addAll([
      products,
      productsElectronics,
      productsJewelery,
      productsMensClothing,
      productsWomenClothing
    ]);
    setState(() {
      isLoading = false;
    });
  }

  late List<ProductModel> path;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

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
            padding: EdgeInsets.only(
                top: 16.h, bottom: 16.h, left: 24.w, right: 0.w),
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
        body: isLoading
            ? const Center(child: HomeScreenShimmer())
            : products.isEmpty
                ? const Center(child: Text("Connection error"))
                : Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 74.h,
                                  width: 250.w,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: GlobalTextField(
                                        icon: AppImages.search,
                                        hintText:
                                            "Search for tshirts, jeans, shorts, jackets",
                                        controller: textEditingController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.search,
                                        textAlign: TextAlign.start),
                                  ),
                                ),
                                SizedBox(
                                  height: 74.h,
                                  width: 150.w,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 24.w),
                                      child: TextField(
                                        onChanged: (v) {
                                          setState(() {
                                            setState(() {
                                              number = int.parse(v);
                                              path = productsByLimit;
                                            });
                                          });
                                        },
                                        style: TextStyle(
                                            fontSize: 16.spMin,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.c_040415,
                                            fontFamily: "LeagueSpartan"),
                                        textAlign: TextAlign.start,
                                        textInputAction: TextInputAction.send,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.white,
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: SvgPicture.asset(
                                                AppImages.more),
                                          ),
                                          hintText: "limit",
                                          hintStyle: TextStyle(
                                              fontSize: 16.spMin,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.c_A8AFB9,
                                              fontFamily: "LeagueSpartan"),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColors.white),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 220.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ZoomTapAnimation(
                                    onTap: () {
                                      path = categorilar[0];
                                      setState(() {});
                                    },
                                    child: ContainerCategory(
                                      color: AppColors.c_FC6828,
                                      category: "All",
                                      image: AppImages.women,
                                    ),
                                  ),
                                  ...List.generate(
                                      category.length,
                                      (index) => ZoomTapAnimation(
                                            onTap: () {
                                              path = categorilar[index + 1];
                                              setState(() {});
                                            },
                                            child: ContainerCategory(
                                              color: AppColors.c_FC6828,
                                              category: category[index],
                                              image: AppImages.women,
                                            ),
                                          ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 37.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recommended",
                                    style: TextStyle(
                                        fontSize: 18.spMin,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.c_040415,
                                        fontFamily: "LeagueSpartan"),
                                  ),
                                  ZoomTapAnimation(
                                    onTap: () {
                                      setState(() {
                                        path = products;
                                      });
                                    },
                                    child: Text(
                                      "See all",
                                      style: TextStyle(
                                          fontSize: 18.spMin,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.c_A8AFB9,
                                          fontFamily: "LeagueSpartan"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29.h,
                            ),
                            SizedBox(
                              height: 380.h,
                              child: GridView(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.754,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                children: [
                                  ...List.generate(
                                    path.length,
                                    (index) {
                                      return ProductsContainer(
                                        image: path[index].image,
                                        title: path[index].title,
                                        price: "\$${path[index].price}",
                                        voidCallbackFavorite: () {},
                                        voidCallbackImage: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDitailScreen(
                                                product: path[index],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 21.h,
                        left: 24.w,
                        right: 24.w,
                        child: Container(
                          height: 78.h,
                          width: 366.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44.sp),
                              color: AppColors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(AppImages.home),
                              SvgPicture.asset(AppImages.cart),
                              Icon(
                                Icons.person,
                                color: AppColors.c_A8AFB9,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
  }
}
